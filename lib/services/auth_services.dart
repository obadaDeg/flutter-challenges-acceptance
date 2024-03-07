import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenges_acceptance/services/firestore_services.dart';
import 'package:flutter_challenges_acceptance/utils/api_paths.dart';
import 'package:flutter_challenges_acceptance/services/auth_services.dart';

abstract class AuthServices {
  Future<User?> currentUser();
  Future<bool> signInWithEmailAndPassword(String email, String password);
  Future<bool> signUpWithEmailAndPassword(
      String email, String password, String username);
  Future<void> signOut();
}

class AuthServicesImpl implements AuthServices {
  final firebaseAuth = FirebaseAuth.instance;
  final firestoreServices = FirestoreService.instance;

  @override
  Future<User?> currentUser() async {
    return Future.value(firebaseAuth.currentUser);
  }

  @override
  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    log('asdf');
    // final userCredential = await firebaseAuth.signInWithEmailAndPassword(
    //     email: email, password: password);
    // log('checking user');
    // User? user = userCredential.user;

    // if (user != null) {
    //   log('done to sign in');

    //   return true;
    // } else {
    //   log('Failed to sign in');
    //   return false;
    // }

    return true;
  }

  @override
  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<bool> signUpWithEmailAndPassword(
      String email, String password, String username) async {
    final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    User? user = userCredential.user;
    if (user != null) {
      await firestoreServices.setData(path: ApiPaths.user(user.uid), data: {
        'uid': user.uid,
        'email': user.email,
        'username': username,
        'name': user.displayName,
        'photoUrl': user.photoURL,
        'phone': user.phoneNumber,
      });

      return true;
    }
    return false;
  }
}
