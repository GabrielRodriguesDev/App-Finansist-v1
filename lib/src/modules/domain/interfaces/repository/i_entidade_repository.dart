import 'package:finansist_v1/src/modules/domain/models/pesquisar.dart';
import 'package:dartz/dartz.dart';
import 'package:finansist_v1/src/modules/domain/models/results/result_generic.dart';
import '../../entites/entidade.dart';

abstract class IEntidadeRepository {
  Future<Either<ResultGeneric, List<Entidade>>> pesquisar(PesquisarModel model);

  Future<Either<ResultGeneric, Entidade?>> criarEntidade(Entidade? entidade);

  Future<Either<ResultGeneric, Entidade?>> atualizarEntidade(
      Entidade? entidade);

  Future<Either<ResultGeneric, ResultGeneric>> deletarEntidade(
      Entidade? entidade);
}
