import 'package:dio/dio.dart';
import 'package:finansist_v1/src/modules/domain/repository/entidade_repository.dart';
import 'package:finansist_v1/src/modules/infra/utils/constantes.dart';
import 'package:finansist_v1/src/modules/pages/entidade/entidade_module.dart';
import 'package:finansist_v1/src/modules/pages/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'modules/domain/services/entidade_service.dart';
import 'modules/infra/utils/dio/custom_dio.dart';
import 'modules/pages/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => Dio()),
        Bind.lazySingleton((i) => CustomDio(i())),
        Bind.lazySingleton((i) => EntidadeRepository(i())),
        Bind.lazySingleton((i) => EntidadeService(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
        ModuleRoute(
          rotaHome,
          module: HomeModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute(
          rotaEntidade,
          module: EntidadeModule(),
          transition: TransitionType.fadeIn,
        ),
      ];
}
