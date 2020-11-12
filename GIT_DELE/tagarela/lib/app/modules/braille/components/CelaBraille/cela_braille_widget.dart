import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CelaBrailleWidget extends StatefulWidget {
  final double diameter;
  String sinalBraille;
  Function action;
  CelaBrailleWidget(
      {Key key,
      this.diameter,
      var this.sinalBraille = '000000',
      this.action(String sinal)})
      : super(key: key);
  @override
  _CelaBrailleWidgetState createState() => _CelaBrailleWidgetState();
}

class _CelaBrailleWidgetState extends State<CelaBrailleWidget> {
  _CelaBrailleWidgetState();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(2, (i) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (j) {
              int index = j + (i * 3);
              return RawMaterialButton(
                onPressed: () {
                  if (widget.sinalBraille[index] == '1')
                    widget.sinalBraille =
                        widget.sinalBraille.replaceRange(index, index + 1, '0');
                  else
                    widget.sinalBraille =
                        widget.sinalBraille.replaceRange(index, index + 1, '1');

                  widget.action(widget.sinalBraille);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: widget.diameter,
                  height: widget.diameter,
                  decoration: BoxDecoration(
                    border: BoxBorder.lerp(
                      Border.all(color: Colors.black),
                      Border.all(color: Colors.black),
                      10,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    ),
                    color: ((widget.sinalBraille[index] == '1')
                        ? Colors.black
                        : Colors.transparent),
                  ),
                ),
                constraints: BoxConstraints.expand(
                    width: widget.diameter, height: widget.diameter),
              );
            }),
          );
        }),
      ),
    );
  }
}
