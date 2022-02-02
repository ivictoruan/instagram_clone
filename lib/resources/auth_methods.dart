// import 'dart:typed_data';

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';
import 'package:instagram_clone/models/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!; // get current user from firebase
    
    DocumentSnapshot snapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snapshot);
  }

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    required Uint8List file,
    required String bio,
  }) async {
    String res = "Aconteceu algum erro!";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        //register user (firebase)
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        debugPrint(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage("ProfilePics", file, false);
  
        // add user to our database
        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoUrl: photoUrl,
        );
        await _firestore.collection("users").doc(cred.user!.uid).set(user.toJson());
        res = "success!";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // login user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Ocurreu algum erro!";

    try{
      if(email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword( // logging user
            email: email, password: password);
        res = "success!";
      }else{
        res = "Preencha todos os campos!";
      }

    }catch(err){
      res = err.toString();
    }
  return res; 
  }
}
