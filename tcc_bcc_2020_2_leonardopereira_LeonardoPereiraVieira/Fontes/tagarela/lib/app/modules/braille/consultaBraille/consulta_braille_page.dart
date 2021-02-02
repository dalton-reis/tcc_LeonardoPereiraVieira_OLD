import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/components/GestureAccessibility/gesture_accessibility_widget.dart';
import 'package:tagarela/app/components/GestureTagarela/gesture_tagarela_widget.dart';
import 'package:tagarela/app/components/headerCurve/header_curve_widget.dart';
import 'package:tagarela/app/modules/braille/components/CelaBraille/cela_braille_widget.dart';
import 'package:tagarela/app/components/GestureAccessibility/OptionGesture.class.dart';
import 'package:tagarela/app/modules/braille/shared/models/braille.class.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';
import 'consulta_braille_controller.dart';

class ConsultaBraillePage extends StatefulWidget {
  final String title;
  const ConsultaBraillePage({Key key, this.title = "Consulta Braille"})
      : super(key: key);

  @override
  _ConsultaBraillePageState createState() => _ConsultaBraillePageState();
}

class _ConsultaBraillePageState
    extends ModularState<ConsultaBraillePage, ConsultaBrailleController> {
  //use 'controller' variable to access controller
  int cela = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureAccessibilityWidget(
        active: Tagarela.config.acessible,
        onTap: (position) {
          int ponto = 0;
          if (position == PositionTap.leftTop) ponto = 1;
          if (position == PositionTap.leftCenter) ponto = 2;
          if (position == PositionTap.leftButton) ponto = 3;
          if (position == PositionTap.rightTop) ponto = 4;
          if (position == PositionTap.rightCenter) ponto = 5;
          if (position == PositionTap.rightButton) ponto = 6;

          if ((controller.sinal1[ponto - 1] == '1' && cela == 1) ||
              (controller.sinal2[ponto - 1] == '1' && cela == 2)) {
            if (cela == 1)
              controller.sinal1 = controller.sinal1.replaceRange(ponto - 1, ponto, '0');
            if (cela == 2)
              controller.sinal2 = controller.sinal2.replaceRange(ponto - 1, ponto, '0');
          } else {
            if (cela == 1)
              controller.sinal1 = controller.sinal1.replaceRange(ponto - 1, ponto, '1');
            if (cela == 2) 
              controller.sinal2 = controller.sinal2.replaceRange(ponto - 1, ponto, '1');
          }

          controller.setLetra();
          String pontos1 = Braille.getPontoSinal(controller.sinal1);
          String pontos2 = Braille.getPontoSinal(controller.sinal2);
          return '${(pontos1 != '' ? 'Pontos primeira célula, ' + pontos1 : '')} ${(pontos2 != '' ? 'Pontos segunda célula, ' + pontos2 : '')} ${(controller.letra != '' ? '. Letra: ' + controller.letra : '')}';
        },
        options: [
          OptionGesture(
              action: () {
                cela = 1;
              },
              speak: 'Célula Braille 1, click duas vezes para confirmar'),
          OptionGesture(
              action: () {
                cela = 2;
              },
              speak: 'Célula Braille 2, click duas vezes para confirmar')
        ],
        primarySpeak:
            'Consulta sinais braille, \n click na tela para marcar um ponto, \n pontos 1 e 4 na parte superior, \n' +
                ' pontos 2 e 5 no centro e pontos 3 e 6 na parte infeirior. \n para navegar entre as células Braille arraste para o lado',
        initialOption: 0,
        loopOption: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * 0.3,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: BLACK),
              flexibleSpace: FlexibleSpaceBar(
                title: Observer(builder: (_) {
                  return Container(
                    child: Text(
                      controller.letra,
                      style: TextStyle(color: Colors.black, fontSize: 50),
                    ),
                  );
                }),
                centerTitle: true,
                titlePadding: EdgeInsetsDirectional.only(bottom: 0),
                background: HeaderCurveWidget(
                    gradient: 
                    LinearGradient(                      
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        BRAILLE_PRIMARY,
                        Colors.white,
                      ]
                    ),
                    size: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height * .3),
                    curve: 0.7,
                    bordeCurve: 0),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Stack(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Observer(builder: (_) {
                          return Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.05),
                            child: CelaBrailleWidget(
                              diameter:
                                  MediaQuery.of(context).size.shortestSide * .2,
                              sinalBraille: controller.sinal1,
                              action: (sinal) {
                                if (!Tagarela.config.acessible) {
                                  controller.sinal1 = sinal;
                                  controller.setLetra();
                                }
                              },
                            ),
                          );
                        }),
                        Spacer(),
                        Observer(builder: (context) {
                          return Container(
                            margin: EdgeInsets.all(
                                MediaQuery.of(context).size.width * 0.05),
                            child: CelaBrailleWidget(
                              diameter:
                                  MediaQuery.of(context).size.shortestSide * .2,
                              sinalBraille: controller.sinal2,
                              action: (sinal) {
                                if (!Tagarela.config.acessible) {
                                  controller.sinal2 = sinal;
                                  controller.setLetra();
                                }
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
