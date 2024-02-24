import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_toe/repositories.dart';

part 'authentication_provider.g.dart';

@riverpod
class Authentication extends _$Authentication {
  @override
  Stream<User?> build() {
    final repository = ref.watch(repositoryProvider);
    return repository.userStream();
  }

  Future<void> signInAsGuest() async {
    final repository = ref.read(repositoryProvider);
    await repository.signInAsGuest();
  }
}
