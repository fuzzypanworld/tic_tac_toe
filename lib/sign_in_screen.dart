import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/authentication_provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = ref.watch(authenticationProvider);
    bool isLoggedIn = authProvider.value != null;
    log('isLoggedIn - $isLoggedIn');
    return Scaffold(
      appBar: AppBar(title: const Text('Tic Tac Toe')),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email'),
              const TextField(),
              const SizedBox(height: 32),
              const Text('Password'),
              const TextField(),
              const SizedBox(height: 16),
              Row(
                children: [
                  const ElevatedButton(onPressed: null, child: Text('Sign In')),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final authNotifier =
                          ref.read(authenticationProvider.notifier);
                      authNotifier.signInAsGuest();
                    },
                    child: const Text('Sign in as guest'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
