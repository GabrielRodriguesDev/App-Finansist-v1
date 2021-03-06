// ignore_for_file: library_private_types_in_public_api
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:finansist_v1/src/modules/components/custom_snackbar/custom_snackbar_store.dart';
import 'package:finansist_v1/src/modules/domain/interfaces/services/i_entidade_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entites/entidade.dart';

import '../../domain/interfaces/repository/i_entidade_repository.dart';
import '../../domain/models/pesquisar.dart';
import '../../infra/utils/constantes.dart';
import '../../infra/utils/globals.dart';
part 'entidade_store.g.dart';

class EntidadeStore = _EntidadeStore with _$EntidadeStore;

abstract class _EntidadeStore with Store {
  final IEntidadeRepository _entidadeRepository;
  final IEntidadeService _entidadeService;
  final CustomSnackBarStore storeSnackBar = Modular.get();

  _EntidadeStore(this._entidadeRepository, this._entidadeService);
  @observable
  ObservableList<Entidade> entidades = ObservableList();

  @observable
  bool isLoading = false;

  @observable
  Entidade? entidade;

  @observable
  bool sofreuAlteracao = false;

  @action
  Future<void> pesquisarEntidades() async {
    if (kDebugMode) {
      print('pesquisando');
    }
    entidades.clear();
    isLoading = true;
    var pesquisarModel = PesquisarModel(texto: '', ativo: true);
    var response = await _entidadeRepository.pesquisar(pesquisarModel);
    await response.fold(
      (l) async {
        if (!l.success!) {
          snackbarKey.currentState?.showSnackBar(
            storeSnackBar.showCustomSnackBar(
                'Erro', l.message!, ContentType.failure),
          );
          isLoading = false;
          Modular.to.pushNamed(rotaHome);
        }
      },
      (r) async {
        if (kDebugMode) {
          print('pesquisando e atualizando a lista');
        }
        setTodasEntidades(r);
        isLoading = false;
      },
    );
  }

  @action
  Future<void> saveEntidade() async {
    var respose = await _entidadeService.salvarEntidade(entidade!);
    respose.fold((l) async {
      if (!l.success!) {
        snackbarKey.currentState?.hideCurrentSnackBar();
        snackbarKey.currentState?.showSnackBar(
          storeSnackBar.showCustomSnackBar(
              'Erro', l.message!, ContentType.failure),
        );
        Modular.to.pop();
      }
    }, (r) async {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState
          ?.showSnackBar(
            storeSnackBar.showCustomSnackBar(
                'Sucesso', 'Entidade salva com sucesso.', ContentType.success),
          )
          .closed
          .then((SnackBarClosedReason reason) {
        storeSnackBar.showingSnackbar = false;
      });
      entidade = null;
      Modular.to.pop();
    });
  }

  @action
  Future<void> deletarEntidade(Entidade entidade) async {
    var respose = await _entidadeService.deletarEntidade(entidade);
    respose.fold((l) async {
      if (!l.success!) {
        snackbarKey.currentState?.hideCurrentSnackBar();
        snackbarKey.currentState
            ?.showSnackBar(
              storeSnackBar.showCustomSnackBar(
                  'Erro', l.message!, ContentType.failure),
            )
            .closed
            .then((SnackBarClosedReason reason) {
          storeSnackBar.showingSnackbar = false;
        });
      }
    }, (r) {
      snackbarKey.currentState?.hideCurrentSnackBar();
      snackbarKey.currentState
          ?.showSnackBar(
            storeSnackBar.showCustomSnackBar('Sucesso',
                'Entidade removida com sucesso.', ContentType.success),
          )
          .closed
          .then((SnackBarClosedReason reason) {
        storeSnackBar.showingSnackbar = false;
      });
    });
  }

  @action
  void setTodasEntidades(List<Entidade> entidadesList) {
    entidades.clear();
    entidades.addAll(entidadesList);
  }
}
