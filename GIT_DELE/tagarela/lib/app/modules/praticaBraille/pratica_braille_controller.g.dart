// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pratica_braille_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $PraticaBrailleController = BindInject(
  (i) => PraticaBrailleController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PraticaBrailleController on _PraticaBrailleControllerBase, Store {
  final _$palavraAtualAtom =
      Atom(name: '_PraticaBrailleControllerBase.palavraAtual');

  @override
  String get palavraAtual {
    _$palavraAtualAtom.reportRead();
    return super.palavraAtual;
  }

  @override
  set palavraAtual(String value) {
    _$palavraAtualAtom.reportWrite(value, super.palavraAtual, () {
      super.palavraAtual = value;
    });
  }

  final _$sinalBrailleAtom =
      Atom(name: '_PraticaBrailleControllerBase.sinalBraille');

  @override
  String get sinalBraille {
    _$sinalBrailleAtom.reportRead();
    return super.sinalBraille;
  }

  @override
  set sinalBraille(String value) {
    _$sinalBrailleAtom.reportWrite(value, super.sinalBraille, () {
      super.sinalBraille = value;
    });
  }

  final _$valueAtom = Atom(name: '_PraticaBrailleControllerBase.value');

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

  final _$_PraticaBrailleControllerBaseActionController =
      ActionController(name: '_PraticaBrailleControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_PraticaBrailleControllerBaseActionController
        .startAction(name: '_PraticaBrailleControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_PraticaBrailleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getPalavra() {
    final _$actionInfo = _$_PraticaBrailleControllerBaseActionController
        .startAction(name: '_PraticaBrailleControllerBase.getPalavra');
    try {
      return super.getPalavra();
    } finally {
      _$_PraticaBrailleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pularPalavra() {
    final _$actionInfo = _$_PraticaBrailleControllerBaseActionController
        .startAction(name: '_PraticaBrailleControllerBase.pularPalavra');
    try {
      return super.pularPalavra();
    } finally {
      _$_PraticaBrailleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
palavraAtual: ${palavraAtual},
sinalBraille: ${sinalBraille},
value: ${value}
    ''';
  }
}
