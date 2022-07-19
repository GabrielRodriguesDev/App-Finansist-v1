// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entidade_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EntidadeStore on _EntidadeStore, Store {
  late final _$entidadesAtom =
      Atom(name: '_EntidadeStore.entidades', context: context);

  @override
  ObservableList<Entidade> get entidades {
    _$entidadesAtom.reportRead();
    return super.entidades;
  }

  @override
  set entidades(ObservableList<Entidade> value) {
    _$entidadesAtom.reportWrite(value, super.entidades, () {
      super.entidades = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_EntidadeStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$entidadeAtom =
      Atom(name: '_EntidadeStore.entidade', context: context);

  @override
  Entidade? get entidade {
    _$entidadeAtom.reportRead();
    return super.entidade;
  }

  @override
  set entidade(Entidade? value) {
    _$entidadeAtom.reportWrite(value, super.entidade, () {
      super.entidade = value;
    });
  }

  late final _$sofreuAlteracaoAtom =
      Atom(name: '_EntidadeStore.sofreuAlteracao', context: context);

  @override
  bool get sofreuAlteracao {
    _$sofreuAlteracaoAtom.reportRead();
    return super.sofreuAlteracao;
  }

  @override
  set sofreuAlteracao(bool value) {
    _$sofreuAlteracaoAtom.reportWrite(value, super.sofreuAlteracao, () {
      super.sofreuAlteracao = value;
    });
  }

  late final _$pesquisarEntidadesAsyncAction =
      AsyncAction('_EntidadeStore.pesquisarEntidades', context: context);

  @override
  Future<void> pesquisarEntidades() {
    return _$pesquisarEntidadesAsyncAction
        .run(() => super.pesquisarEntidades());
  }

  late final _$saveEntidadeAsyncAction =
      AsyncAction('_EntidadeStore.saveEntidade', context: context);

  @override
  Future<void> saveEntidade() {
    return _$saveEntidadeAsyncAction.run(() => super.saveEntidade());
  }

  late final _$deletarEntidadeAsyncAction =
      AsyncAction('_EntidadeStore.deletarEntidade', context: context);

  @override
  Future<void> deletarEntidade(Entidade entidade) {
    return _$deletarEntidadeAsyncAction
        .run(() => super.deletarEntidade(entidade));
  }

  late final _$_EntidadeStoreActionController =
      ActionController(name: '_EntidadeStore', context: context);

  @override
  void setTodasEntidades(List<Entidade> entidadesList) {
    final _$actionInfo = _$_EntidadeStoreActionController.startAction(
        name: '_EntidadeStore.setTodasEntidades');
    try {
      return super.setTodasEntidades(entidadesList);
    } finally {
      _$_EntidadeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
entidades: ${entidades},
isLoading: ${isLoading},
entidade: ${entidade},
sofreuAlteracao: ${sofreuAlteracao}
    ''';
  }
}
