import 'package:flutter/material.dart';

enum Direction { none, left, right }
enum PositionTap {
  leftTop,
  leftCenter,
  leftButton,
  rightTop,
  rightCenter,
  rightButton
}

class GestureTagarelaWidget extends StatefulWidget {
  final Widget child;
  final Function onHorizontalDrag;
  final Function onTap;
  final Function onDoubleTap;
  final Function onLongPress;

  GestureTagarelaWidget(
      {Key key,
      this.child,
      this.onHorizontalDrag(Direction direction),
      this.onTap(PositionTap position),
      this.onDoubleTap,
      this.onLongPress})
      : super(key: key);

  @override
  _GestureTagarelaWidgetState createState() => _GestureTagarelaWidgetState();
}

class _GestureTagarelaWidgetState extends State<GestureTagarelaWidget> {
  double inicioGesto = 0;

  Direction direction = Direction.none;
//           |
//           |
// leftTop   |  rightTop
//----------- -----------
// leftCenter|  rightCenter
//           |
//           |
//----------- -----------
//leftButton |  rightButton
//           |
//           |
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        if (widget.onTap != null)
          widget.onTap(getPosition(
              details.globalPosition.dx, details.globalPosition.dy));
      },
      onDoubleTap: () {
        widget.onDoubleTap();
      },
      onHorizontalDragStart: (details) {
        inicioGesto = details.globalPosition.dx;
      },
      onHorizontalDragUpdate: (details) {
        if (inicioGesto < details.globalPosition.dx) {
          direction = Direction.right;
        } else {
          direction = Direction.left;
        }
      },
      onHorizontalDragEnd: (details) {
        widget.onHorizontalDrag(direction);
      },
      child: widget.child,
      onLongPress: widget.onLongPress,
    );
  }

  PositionTap getPosition(double x, y) {
    Size size = MediaQuery.of(context).size;
    if (x < size.width * .5 && y < size.height * .33) {
      return PositionTap.leftTop;
    } else if (x > size.width * .5 && y < size.height * .33) {
      return PositionTap.rightTop;
    } else if (x < size.width * .5 && y < size.height * .66) {
      return PositionTap.leftCenter;
    } else if (x > size.width * .5 && y < size.height * .66) {
      return PositionTap.rightCenter;
    } else if (x < size.width * .5) {
      return PositionTap.leftButton;
    } else
      return PositionTap.rightButton;
  }
}
