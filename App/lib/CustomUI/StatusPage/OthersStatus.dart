// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';

class OthersStatus extends StatelessWidget {
  const OthersStatus(
      {super.key,
      required this.name,
      required this.time,
      required this.imageName,
      required this.isSeen,
      required this.statusNum});

  final String name;
  final String time;
  final String imageName;
  final bool isSeen;
  final int statusNum;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomPaint(
        painter: StatusPainter(isSeen: isSeen, statusNum: statusNum),
        child: CircleAvatar(
          radius: 26,
          backgroundImage: AssetImage(imageName),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        "Today at, $time",
        style: TextStyle(fontSize: 14, color: Colors.grey[900]),
      ),
    );
  }
}

degreeToAngle(double degree) {
  return degree * pi / 180;
}

class StatusPainter extends CustomPainter {
  bool isSeen;
  int statusNum;
  StatusPainter({
    required this.isSeen,
    required this.statusNum,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 5.0
      ..color = isSeen ? Colors.grey : const Color(0xff21bfa6)
      ..style = PaintingStyle.stroke;
    drawAct(canvas, size, paint);
  }

  void drawAct(Canvas canvas, Size size, Paint paint) {
    if (statusNum == 1) {
      canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          degreeToAngle(0), degreeToAngle(360), false, paint);
    } else {
      double degree = -90;
      double arc = 360 / statusNum;
      for (int i = 0; i < statusNum; i++) {
        canvas.drawArc(Rect.fromLTWH(0.0, 0.0, size.width, size.height),
            degreeToAngle(degree + 4), degreeToAngle(arc - 8), false, paint);
        degree += arc;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
