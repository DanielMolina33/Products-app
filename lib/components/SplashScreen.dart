// Flutter
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {
  Widget route;

  SplashScreen(this.route, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: route,
      duration: 3000,
      backgroundColor: Colors.blue[800],
      text: "Daniel Molina",
      textStyle: const TextStyle(
        fontSize: 45,
        fontFamily: 'Road Rage',
        shadows: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(0, 5),
            blurRadius: 10,
          )
        ],
        color: Colors.white
      ),
    );
  }
}