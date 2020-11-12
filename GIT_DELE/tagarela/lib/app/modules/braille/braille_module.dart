import 'package:tagarela/app/modules/consultaBraille/consulta_braille_module.dart';
import 'package:tagarela/app/modules/maquinaBraille/maquina_braille_module.dart';
import 'package:tagarela/app/modules/praticaBraille/pratica_braille_module.dart';
import 'package:tagarela/app/modules/sinaisBraille/sinais_braille_module.dart';
import 'package:tagarela/app/modules/slideBraille/slide_braille_page.dart';

import 'braille_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'braille_page.dart';

class BrailleModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $BrailleController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => BraillePage()),
        ModularRouter('/sinais', module: SinaisBrailleModule()),
        ModularRouter('/consulta', module: ConsultaBrailleModule()),
        ModularRouter('/pratica', module: PraticaBrailleModule()),
        ModularRouter('/maquina', module: MaquinaBrailleModule()),
        ModularRouter('/slide', child: (_, args) => SlideBraillePage()),
      ];

  static Inject get to => Inject<BrailleModule>.of();
}
