import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/modules/braille/shared/models/palavraBraille.class.dart';

part 'sinais_braille_controller.g.dart';

@Injectable()
class SinaisBrailleController = _SinaisBrailleControllerBase
    with _$SinaisBrailleController;

abstract class _SinaisBrailleControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  getExemple(PalavraBraille sinal) {
    Modular.to.pushNamed('home/braille/sinais/exemplo', arguments: sinal);
  }
}
