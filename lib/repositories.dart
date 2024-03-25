import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'game.dart';

part 'repositories.g.dart';

class Repository {
  Repository({
    required this.firebaseAuth,
    required this.firebaseDatabase,
  });

  final FirebaseAuth firebaseAuth;
  final FirebaseDatabase firebaseDatabase;

  Stream<User?> userStream() {
    return firebaseAuth.authStateChanges();
  }

  Future<UserCredential> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signInAsGuest() async {
    return firebaseAuth.signInAnonymously();
  }

  Future<void> signOut() {
    return firebaseAuth.signOut();
  }

  Stream<Game?> fetchGameStream({required String gameID}) async* {
    final reference = firebaseDatabase.ref('games').child(gameID);
    final snapshot = await reference.get();
    final gameMap = snapshot.value;
    if (gameMap is Map) {
      yield Game.fromJson(Map<String, dynamic>.from(gameMap));
    } else {
      yield null;
    }

    await for (final event in reference.onValue) {
      final gameMap = event.snapshot.value;
      if (gameMap is Map) {
        yield Game.fromJson(Map<String, dynamic>.from(gameMap));
      } else {
        yield null;
      }
    }
  }

  Future<Game?> fetchGame({required String gameID, required String gameId}) async {
    final reference = firebaseDatabase.ref('games').child(gameID);
    final snapshot = await reference.get();

    if (snapshot.exists) {
      final data = snapshot.value as Map;
      return Game.fromJson(Map<String, Object?>.from(data));
    }

    return null;
  }

  Future<Game> createGame({required Game game}) async {
    final reference = firebaseDatabase.ref('games').child(game.id);
    await reference.set(game.toJson());
    return game;
  }

  Future<void> editGame({required Game game}) async {
    final reference = firebaseDatabase.ref('games').child(game.id);
    return reference.set(game.toJson());
  }
}

@riverpod
Repository repository(RepositoryRef ref) {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;

  return Repository(
    firebaseAuth: firebaseAuth,
    firebaseDatabase: firebaseDatabase,
  );}