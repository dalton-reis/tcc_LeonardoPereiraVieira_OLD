import 'package:flutter/material.dart';

class BoxTextWidget extends StatelessWidget {
  final List<String> text;
  final TextStyle textStyle;
  final double width, height;
  final List<BoxShadow> boxShadow;

  const BoxTextWidget(
      {Key key,
      @required this.text,
      this.textStyle,
      this.width,
      this.height,
      this.boxShadow})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width != null ? width : MediaQuery.of(context).size.width,
      height:
          height != null ? height : MediaQuery.of(context).size.height * .20,
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          children: List.generate(text.length, (index) {
            return TextSpan(
              text: text[index],
              style: textStyle,
            );
          }),
        ),
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: boxShadow != null
              ? boxShadow
              : [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 20,
                    spreadRadius: 0,
                  )
                ]),
    );
  }
}
