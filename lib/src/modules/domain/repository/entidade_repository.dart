import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import 'package:finansist_v1/src/modules/domain/entites/entidade.dart';

import 'package:finansist_v1/src/modules/domain/models/pesquisar.dart';
import 'package:finansist_v1/src/modules/domain/models/results/result_generic.dart';

import '../../infra/utils/dio/custom_dio.dart';
import '../interfaces/repository/i_entidade_repository.dart';

class EntidadeRepository implements IEntidadeRepository {
  final CustomDio dio;

  EntidadeRepository(this.dio);

  @override
  Future<Either<ResultGeneric, List<Entidade>>> pesquisar(
      PesquisarModel model) async {
    try {
      Response<String> response = await dio.client
          .post('https://10.0.2.2:7174/Entidade/Pesquisar', data: model);
      if (response.data != null) {
        List jsonResponse = json.decode(response.data!);
        if (jsonResponse.isNotEmpty) {
          return right(
              jsonResponse.map((job) => Entidade.fromJson(job)).toList());
        }
      }
      return right([]);
    } on DioError catch (e) {
      var result =
          ResultGeneric(success: false, message: e.message, data: null);
      return left(result);
    } on TypeError catch (e) {
      var result =
          ResultGeneric(success: false, message: e.toString(), data: null);
      return left(result);
    } on FormatException catch (e) {
      var result =
          ResultGeneric(success: false, message: e.toString(), data: null);
      return left(result);
    }
  }

  @override
  Future<Either<ResultGeneric, Entidade?>> criarEntidade(
      Entidade? entidade) async {
    try {
      Response respose = await dio.client
          .post('https://10.0.2.2:7174/Entidade', data: entidade);
      if (respose.data != null) {
        return right(Entidade.fromJson(respose.data));
      }
      return right(null);
    } on DioError catch (e) {
      var result =
          ResultGeneric(success: false, message: e.message, data: null);
      return left(result);
    } on TypeError catch (e) {
      var result =
          ResultGeneric(success: false, message: e.toString(), data: null);
      return left(result);
    } on FormatException catch (e) {
      var result =
          ResultGeneric(success: false, message: e.toString(), data: null);
      return left(result);
    }
  }

  @override
  Future<Either<ResultGeneric, Entidade?>> atualizarEntidade(
      Entidade? entidade) async {
    try {
      Response respose = await dio.client
          .put('https://10.0.2.2:7174/Entidade', data: entidade);
      if (respose.data != null) {
        return right(Entidade.fromJson(respose.data['data']));
      }
      return right(null);
    } on DioError catch (e) {
      var result =
          ResultGeneric(success: false, message: e.message, data: null);
      return left(result);
    } on TypeError catch (e) {
      var result =
          ResultGeneric(success: false, message: e.toString(), data: null);
      return left(result);
    } on FormatException catch (e) {
      var result =
          ResultGeneric(success: false, message: e.toString(), data: null);
      return left(result);
    }
  }
}
