import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/modules/braille/shared/models/braille.class.dart';

part 'consulta_braille_controller.g.dart';

@Injectable()
class ConsultaBrailleController = _ConsultaBrailleControllerBase
    with _$ConsultaBrailleController;

abstract class _ConsultaBrailleControllerBase with Store {
  @observable
  String sinal1;

  @observable
  String sinal2;

  @observable
  String letra = '';

  _ConsultaBrailleControllerBase() {
    sinal1 = '000000';
    sinal2 = '000000';
  }

  @action
  void setLetra() {
    letra = Braille.consultaSinalToString(sinal1, sinal2: sinal2);
  }
}
