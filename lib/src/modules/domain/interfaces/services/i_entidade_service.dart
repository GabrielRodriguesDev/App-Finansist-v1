import 'package:dartz/dartz.dart';

import '../../entites/entidade.dart';
import '../../models/results/result_generic.dart';

abstract class IEntidadeService {
  Future<Either<ResultGeneric, Entidade?>> salvarEntidade(Entidade? entidade);

  Future<Either<ResultGeneric, ResultGeneric>> deletarEntidade(
      Entidade? entidade);
}
