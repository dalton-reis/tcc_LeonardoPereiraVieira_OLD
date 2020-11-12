import 'package:flutter/material.dart';

class HeaderWaveWidget extends StatelessWidget {
  final Color color;

  const HeaderWaveWidget({Key key, this.color = Colors.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperPath(),
      child: Container(
        height: 200,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(color: color),
      ),
    );
  }
}

class WaveClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    var centerX = size.width / 2;
    var centerY = size.height / 2 + 30;
    path.quadraticBezierTo(
        size.width - 40, (size.height / 2) + 10, centerX, centerY);
    path.moveTo(centerX, centerY);
    path.quadraticBezierTo(20, size.height - 50, 0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
