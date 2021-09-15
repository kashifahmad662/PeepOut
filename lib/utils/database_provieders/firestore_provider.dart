



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:peepout/model/user_model.dart';

class fireStoreProvider{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> userExists(String userPrivateKey) async {
    final QuerySnapshot result = await _firestore.collection("users").where('publickey',isEqualTo: userPrivateKey).get();
    final List<DocumentSnapshot> docs = result.docs;
    if(docs.length==0){
      return false;
    }
    else{
      return true;
    }
  }

  Future<void> registerUser(userModel usermodel) async {
    return _firestore
        .collection("users").doc(usermodel.publickey).set(usermodel.tomap());
  }

  
}