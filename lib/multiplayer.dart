import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tic_tac_toe/game.dart';
import 'package:tic_tac_toe/repositories.dart';

part 'multiplayer.g.dart';

@riverpod
Future<Game?> game(GameRef ref, {required String gameId}) async {
    final repository = ref.watch(repositoryProvider);
    return repository.fetchGame(gameId: gameId);
  }

class Multiplayer extends StatefulWidget {
  const Multiplayer({super.key, required this.gameId});

  final String gameId;

  @override
  _MultiplayerState createState() => _MultiplayerState();
}

class _MultiplayerState extends State<Multiplayer> {
 

  

  @override
  void initState() {
    super.initState();
    
  }

  // Generate a random game ID
  
  void _makeMove(int row, int col) {
   
    if (board[row][col] == '') {
     // gameRef.child('board/$row/$col').set(_currentPlayer);
      //gameRef.child('currentPlayer').set((_currentPlayer == 'X') ? 'O' : 'X');
    }
  }


  String? _checkWinner() {
    for (var i = 0; i < 3; i++) {
      if (board[i][0] == _board[i][1] &&
          board[i][1] == _board[i][2] &&
          _board[i][0] != '') {
        return _board[i][0];
      }
      if (_board[0][i] == _board[1][i] &&
          _board[1][i] == _board[2][i] &&
          _board[0][i] != '') {
        return _board[0][i];
      }
    }
    if (_board[0][0] == _board[1][1] &&
        _board[1][1] == _board[2][2] &&
        _board[0][0] != '') {
      return _board[0][0];
    }
    if (_board[0][2] == _board[1][1] &&
        _board[1][1] == _board[2][0] &&
        _board[0][2] != '') {
      return _board[0][2];
    }
    for (var row in _board) {
      for (var cell in row) {
        if (cell == '') {
          return null;
        }
      }
    }
    return 'draw';
  }

  void _resetBoard() {
    gameRef.set({
      'board': List.generate(3, (_) => List.filled(3, '')),
      'currentPlayer': 'X',
    });
  }

  Widget _buildTile(int row, int col) {
    return GestureDetector(
      onTap: () {
        if (_checkWinner() == null && _currentPlayer == 'X') {
          _makeMove(row, col);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2.0),
        ),
        width: 80.0,
        height: 80.0,
        child: Center(
          child: Text(
            _board[row][col],
            style: const TextStyle(fontSize: 48.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? winner = _checkWinner();
    String status;
    if (winner == 'draw') {
      status = "It's a draw!";
    } else if (winner != null) {
      status = 'Player $winner wins!';
    } else {
      status = 'Player $_currentPlayer\'s turn';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic-Tac-Toe'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              status,
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            Column(
              children: _board.asMap().entries.map((entry) {
                int row = entry.key;
                List<String> rowData = entry.value;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: rowData.asMap().entries.map((cell) {
                    int col = cell.key;
                    return _buildTile(row, col);
                  }).toList(),
                );
              }).toList(),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_checkWinner() != null) {
                  _resetBoard();
                }
              },
              child: const Text('Restart Game'),
            ),
          ],
        ),
      ),
    );
  }
}
}