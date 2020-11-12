import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/modules/braille/shared/models/braille.class.dart';
import 'package:tagarela/app/modules/braille/shared/models/serieBraille.class.dart';
part 'sinais_braille_controller.g.dart';

@Injectable()
class SinaisBrailleController = _SinaisBrailleControllerBase
    with _$SinaisBrailleController;

abstract class _SinaisBrailleControllerBase with Store {
  @observable
  List<SerieBraille> serieSinais = List<SerieBraille>();

  @observable
  int value = 0;

  _SinaisBrailleControllerBase() {
    SerieBraille serie1 = SerieBraille();
    for (var j = 0; j < 10; j++) {
      serie1.addSinal(Braille.PALAVRAS_BRAILLE[j]);
    }
    serieSinais.add(serie1);

    SerieBraille serie2 = SerieBraille();

    for (var j = 10; j < 20; j++) {
      serie2.addSinal(Braille.PALAVRAS_BRAILLE[j]);
    }
    serieSinais.add(serie2);

    SerieBraille serie3 = SerieBraille();
    for (var j = 20; j < 30; j++) {
      serie3.addSinal(Braille.PALAVRAS_BRAILLE[j]);
    }
    serieSinais.add(serie3);

    SerieBraille serie4 = SerieBraille();
    for (var j = 30; j < 40; j++) {
      serie4.addSinal(Braille.PALAVRAS_BRAILLE[j]);
    }
    serieSinais.add(serie4);

    SerieBraille serie5 = SerieBraille();
    for (var j = 40; j < 52; j++) {
      serie5.addSinal(Braille.PALAVRAS_BRAILLE[j]);
    }
    serieSinais.add(serie5);

    SerieBraille serie6 = SerieBraille();
    for (var j = 52; j < 58; j++) {
      serie6.addSinal(Braille.PALAVRAS_BRAILLE[j]);
    }
    serieSinais.add(serie6);

    SerieBraille serie7 = SerieBraille();
    for (var j = 58; j < 65; j++) {
      serie7.addSinal(Braille.PALAVRAS_BRAILLE[j]);
    }
    serieSinais.add(serie7);
  }

  @action
  void increment() {
    if (value < serieSinais.length - 1) value++;
  }

  @action
  void decrement() {
    if (value > 0) value--;
  }
}
