import 'package:finansist_v1/src/modules/domain/entites/entidade.dart';
import 'package:dartz/dartz.dart';
import 'package:finansist_v1/src/modules/domain/interfaces/services/i_entidade_service.dart';
import 'package:finansist_v1/src/modules/domain/models/results/result_generic.dart';
import '../interfaces/repository/i_entidade_repository.dart';

class EntidadeService implements IEntidadeService {
  final IEntidadeRepository _entidadeRepository;

  EntidadeService(this._entidadeRepository);
  @override
  Future<Either<ResultGeneric, Entidade?>> salvarEntidade(
      Entidade? entidade) async {
    if (entidade != null && entidade.id == null) {
      return _entidadeRepository.criarEntidade(entidade);
    }
    return _entidadeRepository.atualizarEntidade(entidade);
  }
}
