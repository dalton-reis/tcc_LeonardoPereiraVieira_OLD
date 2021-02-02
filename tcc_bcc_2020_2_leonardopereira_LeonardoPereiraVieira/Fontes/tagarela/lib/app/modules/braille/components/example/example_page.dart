import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tagarela/app/components/GestureAccessibility/gesture_accessibility_widget.dart';
import 'package:tagarela/app/components/headerCurve/header_curve_widget.dart';
import 'package:tagarela/app/modules/braille/shared/models/braille.class.dart';
import 'package:tagarela/app/modules/braille/shared/models/palavraBraille.class.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';

class ExamplePage extends StatefulWidget {
  final PalavraBraille sinal;
  const ExamplePage({Key key, this.sinal}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<
    ExamplePage> /*ModularState<ExamplePage, ExampleController>*/ {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.sinal.letra,
          textAlign: TextAlign.center,
        ),
        backgroundColor: BRAILLE_PRIMARY,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: GestureAccessibilityWidget(
          active: Tagarela.config.acessible,
          primarySpeak:
              'letra ${widget.sinal.letra}, pontos ${Braille.getPonto(widget.sinal.sinal)}, ${(widget.sinal.exemplo != null ? 'Exemplo. ' + widget.sinal.exemplo : '')} ${widget.sinal.texto}.',
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              // height: MediaQuery.of(context).size.height * .5,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  HeaderCurveWidget(
                    color: BRAILLE_PRIMARY,
                    size: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height * .2),
                    curve: 0.5,
                    bordeCurve: 0,
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: AutoSizeText(
                          widget.sinal.letra,
                          style: TextStyle(
                              fontFamily: "asap-vf-beta",
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize:
                                  MediaQuery.textScaleFactorOf(context) * 50,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      widget.sinal.imagem != null
                          ? Container(
                              alignment: Alignment.center,
                              height: MediaQuery.of(context).size.height * .23,
                              width: MediaQuery.of(context).size.height * .23,
                              child: Image.asset(widget.sinal.imagem),
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
                      Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: AutoSizeText(
                          widget.sinal.exemplo != null
                              ? widget.sinal.exemplo
                              : '',
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: "asap-vf-beta",
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize:
                                  MediaQuery.textScaleFactorOf(context) * 50),
                        ),
                      ),
                      Container(
                        child: AutoSizeText(
                          widget.sinal.texto != null ? widget.sinal.texto : '',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: "asap-vf-beta",
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize:
                                  MediaQuery.textScaleFactorOf(context) * 20),
                        ),
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
                              fontSize:
                                  MediaQuery.textScaleFactorOf(context) * 100,
                              letterSpacing: 5,
                            ),
                            children: List.generate(
                                widget.sinal.exemploBraille == null
                                    ? widget.sinal.exemplo.length
                                    : widget.sinal.exemploBraille.length,
                                (index) {
                              return widget.sinal.exemploBraille == null
                                  ? (TextSpan(
                                      text: widget.sinal.exemplo != null
                                          ? widget.sinal.exemplo[index]
                                          : '',
                                      style: TextStyle(
                                        color: widget.sinal.exemplo[index] ==
                                                widget.sinal.sinal
                                            ? Colors.purple[700]
                                            : Colors.black,
                                      ),
                                    ))
                                  : (TextSpan(
                                      text: widget.sinal.exemploBraille != null
                                          ? widget.sinal.exemploBraille[index]
                                          : '',
                                      style: TextStyle(
                                        color: widget.sinal
                                                    .exemploBraille[index] ==
                                                widget.sinal.sinal
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
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
