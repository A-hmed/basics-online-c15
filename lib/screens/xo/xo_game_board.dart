import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_basics_c15/screens/xo/xo_button.dart';
import 'package:flutter_basics_c15/screens/xo/xo_styles.dart';

class XoGameBoard extends StatefulWidget {
  static const routeName = "XoGameBoard";

  const XoGameBoard({super.key});

  @override
  State<XoGameBoard> createState() => _XoGameBoardState();
}

class _XoGameBoardState extends State<XoGameBoard> {
  late Timer timer;
  int counter = 0;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  List<String> board = ["", "", "", "", "", "", "", "", ""];
  String firstPlayer = "";
  String secondPlayer = "";

  @override
  Widget build(BuildContext context) {
    firstPlayer = ModalRoute.of(context)!.settings.arguments! as String;
    secondPlayer = firstPlayer == "o" ? "x" : "o";
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff00D2FF),
          Color(0xff3A7BD5),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 24,
            children: [buildTimer(), buildPlayerTurn(), buildGameBoard()],
          ),
        ),
      ),
    );
  }

  Widget buildTimer() {
    int seconds = timer.tick;
    int minutes = seconds ~/ 60;
    seconds %= 60;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(44)),
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Text(
        "${minutes >= 10 ? minutes : "0$minutes"}:${seconds >= 10 ? seconds : "0$seconds"}",
        textAlign: TextAlign.center,
        style: XoTextStyles.black32SemiBold,
      ),
    );
  }

  Widget buildPlayerTurn() => Text(
        "Player ${counter % 2 == 0 ? 1 : 2}’s Turn",
        style: XoTextStyles.white36Bold,
        textAlign: TextAlign.center,
      );

  Widget buildGameBoard() => Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(44)),
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        XoButton(
                          symbol: board[0],
                          onClick: onPlayerClick,
                          index: 0,
                        ),
                        XoButton(
                            symbol: board[1], onClick: onPlayerClick, index: 1),
                        XoButton(
                            symbol: board[2], onClick: onPlayerClick, index: 2),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        XoButton(
                          symbol: board[3],
                          onClick: onPlayerClick,
                          index: 3,
                        ),
                        XoButton(
                          symbol: board[4],
                          onClick: onPlayerClick,
                          index: 4,
                        ),
                        XoButton(
                          symbol: board[5],
                          onClick: onPlayerClick,
                          index: 5,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        XoButton(
                          symbol: board[6],
                          onClick: onPlayerClick,
                          index: 6,
                        ),
                        XoButton(
                          symbol: board[7],
                          onClick: onPlayerClick,
                          index: 7,
                        ),
                        XoButton(
                          symbol: board[8],
                          onClick: onPlayerClick,
                          index: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 22,
                    indent: 22,
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 22,
                    indent: 22,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 22,
                    indent: 22,
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                    endIndent: 22,
                    indent: 22,
                  )
                ],
              )
            ],
          ),
        ),
      );

  void onPlayerClick(int index) {
    if (board[index].isNotEmpty) return;

    String symbol = counter % 2 == 0 ? firstPlayer : secondPlayer;
    board[index] = symbol;
    if (checkWinner()) {
      timer.cancel();
      showWinnerDialog("Player ${counter % 2 == 0 ? 1 : 2} winner");
      resetBoard();
      return;
    }
    if (counter == 8) {
      showWinnerDialog("Draw");
      timer.cancel();
      resetBoard();
    }

    counter++;
    setState(() {});
  }

  void showWinnerDialog(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok"))
            ],
          );
        });
  }

  bool checkWinner() {
    String symbol = counter % 2 == 0 ? "o" : "x";

    ///Rows
    if (board[0] == symbol && board[1] == symbol && board[2] == symbol)
      return true;
    if (board[3] == symbol && board[4] == symbol && board[5] == symbol)
      return true;
    if (board[6] == symbol && board[7] == symbol && board[8] == symbol)
      return true;

    ///Columns
    if (board[0] == symbol && board[3] == symbol && board[6] == symbol)
      return true;
    if (board[1] == symbol && board[4] == symbol && board[7] == symbol)
      return true;
    if (board[2] == symbol && board[5] == symbol && board[8] == symbol)
      return true;

    ///Diagonals
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol)
      return true;
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol)
      return true;
    return false;
  }

  void resetBoard() {
    board = ["", "", "", "", "", "", "", "", ""];
    setState(() {});
    counter = 0;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }
}
