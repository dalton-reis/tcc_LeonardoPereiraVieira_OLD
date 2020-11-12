import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/modules/braille/shared/models/braille.class.dart';

part 'maquina_braille_controller.g.dart';

@Injectable()
class MaquinaBrailleController = _MaquinaBrailleControllerBase
    with _$MaquinaBrailleController;

abstract class _MaquinaBrailleControllerBase with Store {
  @observable
  List<String> textoBraille = [];

  @observable
  List<String> texto = [];

  @observable
  String sinal = Braille.S_VAZIO;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  bool upper, supperUpper, number;

  _MaquinaBrailleControllerBase() {
    upper = false;
    number = false;
    supperUpper = false;
  }

  @action
  void addSinal() {
    var caracter = '';
    if (number && sinal != Braille.S_VAZIO)
      caracter = Braille.escritaSinalToString('001111', sinal2: sinal);
    else
      caracter = Braille.escritaSinalToString(sinal);

    if (caracter == Braille.C_NUMERO) {
      number = true;
      texto.add('');
      textoBraille.add(caracter);
    } else if (caracter == Braille.C_UPPER) {
      supperUpper = upper;
      upper = true;
      texto.add('');
      textoBraille.add(caracter);
    } else {
      if (upper) {
        texto.add(caracter.toUpperCase());
        textoBraille.add(caracter.toUpperCase());
      } else {
        texto.add(caracter);
        textoBraille.add(caracter);
      }
      supperUpper = (caracter != ' ') && supperUpper;
      number = caracter.contains(RegExp('[0-9]')) && number;
      upper = supperUpper;
    }

    sinal = Braille.S_VAZIO;
  }

  @action
  void removeSinal() {
    var caracterRemovido = '';
    if (texto.length > 0)
      texto.removeLast();
    else {
      upper = false;
      number = false;
      supperUpper = false;
    }
    if (textoBraille.length > 0) {
      caracterRemovido = textoBraille.removeLast();
      number = caracterRemovido.contains(RegExp('[0-9]'));

      int idxText = textoBraille.length;
      supperUpper = ((textoBraille.length > 1) &&
              caracterRemovido.contains(RegExp('[A-Z]')) &&
              ((textoBraille[idxText - 1] == Braille.C_UPPER &&
                      textoBraille[idxText - 2] == Braille.C_UPPER) ||
                  textoBraille[idxText - 1].contains(RegExp('[A-Z]')))) ||
          ((caracterRemovido == ' ' && textoBraille.length > 2) &&
              (textoBraille[idxText - 1].contains(RegExp('[A-Z]')) &&
                  ((textoBraille[idxText - 2] == Braille.C_UPPER &&
                          textoBraille[idxText - 3] == Braille.C_UPPER) ||
                      textoBraille[idxText - 2].contains(RegExp('[A-Z]')))));

      upper = supperUpper ||
          ((textoBraille.length > 0) &&
              (textoBraille[idxText - 1] == Braille.C_UPPER));
    } else {
      upper = false;
      number = false;
      supperUpper = false;
    }
    sinal = Braille.S_VAZIO;
  }
}
