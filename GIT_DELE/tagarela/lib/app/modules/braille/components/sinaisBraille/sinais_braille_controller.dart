import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
}
