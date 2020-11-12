import 'config_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'config_page.dart';

class ConfigModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ConfigController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ConfigPage()),
      ];

  static Inject get to => Inject<ConfigModule>.of();
}
