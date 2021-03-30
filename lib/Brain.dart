import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum TicValue { player1, player2, noValue, tie }

class PlayerList {
  TicValue player;
  IconData sign;
  bool active;
  PlayerList(this.player, this.sign, this.active);
}

class TicTokBrain {
  TicValue currentPlayer = TicValue.player1;
  TicValue winner = TicValue.noValue;
  List playerList = [
    PlayerList(TicValue.noValue, null, true),
    PlayerList(TicValue.noValue, null, true),
    PlayerList(TicValue.noValue, null, true),
    PlayerList(TicValue.noValue, null, true),
    PlayerList(TicValue.noValue, null, true),
    PlayerList(TicValue.noValue, null, true),
    PlayerList(TicValue.noValue, null, true),
    PlayerList(TicValue.noValue, null, true),
    PlayerList(TicValue.noValue, null, true),
  ];
  IconData getIcon(int place) {
    return playerList[place].sign;
  }

  void onTap(TicValue player, int place) {
    if (player == TicValue.player1) {
      playerList[place].sign = FontAwesomeIcons.opera;
      playerList[place].active = false;
      playerList[place].player = player;
      checkResult();
      currentPlayer = TicValue.player2;
    } else {
      playerList[place].sign = FontAwesomeIcons.times;
      playerList[place].active = false;
      playerList[place].player = player;
      checkResult();
      currentPlayer = TicValue.player1;
    }
  }

  void checkResult() {
    if (playerList[0].player == playerList[1].player &&
        playerList[2].player == playerList[1].player) {
      winner = playerList[0].player;
    } //1
    else if (playerList[3].player == playerList[4].player &&
        playerList[5].player == playerList[4].player) {
      winner = playerList[3].player;
    } //2
    else if (playerList[6].player == playerList[7].player &&
        playerList[8].player == playerList[7].player) {
      winner = playerList[6].player;
    } //3
    else if (playerList[0].player == playerList[3].player &&
        playerList[6].player == playerList[3].player) {
      winner = playerList[0].player;
    } //4
    else if (playerList[1].player == playerList[4].player &&
        playerList[7].player == playerList[4].player) {
      winner = playerList[1].player;
    } //5
    else if (playerList[2].player == playerList[5].player &&
        playerList[8].player == playerList[5].player) {
      winner = playerList[2].player;
    } //6
    else if (playerList[0].player == playerList[4].player &&
        playerList[8].player == playerList[4].player) {
      winner = playerList[0].player;
    } //7
    else if (playerList[2].player == playerList[4].player &&
        playerList[6].player == playerList[2].player) {
      winner = playerList[2].player;
    } //8
    else if (playerList[0].player != TicValue.noValue &&
        playerList[1].player != TicValue.noValue &&
        playerList[2].player != TicValue.noValue &&
        playerList[3].player != TicValue.noValue &&
        playerList[4].player != TicValue.noValue &&
        playerList[5].player != TicValue.noValue &&
        playerList[6].player != TicValue.noValue &&
        playerList[7].player != TicValue.noValue &&
        playerList[8].player != TicValue.noValue) {
      winner = TicValue.tie;
    }
  }

  void reset() {
    playerList = [
      PlayerList(TicValue.noValue, null, true),
      PlayerList(TicValue.noValue, null, true),
      PlayerList(TicValue.noValue, null, true),
      PlayerList(TicValue.noValue, null, true),
      PlayerList(TicValue.noValue, null, true),
      PlayerList(TicValue.noValue, null, true),
      PlayerList(TicValue.noValue, null, true),
      PlayerList(TicValue.noValue, null, true),
      PlayerList(TicValue.noValue, null, true),
    ];
    currentPlayer = TicValue.player1;
    winner = TicValue.noValue;
  }
}
