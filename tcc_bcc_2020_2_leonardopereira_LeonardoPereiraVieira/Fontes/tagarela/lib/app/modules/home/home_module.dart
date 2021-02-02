import 'package:tagarela/app/modules/braille/braille_module.dart';
import 'package:tagarela/app/modules/config/config_module.dart';
import 'package:tagarela/app/modules/braille/slideBraille/slide_braille_page.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/braille', module: BrailleModule()),
        ModularRouter('/config', module: ConfigModule()),
        ModularRouter('/slide', child: (_, args) => SlideBraillePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
