// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sinais_braille_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $SinaisBrailleController = BindInject(
  (i) => SinaisBrailleController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SinaisBrailleController on _SinaisBrailleControllerBase, Store {
  final _$serieSinaisAtom =
      Atom(name: '_SinaisBrailleControllerBase.serieSinais');

  @override
  List<SerieBraille> get serieSinais {
    _$serieSinaisAtom.reportRead();
    return super.serieSinais;
  }

  @override
  set serieSinais(List<SerieBraille> value) {
    _$serieSinaisAtom.reportWrite(value, super.serieSinais, () {
      super.serieSinais = value;
    });
  }

  final _$valueAtom = Atom(name: '_SinaisBrailleControllerBase.value');

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

  final _$_SinaisBrailleControllerBaseActionController =
      ActionController(name: '_SinaisBrailleControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_SinaisBrailleControllerBaseActionController
        .startAction(name: '_SinaisBrailleControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_SinaisBrailleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_SinaisBrailleControllerBaseActionController
        .startAction(name: '_SinaisBrailleControllerBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_SinaisBrailleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serieSinais: ${serieSinais},
value: ${value}
    ''';
  }
}
