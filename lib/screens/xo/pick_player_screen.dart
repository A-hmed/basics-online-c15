import 'package:flutter/material.dart';
import 'package:flutter_basics_c15/screens/xo/xo_game_board.dart';
import 'package:flutter_basics_c15/screens/xo/xo_styles.dart';

class PickPlayerScreen extends StatelessWidget {
  static const routeName = "PickPlayerScreen";

  const PickPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            children: [
              SizedBox(
                height: 60,
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              XoAssets.pickPlayerBg,
                            ),
                            fit: BoxFit.cover)),
                    child: Center(
                        child: Text(
                      "Tix - Tic - Toe",
                      style: XoTextStyles.white40Bold,
                    ))),
              ),
              Text(
                "Pick who goes first?",
                style: XoTextStyles.white24Medium,
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  buildSymbol(context, XoAssets.icX),
                  SizedBox(
                    width: 16,
                  ),
                  buildSymbol(context, XoAssets.icO),
                  SizedBox(
                    width: 16,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSymbol(BuildContext context, String image) {
    return Expanded(
        child: InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, XoGameBoard.routeName,
            arguments: image == XoAssets.icO ? "o" : "x");
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(32)),
        child: Image.asset(image),
      ),
    ));
  }
}
