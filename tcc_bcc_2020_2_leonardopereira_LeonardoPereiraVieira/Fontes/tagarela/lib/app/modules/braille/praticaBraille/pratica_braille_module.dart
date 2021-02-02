import 'pratica_braille_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'pratica_braille_page.dart';

class PraticaBrailleModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $PraticaBrailleController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => PraticaBraillePage()),
      ];

  static Inject get to => Inject<PraticaBrailleModule>.of();
}
