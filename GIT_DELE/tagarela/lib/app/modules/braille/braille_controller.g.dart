// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'braille_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $BrailleController = BindInject(
  (i) => BrailleController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BrailleController on _BrailleControllerBase, Store {
  final _$valueAtom = Atom(name: '_BrailleControllerBase.value');

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

  final _$_BrailleControllerBaseActionController =
      ActionController(name: '_BrailleControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_BrailleControllerBaseActionController.startAction(
        name: '_BrailleControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_BrailleControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
