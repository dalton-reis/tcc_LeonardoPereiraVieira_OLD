import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/components/GestureAccessibility/gesture_accessibility_widget.dart';
import 'package:tagarela/app/components/cardimagetitle/card_image_title_widget.dart';
import 'package:tagarela/app/components/headerWave/header_wave_widget.dart';
import 'package:tagarela/app/components/menuTagarela/menu_tagarela_widget.dart';
import 'package:tagarela/app/modules/braille/shared/models/util_braille.class.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';
import 'braille_controller.dart';

class BraillePage extends StatefulWidget {
  final String title;
  const BraillePage({Key key, this.title = "Braille"}) : super(key: key);

  @override
  _BraillePageState createState() => _BraillePageState();
}

class _BraillePageState extends ModularState<BraillePage, BrailleController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SECONDARY,
      drawer: MenuTagarelaWidget(
        corlorHeader: BRAILLE_PRIMARY,
        extraTile: [
          ListTile(
            leading: Icon(Icons.live_help),
            title: Text(
              'Demostração',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              ConfigBraille.setSlide(false);
              Modular.to.pushNamed('home/braille/slide');
            },
          ),
        ],
      ),
      body: GestureAccessibilityWidget(
        onTap: (position) {},
        active: Tagarela.config.acessible,
        options: controller.options,
        primarySpeak: 'Tagarela Braille, arraste para o lado para consultar ' +
            'as opções e click duas vezes pra selecionar a opção',
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height * .35,
              floating: false,
              pinned: true,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: BLACK),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: HeaderWaveWidget(
                        color: BRAILLE_PRIMARY,
                      ),
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(
                              '${PATH_IMAGES}Braille_B.png',
                              height: MediaQuery.of(context).size.height * .18,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * .15,
                              child: AutoSizeText(
                                "TAGARELLA BRAILLE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'visualbraille',
                                  fontSize:
                                      MediaQuery.of(context).size.shortestSide *
                                          0.11,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Container(
                child: GridView.count(
                  padding: const EdgeInsets.all(20.0),
                  crossAxisSpacing:
                      MediaQuery.of(context).size.longestSide * .01,
                  mainAxisSpacing:
                      MediaQuery.of(context).size.longestSide * .01,
                  crossAxisCount: 2,
                  children: [
                    CardImageTitleWidget(
                      title: "Sinais",
                      pathImage: "${PATH_IMAGES}sinais_braille.png",
                      primaryColor: BRAILLE_PRIMARY,
                      secondaryColor: BRAILLE_SECONDARY,
                      onPressed: () {
                        if (!Tagarela.config.acessible)
                          Modular.to.pushNamed('home/braille/sinais');
                      },
                    ),
                    CardImageTitleWidget(
                      title: "Consulta",
                      pathImage: "${PATH_IMAGES}consulta_braille.png",
                      primaryColor: BRAILLE_PRIMARY,
                      secondaryColor: BRAILLE_SECONDARY,
                      onPressed: () {
                        if (!Tagarela.config.acessible)
                          Modular.to.pushNamed('home/braille/consulta');
                      },
                    ),
                    CardImageTitleWidget(
                      title: "Prática",
                      pathImage: "${PATH_IMAGES}pratica_braille.png",
                      primaryColor: BRAILLE_PRIMARY,
                      secondaryColor: BRAILLE_SECONDARY,
                      onPressed: () {
                        if (!Tagarela.config.acessible)
                          Modular.to.pushNamed('home/braille/pratica');
                      },
                    ),
                    CardImageTitleWidget(
                      title: "Máquina Braille",
                      pathImage: "${PATH_IMAGES}maquina_braille.png",
                      primaryColor: BRAILLE_PRIMARY,
                      secondaryColor: BRAILLE_SECONDARY,
                      onPressed: () {
                        if (!Tagarela.config.acessible)
                          Modular.to.pushNamed('home/braille/maquina');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
