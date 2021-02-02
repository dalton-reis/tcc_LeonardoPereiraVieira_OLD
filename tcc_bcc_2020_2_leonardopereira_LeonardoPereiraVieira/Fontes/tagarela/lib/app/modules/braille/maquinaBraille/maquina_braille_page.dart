import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/components/BoxText/box_text_widget.dart';
import 'package:tagarela/app/components/ButtonDoubleFooter/button_double_footer_widget.dart';
import 'package:tagarela/app/components/ButtonErase/button_erase_widget.dart';
import 'package:tagarela/app/components/GestureAccessibility/OptionGesture.class.dart';
import 'package:tagarela/app/components/GestureAccessibility/gesture_accessibility_widget.dart';
import 'package:tagarela/app/components/GestureTagarela/gesture_tagarela_widget.dart';
import 'package:tagarela/app/icons/tagarella_icons_icons.dart';
import 'package:tagarela/app/modules/braille/components/CelaBraille/cela_braille_widget.dart';
import 'package:tagarela/app/modules/braille/shared/models/braille.class.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';
import 'maquina_braille_controller.dart';

class MaquinaBraillePage extends StatefulWidget {
  final String title;
  const MaquinaBraillePage({Key key, this.title = "Máquina Braille"})
      : super(key: key);

  @override
  _MaquinaBraillePageState createState() => _MaquinaBraillePageState();
}

class _MaquinaBraillePageState
    extends ModularState<MaquinaBraillePage, MaquinaBrailleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: BRAILLE_PRIMARY,
      ),
      body: GestureAccessibilityWidget(
        active: Tagarela.config.acessible,
        primarySpeak:
            'Máquina Braille, para marcar os pontos 1 e 4 click na parte supeior da tela \n para pontos 2 e 5 click no centro \n e para os pontos 3 e 6 na parte inferior \n ' +
                'arraste para o lado para navegar entre confirmar e deletar',
        onTap: (position) {
          int ponto = 0;
          if (position == PositionTap.leftTop) ponto = 1;
          if (position == PositionTap.leftCenter) ponto = 2;
          if (position == PositionTap.leftButton) ponto = 3;
          if (position == PositionTap.rightTop) ponto = 4;
          if (position == PositionTap.rightCenter) ponto = 5;
          if (position == PositionTap.rightButton) ponto = 6;

          if (controller.sinal[ponto - 1] == '1') {
            controller.sinal =
                controller.sinal.replaceRange(ponto - 1, ponto, '0');
          } else {
            controller.sinal =
                controller.sinal.replaceRange(ponto - 1, ponto, '1');
          }

          String pontos = Braille.getPontoSinal(controller.sinal);
          return '${(pontos != '' ? 'Pontos, ' + pontos : '')}';
        },
        loopOption: false,
        initialOption: 0,
        options: [
          OptionGesture(
              speak: 'Apagar, click duas vezes para apagar',
              action: () {
                controller.removeSinal();
                print(controller.texto.toString());
                return controller.texto.length > 0
                    ? 'Texto: ${controller.texto.toString().replaceAll(', ', '')}.'
                    : '';
              }),
          OptionGesture(
              speak: 'Confirmar, click duas vezes para confirmar',
              action: () {
                controller.addSinal();
                return controller.texto.length > 0
                    ? 'Texto: ${controller.texto.toString().replaceAll(', ', '')}.'
                    : '';
              }),
        ],
        child: SingleChildScrollView(
          child: Observer(
            builder: (BuildContext context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxTextWidget(
                    text: controller.texto,
                    textStyle: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontFamily: 'asap-vf-beta'),
                  ),
                  BoxTextWidget(
                    text: controller.textoBraille,
                    textStyle: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontFamily: 'Tagarela_braille_point'),
                  ),
                  Container(
                    child: Center(
                      child: CelaBrailleWidget(
                        diameter:
                            MediaQuery.of(context).size.shortestSide * .15,
                        sinalBraille: controller.sinal,
                        action: (sinal) {
                          controller.sinal = sinal;
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: ButtonDoubleFooterWidget(
        button1: ButtonEraseWidget(
          width: 65,
          height: 64,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                TagarellaIcons.cancel,
                color: Colors.white,
                size: 30,
              ),
              // Text(
              //   'Delete',
              //   style: TextStyle(
              //     fontSize: 10,
              //     color: Colors.white,
              //   ),
              // )
            ],
          ),
          onPressed: () {
            if (!Tagarela.config.acessible) controller.removeSinal();
          },
        ),
        button2: FloatingActionButton(
          backgroundColor: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                TagarellaIcons.ok,
                size: 30,
              ),
              // Text(
              //   'Confirmar',
              //   style: TextStyle(fontSize: 9),
              // )
            ],
          ),
          onPressed: () {
            if (!Tagarela.config.acessible) controller.addSinal();
          },
        ),
      ),
    );
  }
}
