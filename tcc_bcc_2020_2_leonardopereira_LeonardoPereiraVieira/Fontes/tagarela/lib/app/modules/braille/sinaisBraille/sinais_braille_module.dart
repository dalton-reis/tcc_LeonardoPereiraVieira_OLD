import 'package:tagarela/app/modules/braille/components/example/example_page.dart';
import 'sinais_braille_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'sinais_braille_page.dart';

class SinaisBrailleModule extends ChildModule {
  @override
  List<Bind> get binds => [$SinaisBrailleController];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => SinaisBraillePage()),
        ModularRouter('/example',
            child: (_, args) => ExamplePage(
                  sinal: args.data,
                ))
      ];

  static Inject get to => Inject<SinaisBrailleModule>.of();
}
