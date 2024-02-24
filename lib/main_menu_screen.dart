import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/authentication_provider.dart';
import 'package:tic_tac_toe/game.dart';

import 'package:tic_tac_toe/main.dart';
import 'package:tic_tac_toe/multiplayer.dart';
import 'package:tic_tac_toe/repositories.dart';
import 'package:tic_tac_toe/singleplayer.dart';
import 'dart:math';

class MainMenuScreen extends ConsumerWidget {
  const MainMenuScreen({super.key});

  String _generateRandomGameId() {
    const int min = 1000; // You can adjust the range as needed
    const int max = 9999;
    return '${Random().nextInt(max - min + 1) + min}';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Tic Tac Toe',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  final user = await ref.read(authenticationProvider.future);
                  if (user == null) {
                    return;
                  }
                
                  final navigator = Navigator.of(context);
                  final repository = ref.read(repositoryProvider);
                  final game = Game(
                      id: _generateRandomGameId(),
                      player1Id: user.uid,
                      player2Id: null,
                      currentPlayerId: user.uid,
                      board: [
                        ['', '', ''],
                        ['', '', ''],
                        ['', '', '']
                      ],
                      winner: null);
                  navigator.push(
                    MaterialPageRoute(
                      builder: (_) => Multiplayer(
                        gameId: game.id,
                      ),
                    ),
                  );
                },
                child: const Text('New Multiplayer Game'),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const SinglePlayerTicTacToeGame(),
                    ),
                  );
                },
                child: const Text('New Single player Game'),
              ),
              const Text('Or', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        decoration: InputDecoration(labelText: 'Game Code'),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Join Game'),
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
