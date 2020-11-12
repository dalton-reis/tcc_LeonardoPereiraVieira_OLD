import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/components/headerBubble/header_bubble_widget.dart';
import 'package:tagarela/app/components/menuTagarela/menu_tagarela_widget.dart';
import 'package:tagarela/app/components/tagarelaCard/tagarela_card_widget.dart';
import 'package:tagarela/app/modules/braille/shared/models/util_braille.class.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  Tagarela tagarela = Tagarela();

  @override
  void initState() {
    super.initState();
    if (Tagarela.config.acessible)
      tagarela.speak('Clique duas vezes para acessar o módulo Braille');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MenuTagarelaWidget(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            floating: false,
            pinned: true,
            iconTheme: IconThemeData(color: BLACK),
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              titlePadding: EdgeInsets.only(left: 15, bottom: 60),
              title: Text(
                "Tagarella",
                style: TextStyle(
                  fontFamily: 'Arial Rounded MT Bold Negrito',
                  fontSize: 38,
                ),
              ),
              background: Stack(
                children: [
                  Container(
                    height: 300,
                    child: HeaderBubbleWidget(
                      color: PRIMARY,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: GestureDetector(
              onDoubleTap: () {
                Modular.to.pushNamedAndRemoveUntil(
                  '/home/braille',
                  ModalRoute.withName('/home'),
                );
              },
              child: Container(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    TagarelaCardWidget(
                      '${PATH_IMAGES}Braille.png',
                      color: BRAILLE_PRIMARY,
                      title: "Braille",
                      fonteSize: MediaQuery.of(context).size.height * .04,
                      action: () {
                        ConfigBraille.getSlide().then((value) {
                          if (value) {
                            Modular.to.pushNamedAndRemoveUntil(
                              '/home/braille',
                              ModalRoute.withName('/home'),
                            );
                          } else {
                            Modular.to.pushNamedAndRemoveUntil(
                              '/home/slide',
                              ModalRoute.withName('/home'),
                            );
                          }
                        });
                      },
                    ),
                    // TagarelaCardWidget(
                    //   'lib/assets/images/Braille.png',
                    //   color: Colors.blue,
                    //   title: "Libras",
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
