import 'package:flutter/material.dart';
import 'package:tagarela/app/icons/tagarella_icons_icons.dart';

class ButtonEraseWidget extends StatelessWidget {
  final double width, height;
  final Function onPressed;
  final Widget child;

  const ButtonEraseWidget(
      {Key key, this.width, this.height, this.onPressed, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Container(
        width: width > 0 ? width : 65,
        height: height > 0 ? height : 54,
        child: ClipPath(
          clipper: CustomButtonClipperPath(),
          child: Container(
            child: child,
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  topRight: Radius.circular(5),
                )),
          ),
        ),
      ),
    );
  }
}

class CustomButtonClipperPath extends CustomClipper<Path> {
  CustomButtonClipperPath();
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width * .35, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width * .35, size.height);
    path.lineTo(0, size.height * .5);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
