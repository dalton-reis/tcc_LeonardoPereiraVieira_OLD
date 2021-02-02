import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/components/GestureAccessibility/gesture_accessibility_widget.dart';
import 'package:tagarela/app/components/GestureTagarela/gesture_tagarela_widget.dart';
import 'package:tagarela/app/icons/tagarella_icons_icons.dart';
import 'package:tagarela/app/modules/braille/components/sinaisBraille/sinais_braille_widget.dart';
import 'package:tagarela/app/modules/braille/shared/models/palavraBraille.class.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';
import 'sinais_braille_controller.dart';

class SinaisBraillePage extends StatefulWidget {
  final String title;
  const SinaisBraillePage({Key key, this.title = "Sinais Braille"})
      : super(key: key);

  @override
  _SinaisBraillePageState createState() => _SinaisBraillePageState();
}

class _SinaisBraillePageState
    extends ModularState<SinaisBraillePage, SinaisBrailleController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: BRAILLE_PRIMARY,
      ),
      body: GestureAccessibilityWidget(
        active: Tagarela.config.acessible,
        onTap: (position) {
          if (position == PositionTap.leftButton) {
            if (Tagarela.config.acessible) controller.decrement();
            return (controller.value + 1).toString() + 'º Série de sinais';
          }
          if (position == PositionTap.rightButton) {
            if (Tagarela.config.acessible) controller.increment();
            return (controller.value + 1).toString() + 'º Série de sinais';
          }
        },
        primarySpeak:
            'Sinais braille, arraste para os lados para selecionar uma letra e click duas vezes para ver exemplo. ou click nos cantos inferiores da tela para próxima série de sinais ou anterior',
        child: SingleChildScrollView(
          child: Observer(builder: (_) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    '${controller.value + 1}º Série de sinais',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                SinaisBrailleWidget(
                  serie: controller.serieSinais[controller.value],
                  margin: EdgeInsets.only(top: 20),
                  onClick: (PalavraBraille sinal) {
                    Modular.to.pushNamed('/home/braille/sinais/example',
                        arguments: sinal);
                  },
                ),
              ],
            );
          }),
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        margin: EdgeInsets.only(left: 35),
        alignment: Alignment.lerp(Alignment.topLeft, Alignment.bottomRight, 60),
        child: Observer(builder: (_) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: controller.value == 0
                    ? Container(width: 60)
                    : FloatingActionButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(TagarellaIcons.arrow_left),
                          ],
                        ),
                        onPressed: () {
                          if (!Tagarela.config.acessible)
                            controller.decrement();
                        },
                        heroTag: null,
                      ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
              ),
              Align(
                alignment: Alignment.topRight,
                child: controller.value == controller.serieSinais.length - 1
                    ? Container()
                    : FloatingActionButton(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(TagarellaIcons.arrow_right),
                          ],
                        ),
                        onPressed: () {
                          if (!Tagarela.config.acessible)
                            controller.increment();
                        },
                        heroTag: null,
                      ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
