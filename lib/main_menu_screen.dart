import 'dart:math' hide log;
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tic_tac_toe/authentication_provider.dart';
import 'package:tic_tac_toe/game.dart';

import 'package:tic_tac_toe/multiplayer.dart';
import 'package:tic_tac_toe/repositories.dart';
import 'package:tic_tac_toe/singleplayer.dart';

class MainMenuScreen extends ConsumerStatefulWidget {
  const MainMenuScreen({super.key});

  @override
  ConsumerState<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends ConsumerState<MainMenuScreen> {
  // Generate a random game ID
  String _generateRandomGameId() {
    const int min = 10000; // You can adjust the range as needed
    const int max = 99999;
    return '${Random().nextInt(max - min + 1) + min}';
  }

  String gameID = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Tic Tac Toe'),
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
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  final navigator = Navigator.of(context);
                  final user = await ref.read(authenticationProvider.future);
                  if (user == null) {
                    return;
                  }

                  final repository = ref.read(repositoryProvider);
                  final game = Game(
                    id: _generateRandomGameId(),
                    player1Id: user.uid,
                    player2Id: null,
                    currentPlayerId: user.uid,
                    board: [
                      ['', '', ''],
                      ['', '', ''],
                      ['', '', ''],
                    ],
                    winner: null,
                  );
                  await repository.createGame(game: game);
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
              const Text('Or'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (newValue) {
                        setState(() {
                          gameID = newValue.trim();
                        });
                      },
                      decoration: const InputDecoration(labelText: 'Game Code'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Builder(builder: (context) {
                    return ElevatedButton(
                      onPressed: () async {
                        if (gameID.trim().isNotEmpty) {
                          final scaffoldMessenger =
                              ScaffoldMessenger.maybeOf(context);
                          final navigator = Navigator.of(context);

                          final (game, user) = await (
                            ref.read(
                                gameNotifierProvider(gameId: gameID).future),
                            ref.read(authenticationProvider.future)
                          ).wait;

                          log('Game - $game');
                          log('User - $user');

                          if (user == null) {
                            scaffoldMessenger?.showSnackBar(
                              const SnackBar(
                                content: Text('You need to be logged in'),
                              ),
                            );
                            return;
                          }

                          if (game == null) {
                            scaffoldMessenger?.showSnackBar(
                              SnackBar(
                                content: Text('Game with ID $gameID not found'),
                              ),
                            );
                            return;
                          }

                          if (![game.player1Id, game.player2Id]
                                  .contains(user.uid) &&
                              game.player2Id != null) {
                            scaffoldMessenger?.showSnackBar(
                              const SnackBar(
                                content: Text('Game is full. Pick another'),
                              ),
                            );
                            return;
                          }

                          if (game.player2Id == null) {
                            await ref
                                .read(
                                  gameNotifierProvider(gameId: gameID).notifier,
                                )
                                .editGame(
                                  game: game.copyWith(
                                    player2Id: user.uid,
                                  ),
                                );
                          }

                          navigator.push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  Multiplayer(gameId: game.id),
                            ),
                          );
                        }
                      },
                      child: const Text('Join Multiplayer Game'),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
