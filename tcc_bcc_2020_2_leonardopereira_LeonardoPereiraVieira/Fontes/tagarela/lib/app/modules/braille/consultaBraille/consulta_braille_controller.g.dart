// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consulta_braille_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ConsultaBrailleController = BindInject(
  (i) => ConsultaBrailleController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsultaBrailleController on _ConsultaBrailleControllerBase, Store {
  final _$sinal1Atom = Atom(name: '_ConsultaBrailleControllerBase.sinal1');

  @override
  String get sinal1 {
    _$sinal1Atom.reportRead();
    return super.sinal1;
  }

  @override
  set sinal1(String value) {
    _$sinal1Atom.reportWrite(value, super.sinal1, () {
      super.sinal1 = value;
    });
  }

  final _$sinal2Atom = Atom(name: '_ConsultaBrailleControllerBase.sinal2');

  @override
  String get sinal2 {
    _$sinal2Atom.reportRead();
    return super.sinal2;
  }

  @override
  set sinal2(String value) {
    _$sinal2Atom.reportWrite(value, super.sinal2, () {
      super.sinal2 = value;
    });
  }

  final _$letraAtom = Atom(name: '_ConsultaBrailleControllerBase.letra');

  @override
  String get letra {
    _$letraAtom.reportRead();
    return super.letra;
  }

  @override
  set letra(String value) {
    _$letraAtom.reportWrite(value, super.letra, () {
      super.letra = value;
    });
  }

  final _$_ConsultaBrailleControllerBaseActionController =
      ActionController(name: '_ConsultaBrailleControllerBase');

  @override
  void setLetra() {
    final _$actionInfo = _$_ConsultaBrailleControllerBaseActionController
        .startAction(name: '_ConsultaBrailleControllerBase.setLetra');
    try {
      return super.setLetra();
    } finally {
      _$_ConsultaBrailleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sinal1: ${sinal1},
sinal2: ${sinal2},
letra: ${letra}
    ''';
  }
}
