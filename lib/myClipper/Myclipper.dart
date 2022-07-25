import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  var side = "";

  MyClipper(this.side);

  @override
  Path getClip(Size size) {
    if(side == 'top'){
      return top(size);
    } else if(side == 'bottom'){
      return bottom(size);
    }

    return Path();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;

  Path top(size){
    var path = Path();
    path.lineTo(0.0, size.height);
    var firstControlPoint = Offset(size.width-150, size.height-20);
    var firstEndPoint = Offset(size.width-150, size.height/2);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width-20, size.height/2);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  Path bottom(size){
    var path = Path();
    path.moveTo(size.width, 0.0);
     
    var firstControlPoint = Offset(size.width-70, size.height-180);
    var firstEndPoint = Offset(size.width-70, size.height-90);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width-180, size.height-110);
    var secondEndPoint = Offset(0.0, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(0.0, size.height);
    path.lineTo(size.height, size.width);
    path.close();

    return path;
  }
}