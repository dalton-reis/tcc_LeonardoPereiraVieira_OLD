import 'package:flutter/material.dart';

class HeaderBubbleWidget extends StatelessWidget {
  final String title;
  final Color color;
  HeaderBubbleWidget({this.title, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BubbleClipperPath(),
      child: Container(
        height: 200,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}

class BubbleClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.8,
        size.width * 0.81, size.height * 0.8);
    path.lineTo(0, size.height * 0.8);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
