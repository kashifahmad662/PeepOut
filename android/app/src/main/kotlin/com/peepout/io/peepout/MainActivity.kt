package com.peepout.io.peepout

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.os.PersistableBundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import org.walletconnect.Session
import org.walletconnect.nullOnThrow

class MainActivity: FlutterActivity(),Session.Callback {
    private val CHANNEL = "peepout"
    var AccountAddress = "Max"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine);
        MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler { call, result ->
            if (call.method!!.contentEquals("connectWallet")) {
                ConnectToCryproWallet()
                //AccountAddress = ExampleApplication.session.approvedAccounts().toString();
                result.success(AccountAddress)
            }
            else if(call.method!!.contentEquals("getWalletAddress")){
                var UserKey = ExampleApplication.session.approvedAccounts().toString()
                UserKey = UserKey.replace("[","")
                UserKey = UserKey.replace("]","")
                result.success(UserKey)
            }
        }
    }





    private var txRequest: Long? = null
    private val uiScope = CoroutineScope(Dispatchers.Main)

    override fun onStatus(status: Session.Status) {
        when(status) {
            Session.Status.Approved -> sessionApproved()
            Session.Status.Closed -> sessionClosed()
            Session.Status.Connected,
            Session.Status.Disconnected,
            is Session.Status.Error -> {
                // Do Stuff
            }
        }
    }

    override fun onMethodCall(call: Session.MethodCall) {
    }
    private fun sessionApproved() {
        uiScope.launch {
            AccountAddress = ExampleApplication.session.approvedAccounts().toString();
            //val connectedAccount = "Connected: ${ExampleApplication.session.approvedAccounts()}"

        }
    }

    private fun sessionClosed() {
        uiScope.launch {
//            screen_main_status.text = "Disconnected"
//            screen_main_connect_button.visibility = View.VISIBLE
//            screen_main_disconnect_button.visibility = View.GONE
//            screen_main_tx_button.visibility = View.GONE
        }
    }

    fun ConnectToCryproWallet() {
        ExampleApplication.resetSession()
        ExampleApplication.session.addCallback(this)
        val i = Intent(Intent.ACTION_VIEW)
        i.data = Uri.parse(ExampleApplication.config.toWCUri())
        startActivity(i)
    }

    override fun onStart() {
        super.onStart()
        initialSetup()






//        screen_main_disconnect_button.setOnClickListener {
//            ExampleApplication.session.kill()
//        }
//        screen_main_tx_button.setOnClickListener {
//            val from = ExampleApplication.session.approvedAccounts()?.first()
//                ?: return@setOnClickListener
//            val txRequest = System.currentTimeMillis()
//            ExampleApplication.session.performMethodCall(
//                Session.MethodCall.SendTransaction(
//                    txRequest,
//                    from,
//                    "0x24EdA4f7d0c466cc60302b9b5e9275544E5ba552",
//                    null,
//                    null,
//                    null,
//                    "0x5AF3107A4000",
//                    ""
//                ),
//                ::handleResponse
//            )
//            this.txRequest = txRequest
//        }
    }

    private fun initialSetup() {
        val session = nullOnThrow { ExampleApplication.session } ?: return
        session.addCallback(this)
        sessionApproved()
    }

    private fun handleResponse(resp: Session.MethodCall.Response) {
        if (resp.id == txRequest) {
            txRequest = null
            uiScope.launch {
//                screen_main_response.visibility = View.VISIBLE
//                screen_main_response.text = "Last response: " + ((resp.result as? String) ?: "Unknown response")
            }
        }
    }

    override fun onDestroy() {
        ExampleApplication.session.removeCallback(this)
        super.onDestroy()
    }


}
