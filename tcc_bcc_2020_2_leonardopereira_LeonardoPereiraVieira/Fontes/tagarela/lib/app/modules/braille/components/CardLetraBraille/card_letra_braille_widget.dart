import 'package:flutter/material.dart';
import 'package:tagarela/app/shared/util/constants.dart';

class CardLetraBrailleWidget extends StatelessWidget {
  final Function onclick;
  final String letra;
  final String sinal;

  const CardLetraBrailleWidget(this.letra, this.sinal, {Key key, this.onclick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: BRAILLE_SECONDARY,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue,
            Color.fromRGBO(188, 215, 236, 100),
          ],
        ),
      ),
      child: RawMaterialButton(
        onPressed: onclick,
        child: Row(
          children: [
            Container(
              child: Text(
                letra,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.shortestSide * .08),
              ),
            ),
            Container(
              child: Text(
                sinal,
                style: TextStyle(
                  fontFamily: 'Tagarela_braille_board',
                  fontSize: MediaQuery.of(context).size.shortestSide * .33,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
