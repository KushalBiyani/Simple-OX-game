import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:my_app/Brain.dart';

void main() {
  runApp(MyApp());
}

TicTokBrain brain = TicTokBrain();
var alertStyle = AlertStyle(
  animationType: AnimationType.fromTop,
  isCloseButton: false,
  isOverlayTapDismiss: false,
  descStyle: TextStyle(fontWeight: FontWeight.bold),
  descTextAlign: TextAlign.start,
  animationDuration: Duration(milliseconds: 400),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5.0),
    side: BorderSide(
      color: Colors.white,
    ),
  ),
  titleStyle: TextStyle(
    color: Colors.green,
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tik Tak Toe'),
        ),
        body: Screen(),
      ),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  TicValue player = brain.currentPlayer;

  List values = brain.playerList;
  void checkWinner() {
    setState(() {
      if (brain.winner != TicValue.noValue) {
        if (brain.winner == TicValue.player1) {
          Alert(
            context: context,
            title: 'Finished',
            style: alertStyle,
            desc: 'Player 1 Has Won',
            buttons: [
              DialogButton(
                child: Text(
                  "New Game",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        } else if (brain.winner == TicValue.player2) {
          Alert(
            context: context,
            title: 'Finished',
            style: alertStyle,
            desc: 'Player 2 Has Won',
            buttons: [
              DialogButton(
                child: Text(
                  "New Game",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        } else {
          Alert(
            context: context,
            title: 'Tied',
            style: alertStyle,
            desc: 'Match got Tied',
            buttons: [
              DialogButton(
                child: Text(
                  "Restart",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.pop(context),
                width: 120,
              )
            ],
          ).show();
        }
        brain.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      //color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                player == TicValue.player1
                    ? "Player 1 Turn's"
                    : "Player 2 Turn's",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Container(
            child: Expanded(
              flex: 3,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Box(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          icon: brain.getIcon(0),
                          tapping: () {
                            if (brain.playerList[0].active) {
                              setState(() {
                                brain.onTap(player, 0);
                                checkWinner();
                                player = brain.currentPlayer;
                                values = brain.playerList;
                              });
                            }
                          },
                        ),
                        Box(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          icon: brain.getIcon(1),
                          tapping: () {
                            if (brain.playerList[1].active) {
                              setState(() {
                                brain.onTap(player, 1);
                                checkWinner();
                                player = brain.currentPlayer;
                                values = brain.playerList;
                              });
                            }
                          },
                        ),
                        Box(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          icon: brain.getIcon(2),
                          tapping: () {
                            if (brain.playerList[2].active) {
                              setState(() {
                                brain.onTap(player, 2);
                                checkWinner();
                                player = brain.currentPlayer;
                                values = brain.playerList;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Box(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          icon: brain.getIcon(3),
                          tapping: () {
                            if (brain.playerList[3].active) {
                              setState(() {
                                brain.onTap(player, 3);
                                checkWinner();
                                player = brain.currentPlayer;

                                values = brain.playerList;
                              });
                            }
                          },
                        ),
                        Box(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          icon: brain.getIcon(4),
                          tapping: () {
                            if (brain.playerList[4].active) {
                              setState(() {
                                brain.onTap(player, 4);
                                checkWinner();
                                player = brain.currentPlayer;

                                values = brain.playerList;
                              });
                            }
                          },
                        ),
                        Box(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          icon: brain.getIcon(5),
                          tapping: () {
                            if (brain.playerList[5].active) {
                              setState(() {
                                brain.onTap(player, 5);
                                checkWinner();
                                player = brain.currentPlayer;

                                values = brain.playerList;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Box(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          icon: brain.getIcon(6),
                          tapping: () {
                            if (brain.playerList[6].active) {
                              setState(() {
                                brain.onTap(player, 6);
                                checkWinner();
                                player = brain.currentPlayer;

                                values = brain.playerList;
                              });
                            }
                          },
                        ),
                        Box(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          icon: brain.getIcon(7),
                          tapping: () {
                            if (brain.playerList[7].active) {
                              setState(() {
                                brain.onTap(player, 7);
                                checkWinner();
                                player = brain.currentPlayer;

                                values = brain.playerList;
                              });
                            }
                          },
                        ),
                        Box(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          icon: brain.getIcon(8),
                          tapping: () {
                            if (brain.playerList[8].active) {
                              setState(() {
                                brain.onTap(player, 8);
                                checkWinner();
                                player = brain.currentPlayer;
                                values = brain.playerList;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}

class Box extends StatelessWidget {
  Box({this.margin, this.tapping, this.icon});
  final EdgeInsets margin;
  final Function tapping;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: tapping,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(width: 0, color: Color(0xFF0A0E21)),
            color: Color(0xFF0A0E21),
          ),
          margin: margin,
          child: Icon(
            icon,
            size: 76,
          ),
        ));
  }
}
