import 'package:flutter/material.dart';
import 'package:tagarela/app/components/GestureAccessibility/gesture_accessibility_widget.dart';
import 'package:tagarela/app/components/headerCurve/header_curve_widget.dart';
import 'package:tagarela/app/modules/braille/shared/models/braille.class.dart';
import 'package:tagarela/app/modules/braille/shared/models/palavraBraille.class.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';

class ExampleBrailleWidget extends StatelessWidget {
  final PalavraBraille sinal;
  Tagarela tagarela = Tagarela();

  ExampleBrailleWidget({Key key, this.sinal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureAccessibilityWidget(
        active: Tagarela.config.acessible,
        primarySpeak:
            'letra ${sinal.letra}, pontos ${Braille.getPonto(sinal.sinal)}, ${(sinal.exemplo != null ? 'Exemplo. ' + sinal.exemplo : '')} ${sinal.texto}.',
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * .8,
          width: MediaQuery.of(context).size.width,
          child: Container(
            height: MediaQuery.of(context).size.height * .5,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                HeaderCurveWidget(
                  color: BRAILLE_PRIMARY,
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * .2),
                  curve: 0.5,
                  bordeCurve: 15,
                ),
                Column(
                  children: [
                    Text(
                      sinal.letra,
                      style: TextStyle(
                        fontFamily: "asap-vf-beta",
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    sinal.imagem != null
                        ? Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * .23,
                            width: MediaQuery.of(context).size.height * .23,
                            child: Image.asset(sinal.imagem),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  BRAILLE_SECONDARY,
                                  BRAILLE_PRIMARY,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          )
                        : Container(),
                    Divider(
                      color: Colors.transparent,
                    ),
                    Text(
                      sinal.exemplo != null ? sinal.exemplo : '',
                      style: TextStyle(
                        fontFamily: "asap-vf-beta",
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    Text(
                      sinal.texto != null ? sinal.texto : '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "asap-vf-beta",
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontSize: 20),
                    ),
                    Container(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '',
                          style: TextStyle(
                            fontFamily: "Tagarela_braille_point",
                            color: Colors.purple,
                            decoration: TextDecoration.none,
                            fontSize: MediaQuery.of(context).size.height * .2,
                            letterSpacing: 5,
                          ),
                          children: List.generate(
                              sinal.exemploBraille == null
                                  ? sinal.exemplo.length
                                  : sinal.exemploBraille.length, (index) {
                            return sinal.exemploBraille == null
                                ? (TextSpan(
                                    text: sinal.exemplo != null
                                        ? sinal.exemplo[index]
                                        : '',
                                    style: TextStyle(
                                      color: sinal.exemplo[index] == sinal.sinal
                                          ? Colors.purple[700]
                                          : Colors.black,
                                    ),
                                  ))
                                : (TextSpan(
                                    text: sinal.exemploBraille != null
                                        ? sinal.exemploBraille[index]
                                        : '',
                                    style: TextStyle(
                                      color: sinal.exemploBraille[index] ==
                                              sinal.sinal
                                          ? Colors.purple[700]
                                          : Colors.black,
                                    ),
                                  ));
                          }),
                        ),
                      ),
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height * .1,
                    //   margin: EdgeInsets.only(left: 10, right: 10),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     mainAxisSize: MainAxisSize.max,
                    //     children: [
                    //       Align(
                    //         alignment: Alignment.topLeft,
                    //         child: FloatingActionButton(
                    //           child: Icon(TagarellaIcons.arrow_left),
                    //           onPressed: (){

                    //           },
                    //           heroTag: null,
                    //         ),
                    //       ),
                    //       Spacer(
                    //         flex: 1,
                    //       ),
                    //       Align(
                    //         alignment: Alignment.topRight,
                    //         child: FloatingActionButton(
                    //           child: Icon(TagarellaIcons.arrow_right),
                    //           onPressed: (){

                    //           },
                    //           heroTag: null,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }
}
