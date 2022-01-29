import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthMethods{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    // required Uint8List profileImage, // file
  }) async{
      String res = "Some error occurred ";            
    try {
      if(email.isNotEmpty || password.isNotEmpty || username.isNotEmpty || bio.isNotEmpty ){
      //register user (firebase)
      UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      // print(cred.user!.uid); NÃO ESTÁ RODANDO

      // add user to our database
      await _firestore.collection("users").doc(cred.user!.uid).set({
        "username": username,
        "uid": cred.user!.uid,
        "email": email,
        "bio": bio,
        "followers": [],
        "following": [],
      });
      res = "success!";
      }
    } catch(err){      
      err.toString();
    }
    return res;
  }
}