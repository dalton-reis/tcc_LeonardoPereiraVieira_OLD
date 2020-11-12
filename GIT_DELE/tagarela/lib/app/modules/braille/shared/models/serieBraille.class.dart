import 'package:tagarela/app/modules/braille/shared/models/palavraBraille.class.dart';

class SerieBraille {
  List<PalavraBraille> _sinais;

  List<PalavraBraille> get sinais => _sinais;

  set sinais(List<PalavraBraille> sinais) {
    _sinais = sinais;
  }

  SerieBraille() {
    sinais = List<PalavraBraille>();
  }

  addSinal(PalavraBraille sinal) {
    sinais.add(sinal);
  }
}
