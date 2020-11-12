import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/components/GestureAccessibility/OptionGesture.class.dart';

part 'braille_controller.g.dart';

@Injectable()
class BrailleController = _BrailleControllerBase with _$BrailleController;

abstract class _BrailleControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  List<OptionGesture> options = [
    OptionGesture(navegateTo: 'home/braille/sinais', speak: 'sinais'),
    OptionGesture(navegateTo: 'home/braille/consulta', speak: 'consulta'),
    OptionGesture(navegateTo: 'home/braille/pratica', speak: 'prática'),
    OptionGesture(navegateTo: 'home/braille/maquina', speak: 'máquina Braille')
  ];
}
