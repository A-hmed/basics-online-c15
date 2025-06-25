// import 'package:flutter/widgets.dart'; ///Desktop - Web
// import 'package:flutter/cupertino.dart'; ///IOS
// import 'package:flutter/material.dart'; ///Android
import 'package:flutter/material.dart';
import 'package:flutter_basics_c15/screens/calculator/calculator_screen.dart';
import 'package:flutter_basics_c15/screens/hotels/hotel_widget.dart';
import 'package:flutter_basics_c15/screens/hotels/hotels_screen.dart';
import 'package:flutter_basics_c15/screens/login/login.dart';
import 'package:flutter_basics_c15/screens/register/register.dart';
import 'package:flutter_basics_c15/screens/xo/pick_player_screen.dart';
import 'package:flutter_basics_c15/screens/xo/xo_game_board.dart';

Color blue = Color(0xff024383);
Decoration blueRoundedBox = BoxDecoration(
  borderRadius: BorderRadius.circular(16),
  color: blue,
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: PickPlayerScreen.routeName,
      routes: {
        "login": (context) {
          return LoginScreen();
        },
        "register": (context) => RegisterScreen(),
        "home": (_) => HotelsScreen(),
        Calculator.routeName: (_) => Calculator(),
        XoGameBoard.routeName: (_) => XoGameBoard(),
        PickPlayerScreen.routeName: (_) => PickPlayerScreen()
      },
    );
  }
}

///Layout widgets
/// Column - Row - Stack
///
///
/// GIT ->
/// Repository(Project) -> Branch -> Commits
/// Branch
/// Commits
/// Pull - Push
/// Merge
/// Reset (soft - hard)
/// Pull Request
