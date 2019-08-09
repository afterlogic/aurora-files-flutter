// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'files_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$FilesState on _FilesState, Store {
  final _$currentFilesAtom = Atom(name: '_FilesState.currentFiles');

  @override
  List get currentFiles {
    _$currentFilesAtom.context.enforceReadPolicy(_$currentFilesAtom);
    _$currentFilesAtom.reportObserved();
    return super.currentFiles;
  }

  @override
  set currentFiles(List value) {
    _$currentFilesAtom.context.conditionallyRunInAction(() {
      super.currentFiles = value;
      _$currentFilesAtom.reportChanged();
    }, _$currentFilesAtom, name: '${_$currentFilesAtom.name}_set');
  }

  final _$currentPathAtom = Atom(name: '_FilesState.currentPath');

  @override
  String get currentPath {
    _$currentPathAtom.context.enforceReadPolicy(_$currentPathAtom);
    _$currentPathAtom.reportObserved();
    return super.currentPath;
  }

  @override
  set currentPath(String value) {
    _$currentPathAtom.context.conditionallyRunInAction(() {
      super.currentPath = value;
      _$currentPathAtom.reportChanged();
    }, _$currentPathAtom, name: '${_$currentPathAtom.name}_set');
  }

  final _$isFilesLoadingAtom = Atom(name: '_FilesState.isFilesLoading');

  @override
  bool get isFilesLoading {
    _$isFilesLoadingAtom.context.enforceReadPolicy(_$isFilesLoadingAtom);
    _$isFilesLoadingAtom.reportObserved();
    return super.isFilesLoading;
  }

  @override
  set isFilesLoading(bool value) {
    _$isFilesLoadingAtom.context.conditionallyRunInAction(() {
      super.isFilesLoading = value;
      _$isFilesLoadingAtom.reportChanged();
    }, _$isFilesLoadingAtom, name: '${_$isFilesLoadingAtom.name}_set');
  }

  final _$onGetFilesAsyncAction = AsyncAction('onGetFiles');

  @override
  Future<void> onGetFiles({String path = ""}) {
    return _$onGetFilesAsyncAction.run(() => super.onGetFiles(path: path));
  }

  final _$_FilesStateActionController = ActionController(name: '_FilesState');

  @override
  void onLevelUp() {
    final _$actionInfo = _$_FilesStateActionController.startAction();
    try {
      return super.onLevelUp();
    } finally {
      _$_FilesStateActionController.endAction(_$actionInfo);
    }
  }
}
