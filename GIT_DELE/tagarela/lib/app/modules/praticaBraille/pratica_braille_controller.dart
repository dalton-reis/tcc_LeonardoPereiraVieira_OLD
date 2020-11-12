import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/modules/braille/shared/models/braille.class.dart';

part 'pratica_braille_controller.g.dart';

@Injectable()
class PraticaBrailleController = _PraticaBrailleControllerBase
    with _$PraticaBrailleController;

abstract class _PraticaBrailleControllerBase with Store {
  List<String> palavras = [];

  @observable
  String palavraAtual = '';

  String letra = '';

  @observable
  String sinalBraille = '000000';

  _PraticaBrailleControllerBase() {
    Braille.mapImages.forEach((key, value) {
      palavras.add(key);
    });
    palavras.shuffle();
    getPalavra();
  }
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  void getPalavra() {
    palavraAtual = palavras.removeAt(0);
    var r = Random();
    letra = palavraAtual[r.nextInt(palavraAtual.length)];
  }

  @action
  void pularPalavra() {
    palavras.add(palavraAtual);
    getPalavra();
  }

  String getLetraSinal(String sinal) {
    return Braille.consultaSinalToString(sinal);
  }

  bool validaSinal() {
    bool correct = false;
    var s = Braille.consultaSinalToString(sinalBraille);
    if (s == letra) {
      getPalavra();
      correct = true;
    }
    sinalBraille = '000000';
    return correct;
  }
}
