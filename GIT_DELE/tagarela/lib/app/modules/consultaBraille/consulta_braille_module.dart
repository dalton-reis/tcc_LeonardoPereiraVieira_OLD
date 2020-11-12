import 'consulta_braille_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'consulta_braille_page.dart';

class ConsultaBrailleModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ConsultaBrailleController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => ConsultaBraillePage()),
      ];

  static Inject get to => Inject<ConsultaBrailleModule>.of();
}
