import 'package:flutter/material.dart';

class CustomShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width, 0.0);
    var control = Offset(size.width,  size.height);
    var end = Offset(0.0, size.height);
    path.conicTo(control.dx, control.dy, end.dx, end.dy,0.5);
    //path.close();

    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.black;
    canvas.drawPath(path,paint);
  }

  @override
  bool shouldRepaint(CustomShapePainter) => false;
}
