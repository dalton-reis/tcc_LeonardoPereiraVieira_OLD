import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/components/GestureAccessibility/OptionGesture.class.dart';
import 'package:tagarela/app/components/GestureAccessibility/gesture_accessibility_widget.dart';
import 'package:tagarela/app/components/GestureTagarela/gesture_tagarela_widget.dart';
import 'package:tagarela/app/icons/tagarella_icons_icons.dart';
import 'package:tagarela/app/modules/braille/components/CelaBraille/cela_braille_widget.dart';
import 'package:tagarela/app/modules/braille/shared/models/braille.class.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';
import 'pratica_braille_controller.dart';

class PraticaBraillePage extends StatefulWidget {
  final String title;
  const PraticaBraillePage({Key key, this.title = "Prática Braille"})
      : super(key: key);

  @override
  _PraticaBraillePageState createState() => _PraticaBraillePageState();
}

class _PraticaBraillePageState
    extends ModularState<PraticaBraillePage, PraticaBrailleController>
    with SingleTickerProviderStateMixin {
  // FluttieAnimationController animationCtrl;
  // bool busy = false;
  // bool done = false;

  @override
  void initState() {
    super.initState();
    // prepareAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    // animationCtrl.dispose();
  }

  // prepareAnimation() async {
  //   var instance = Fluttie();

  //   var sucess =
  //       await instance.loadAnimationFromAsset('assets/animation/done.json');

  //   animationCtrl = await instance.prepareAnimation(sucess,
  //       duration: const Duration(seconds: 5),
  //       repeatCount: const RepeatCount.dontRepeat(),
  //       repeatMode: RepeatMode.START_OVER);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: BRAILLE_PRIMARY,
      ),
      body: Observer(builder: (_) {
        return GestureAccessibilityWidget(
          active: Tagarela.config.acessible,
          primarySpeak:
              'Prática Braille, complete a palavra com a letra que está faltando. \n click na tela para marcar um ponto, pontos 1 e 4 na parte superior,' +
                  ' pontos 2 e 5 no centro e pontos 3 e 6 na parte infeirior. \n para navegar entre as opções pular e confirmar, arraste para o lado. \n' +
                  'palavra: ${controller.palavraAtual}. qual sinal representa a letra ${controller.letra}?',
          onTap: (position) {
            int ponto = 0;
            if (position == PositionTap.leftTop) ponto = 1;
            if (position == PositionTap.leftCenter) ponto = 2;
            if (position == PositionTap.leftButton) ponto = 3;
            if (position == PositionTap.rightTop) ponto = 4;
            if (position == PositionTap.rightCenter) ponto = 5;
            if (position == PositionTap.rightButton) ponto = 6;

            if (controller.sinalBraille[ponto - 1] == '1') {
              controller.sinalBraille =
                  controller.sinalBraille.replaceRange(ponto - 1, ponto, '0');
            } else {
              controller.sinalBraille =
                  controller.sinalBraille.replaceRange(ponto - 1, ponto, '1');
            }

            String pontos = Braille.getPontoSinal(controller.sinalBraille);
            return '${(pontos != '' ? 'Pontos, ' + pontos : '')}';
          },
          loopOption: false,
          initialOption: 0,
          options: [
            OptionGesture(
                speak: 'Confirmar, click duas vezes para confirmar',
                action: () {
                  if (Tagarela.config.acessible) {
                    if (controller.validaSinal())
                      return 'parabéns você acertou! próxima palavra é: ${controller.palavraAtual}. \n qual sinal representa a letra ${controller.letra}';
                    else
                      return 'que pena tente novamente! palavra: ${controller.palavraAtual}. \n qual sinal representa a letra ${controller.letra}';
                  }
                }),
            OptionGesture(
                speak: 'Pular, click duas vezes para pular',
                action: () {
                  if (Tagarela.config.acessible) controller.pularPalavra();
                  return 'palavra: ${controller.palavraAtual}. \n qual sinal representa a letra ${controller.letra}?';
                }),
          ],
          child: SingleChildScrollView(
            child: Stack(
              children: [
                // FluttieAnimation(animationCtrl),
                Container(
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .2,
                        child: Image.asset(
                            Braille.mapImages[controller.palavraAtual]),
                      ),
                      Text(
                        controller.palavraAtual,
                        style: TextStyle(fontSize: 45),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * .15,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '',
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.none,
                              fontSize:
                                  80 - (controller.palavraAtual.length * 4.0),
                              letterSpacing: 15,
                            ),
                            children: List.generate(
                                controller.palavraAtual.length, (index) {
                              return TextSpan(
                                text: controller.palavraAtual[index] !=
                                        controller.letra
                                    ? controller.palavraAtual[index]
                                    : '?',
                                style: TextStyle(
                                  fontFamily: controller.palavraAtual[index] !=
                                          controller.letra
                                      ? "Tagarela_braille_point"
                                      : 'Arial Rounded MT Bold Negrito',
                                  color: controller.palavraAtual[index] !=
                                          controller.letra
                                      ? Colors.black
                                      : BRAILLE_SECONDARY,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      Container(
                        child: CelaBrailleWidget(
                          diameter:
                              MediaQuery.of(context).size.shortestSide * .15,
                          action: (sinal) {
                            if (!Tagarela.config.acessible)
                              controller.sinalBraille = sinal;
                          },
                          sinalBraille: controller.sinalBraille,
                        ),
                        margin: EdgeInsets.all(20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        margin: EdgeInsets.only(left: 35),
        alignment: Alignment.lerp(Alignment.topLeft, Alignment.bottomRight, 60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: FloatingActionButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      TagarellaIcons.arrow_right,
                    ),
                    // Text(
                    //   'Próximo',
                    //   style: TextStyle(fontSize: 9),
                    // )
                  ],
                ),
                onPressed: () {
                  if (!Tagarela.config.acessible) controller.pularPalavra();
                },
                heroTag: null,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .5,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      TagarellaIcons.ok,
                    ),
                    // Text(
                    //   'Confirmar',
                    //   style: TextStyle(fontSize: 9),
                    // )
                  ],
                ),
                onPressed: () {
                  if (!Tagarela.config.acessible) controller.validaSinal();
                },
                heroTag: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
