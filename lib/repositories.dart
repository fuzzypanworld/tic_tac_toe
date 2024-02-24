import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_toe/game.dart';

part 'repositories.g.dart';

class Repository {
  Repository({required this.firebaseAuth, required this.firebaseDatabase});

  final FirebaseAuth firebaseAuth;
  final FirebaseDatabase firebaseDatabase;
  Stream<User?> userStream() {
    return firebaseAuth.authStateChanges();
  }

  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) {
    return firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<UserCredential> signInAsGuest() async {
    return firebaseAuth.signInAnonymously();
  }

  Future<void> signOut() {
    return firebaseAuth.signOut();
  }
  Future<Game?> fetchGame({required String gameId}) async{
    final reference = firebaseDatabase.ref('games').child(gameId);
    final snapshot = await reference.get();
    if (snapshot.exists) {
      // fetch game logic
      final data = snapshot.value as Map;
      return Game.fromJson(Map<String, Object?>.from(data));
    } 
    return null;
  }

  void editGame({required game}) {}

}

@riverpod
Repository repository(RepositoryRef ref) {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  return Repository(
      firebaseAuth: firebaseAuth, firebaseDatabase: firebaseDatabase);
}
