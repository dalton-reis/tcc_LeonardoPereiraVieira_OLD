import 'maquina_braille_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'maquina_braille_page.dart';

class MaquinaBrailleModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $MaquinaBrailleController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => MaquinaBraillePage()),
      ];

  static Inject get to => Inject<MaquinaBrailleModule>.of();
}
