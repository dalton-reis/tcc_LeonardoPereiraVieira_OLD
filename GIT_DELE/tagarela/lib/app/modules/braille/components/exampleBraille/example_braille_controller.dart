import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'example_braille_controller.g.dart';

@Injectable()
class ExampleBrailleController = _ExampleBrailleControllerBase
    with _$ExampleBrailleController;

abstract class _ExampleBrailleControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
