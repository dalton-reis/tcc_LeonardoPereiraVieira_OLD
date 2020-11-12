import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tagarela/app/shared/models/config.class.dart';

part 'config_controller.g.dart';

@Injectable()
class ConfigController = _ConfigControllerBase with _$ConfigController;

abstract class _ConfigControllerBase with Store {
  @observable
  int value = 0;

  @observable
  Config configuration;

  @action
  void increment() {
    value++;
  }
}
