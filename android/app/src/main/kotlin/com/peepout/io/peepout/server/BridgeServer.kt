package com.peepout.io.peepout.server

import android.provider.Telephony.Carriers.PORT
import android.util.Log
import com.squareup.moshi.JsonClass
import com.squareup.moshi.Moshi
import com.squareup.moshi.Types
import org.java_websocket.WebSocket
import org.java_websocket.handshake.ClientHandshake
import org.java_websocket.server.WebSocketServer
import java.lang.Exception
import java.lang.ref.WeakReference
import java.net.InetSocketAddress
import java.util.*
import java.util.concurrent.ConcurrentHashMap

class BridgeServer(moshi: Moshi) : WebSocketServer(InetSocketAddress(PORT)) {
    @JsonClass(generateAdapter = true)

    private val adapter = moshi.adapter<Map<String, String>>(

        Types.newParameterizedType(
            Map::class.java,
            String::class.java,
            String::class.java
        )
    )

    private val pubs: MutableMap<String, MutableList<WeakReference<WebSocket>>> = ConcurrentHashMap()
    private val pubsLock = Any()
    private val pubsCache: MutableMap<String, String?> = ConcurrentHashMap()

    override fun onOpen(conn: WebSocket?, handshake: ClientHandshake?) {


        Log.d("#####", "onOpen: ${conn?.remoteSocketAddress?.address?.hostAddress}")
    }

    override fun onClose(conn: WebSocket?, code: Int, reason: String?, remote: Boolean) {
        Log.d("#####", "onClose: ${conn?.remoteSocketAddress?.address?.hostAddress}")
        conn?.let { cleanUpSocket(it) }
    }

    override fun onMessage(conn: WebSocket?, message: String?) {


        Log.d("#####", "Message: $message")
        var check = message
        check =check?.replace("true","\"true\"")
        Log.d("Kashif","$check")

        try {
            conn ?: error("Unknown socket")
            check?.also {
                Log.d("Kashif","pub")
                val msg = adapter.fromJson(it) ?: error("Invalid message")//error
                val type: String = msg["type"] ?: error("Type not found")
                val topic: String = msg["topic"] ?: error("Topic not found")

                when (type) {
                    "pub" -> {

                        var sendMessage = false
                        pubs[topic]?.forEach { r ->
                            r.get()?.apply {
                                send(check)
                                sendMessage = true
                                Log.d("Kashif","pub")
                            }
                        }
                        if (!sendMessage) {
                            Log.d("#####", "Cache message: $check")
                            pubsCache[topic] = check
                        }
                    }
                    "sub" -> {

                        pubs.getOrPut(topic, { mutableListOf() }).add(WeakReference(conn))
                        pubsCache[topic]?.let { cached ->
                            Log.d("#####", "Send cached: $cached")
                            conn.send(cached)
                        }

                    }
                    else -> error("Unknown type")
                }
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    override fun onStart() {
        Log.d("#####", "Server started")
        connectionLostTimeout = 1000000000
    }

    override fun onError(conn: WebSocket?, ex: Exception?) {
        Log.d("#####", "onError")
        ex?.printStackTrace()
        conn?.let { cleanUpSocket(it) }
    }

    private fun cleanUpSocket(conn: WebSocket) {
        synchronized(pubsLock) {
            pubs.forEach {
                it.value.removeAll { r -> r.get().let { v -> v == null || v == conn } }
            }
        }
    }

    companion object {
        val PORT = 8080 + Random().nextInt(1000)
    }
}