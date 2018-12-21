
import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(size.width, 0.0);
    var control = Offset(size.width,  size.height);
    var end = Offset(0.0, size.height);
    path.conicTo(control.dx, control.dy, end.dx, end.dy,0.5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;

}