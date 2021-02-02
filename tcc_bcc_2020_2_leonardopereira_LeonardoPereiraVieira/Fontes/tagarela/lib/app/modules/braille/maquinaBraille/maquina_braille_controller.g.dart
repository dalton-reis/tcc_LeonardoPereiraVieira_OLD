// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maquina_braille_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MaquinaBrailleController = BindInject(
  (i) => MaquinaBrailleController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MaquinaBrailleController on _MaquinaBrailleControllerBase, Store {
  final _$textoBrailleAtom =
      Atom(name: '_MaquinaBrailleControllerBase.textoBraille');

  @override
  List<String> get textoBraille {
    _$textoBrailleAtom.reportRead();
    return super.textoBraille;
  }

  @override
  set textoBraille(List<String> value) {
    _$textoBrailleAtom.reportWrite(value, super.textoBraille, () {
      super.textoBraille = value;
    });
  }

  final _$textoAtom = Atom(name: '_MaquinaBrailleControllerBase.texto');

  @override
  List<String> get texto {
    _$textoAtom.reportRead();
    return super.texto;
  }

  @override
  set texto(List<String> value) {
    _$textoAtom.reportWrite(value, super.texto, () {
      super.texto = value;
    });
  }

  final _$sinalAtom = Atom(name: '_MaquinaBrailleControllerBase.sinal');

  @override
  String get sinal {
    _$sinalAtom.reportRead();
    return super.sinal;
  }

  @override
  set sinal(String value) {
    _$sinalAtom.reportWrite(value, super.sinal, () {
      super.sinal = value;
    });
  }

  final _$valueAtom = Atom(name: '_MaquinaBrailleControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_MaquinaBrailleControllerBaseActionController =
      ActionController(name: '_MaquinaBrailleControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_MaquinaBrailleControllerBaseActionController
        .startAction(name: '_MaquinaBrailleControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_MaquinaBrailleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSinal() {
    final _$actionInfo = _$_MaquinaBrailleControllerBaseActionController
        .startAction(name: '_MaquinaBrailleControllerBase.addSinal');
    try {
      return super.addSinal();
    } finally {
      _$_MaquinaBrailleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeSinal() {
    final _$actionInfo = _$_MaquinaBrailleControllerBaseActionController
        .startAction(name: '_MaquinaBrailleControllerBase.removeSinal');
    try {
      return super.removeSinal();
    } finally {
      _$_MaquinaBrailleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textoBraille: ${textoBraille},
texto: ${texto},
sinal: ${sinal},
value: ${value}
    ''';
  }
}
