import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        "assets/loader.gif",
        height: 100,
        width: 100,
      )
    );
  }
}