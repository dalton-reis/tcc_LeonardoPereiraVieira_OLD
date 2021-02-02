import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/icons/tagarella_icons_icons.dart';
import 'package:tagarela/app/modules/braille/shared/models/util_braille.class.dart';
import 'package:tagarela/app/shared/models/tagarela.class.dart';

class SlideBraillePage extends StatefulWidget {
  final String title;
  const SlideBraillePage({Key key, this.title = "Slide"}) : super(key: key);

  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlideBraillePage> {
  final List<String> imgList = [
    'assets/images/slide_braille/bem_vindo_braille.png',
    'assets/images/slide_braille/estudante_braille.png',
    'assets/images/slide_braille/adaptado_braille.png',
    'assets/images/slide_braille/audio_braille.png',
    'assets/images/slide_braille/toque_braille.png',
    'assets/images/slide_braille/arrastar_braille.png',
    'assets/images/slide_braille/cela_braille.png',
    'assets/images/slide_braille/comecar_braille.png',
    '',
  ];

  final List<String> txtList = [
    'Bem vindo ao tagarela Braille',
    'Esse módulo é focado no aprendizado do Braille.',
    'O Módulo é adaptado para pessoas com deficiência visual, mas também pode ser usado por pessoas normovisuais.',
    'O modo de acessibilidade pode ser desabilitada ou configurado no menu lateral.',
    'As instruções são informadas ao entrar na tela, mas você pode manter a tela pressionada para repetir.',
    'Para navegar entre as opções você pode arrastar para o lado, e com um clique duplo na tela selecionar a opção.',
    'Para algumas funcionalidades que usam células braille, cada posição da tela representa um ponto.',
    'Vamos começar!',
    ''
  ];
  Tagarela tagarela = Tagarela();
  @override
  void initState() {
    super.initState();
    tagarela.speak(txtList[0]);
  }

  pageHome() {
    Modular.to.pushNamedAndRemoveUntil(
      '/home/braille',
      ModalRoute.withName('/home'),
    );
  }

  @override
  void dispose() {
    super.dispose();
    ConfigBraille.setSlide(true);
  }

  bool next = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Container(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: MediaQuery.of(context).size.height * .7,
                  autoPlay: next,
                  autoPlayAnimationDuration: Duration(seconds: 3),
                  autoPlayInterval:
                      Duration(seconds: Tagarela.config.acessible ? 2 : 6),
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  pauseAutoPlayInFiniteScroll: true,
                  onPageChanged: (index, reason) {
                    tagarela.flutterTts.setCompletionHandler(() {
                      setState(() {
                        next = true;
                      });
                    });
                    setState(() {
                      next = false;
                    });
                    tagarela.speak(txtList[index]);

                    if (index == 8) pageHome();
                  },
                ),
                items: List.generate(9, (index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          imgList[index] != ''
                              ? Image.asset(
                                  imgList[index],
                                  fit: BoxFit.cover,
                                  height:
                                      MediaQuery.of(context).size.height * .3,
                                )
                              : Container(),
                          Divider(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          txtList[index] != ''
                              ? Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Text(
                                    txtList[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily:
                                          'Arial Rounded MT Bold Negrito',
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  );
                }),
              ),
              Align(
                child: FlatButton.icon(
                  onPressed: () {
                    pageHome();
                  },
                  label: Text(
                    'Pular introdução',
                  ),
                  icon: Icon(TagarellaIcons.arrow_right),
                ),
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
