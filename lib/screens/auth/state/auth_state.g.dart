// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AuthState on _AuthState, Store {
  final _$isLoggingInAtom = Atom(name: '_AuthState.isLoggingIn');

  @override
  bool get isLoggingIn {
    _$isLoggingInAtom.context.enforceReadPolicy(_$isLoggingInAtom);
    _$isLoggingInAtom.reportObserved();
    return super.isLoggingIn;
  }

  @override
  set isLoggingIn(bool value) {
    _$isLoggingInAtom.context.conditionallyRunInAction(() {
      super.isLoggingIn = value;
      _$isLoggingInAtom.reportChanged();
    }, _$isLoggingInAtom, name: '${_$isLoggingInAtom.name}_set');
  }
}
