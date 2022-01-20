import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:typeracer_tutorial/providers/game_state_provider.dart';
import 'package:typeracer_tutorial/utils/socket_client.dart';
import 'package:typeracer_tutorial/utils/socket_methods.dart';
import 'package:typeracer_tutorial/widgets/scoreboard.dart';

class SentenceGame extends StatefulWidget {
  const SentenceGame({Key? key}) : super(key: key);

  @override
  State<SentenceGame> createState() => _SentenceGameState();
}

class _SentenceGameState extends State<SentenceGame> {
  var playerMe = null;
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateGame(context);
  }

  findPlayerMe(GameStateProvider game) {
    game.gameState['players'].forEach((player) {
      if (player['socketID'] == SocketClient.instance.socket!.id) {
        playerMe = player;
      }
    });
  }

  Widget getTypedWords(words, player) {
    var tempWords = words.sublist(0, player['currentWordIndex']);
    String typedWord = tempWords.join(' ');
    return Text(
      typedWord,
      style: const TextStyle(
        color: Color.fromRGBO(52, 235, 119, 1),
        fontSize: 30,
      ),
    );
  }

  Widget getCurrentWord(words, player) {
    return Text(
      words[player['currentWordIndex']],
      style: const TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 30,
      ),
    );
  }

  Widget getWordsToBeTyped(words, player) {
    var tempWords = words.sublist(player['currentWordIndex'] + 1, words.length);
    String wordstoBeTyped = tempWords.join(' ');
    return Text(
      wordstoBeTyped,
      style: const TextStyle(
        fontSize: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final game = Provider.of<GameStateProvider>(context);
    findPlayerMe(game);

    if (game.gameState['words'].length > playerMe['currentWordIndex']) {
      return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Wrap(
          textDirection: TextDirection.ltr,
          children: [
            getTypedWords(game.gameState['words'], playerMe),
            getCurrentWord(game.gameState['words'], playerMe),
            getWordsToBeTyped(game.gameState['words'], playerMe),
          ],
        ),
      );
    }
    return const Scoreboard();
  }
}
