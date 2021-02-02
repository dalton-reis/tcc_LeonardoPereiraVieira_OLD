import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tagarela/app/components/GestureAccessibility/gesture_accessibility_widget.dart';
import 'package:tagarela/app/modules/braille/components/CardLetraBraille/card_letra_braille_widget.dart';
import 'package:tagarela/app/components/GestureAccessibility/OptionGesture.class.dart';
import 'package:tagarela/app/modules/braille/shared/models/serieBraille.class.dart';
import 'package:tagarela/app/modules/braille/shared/models/palavraBraille.class.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';

class SinaisBrailleWidget extends StatelessWidget {
  final SerieBraille serie;
  final EdgeInsets margin;
  final Function onClick;
  SinaisBrailleWidget(
      {Key key, this.serie, this.margin, this.onClick(PalavraBraille sinal)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureAccessibilityWidget(
      active: Tagarela.config.acessible,
      options: List.generate(
        serie.sinais.length,
        (index) {
          return OptionGesture(speak: serie.sinais[index].letra);
        },
      ),
      onDoubleTap: (index) {
        if (Tagarela.config.acessible) onClick(serie.sinais[index]);
      },
      child: Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(4, (i) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (j) {
                int index = (j + (i * 3));
                return index < serie.sinais.length
                    ? CardLetraBrailleWidget(
                        serie.sinais[index].letra,
                        serie.sinais[index].sinal,
                        onclick: () {
                          if (!Tagarela.config.acessible)
                            onClick(serie.sinais[index]);
                        },
                      )
                    : Container();
              }),
            );
          }),
        ),
      ),
    );
  }
}
