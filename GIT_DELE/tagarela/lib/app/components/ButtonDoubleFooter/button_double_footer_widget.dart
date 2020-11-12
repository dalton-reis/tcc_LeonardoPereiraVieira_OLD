import 'package:flutter/material.dart';

class ButtonDoubleFooterWidget extends StatelessWidget {
  final Widget button1, button2;

  const ButtonDoubleFooterWidget({Key key, this.button1, this.button2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.shortestSide * .15,
      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * .01),
      alignment: Alignment.lerp(Alignment.topLeft, Alignment.bottomRight, 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(alignment: Alignment.topCenter, child: button1),
          Container(
            width: MediaQuery.of(context).size.width * .4,
          ),
          Align(alignment: Alignment.topCenter, child: button2),
        ],
      ),
    );
  }
}
