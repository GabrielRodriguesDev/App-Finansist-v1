import 'package:finansist_v1/src/modules/pages/entidade/entidade_form_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'entidade_page.dart';
import 'entidade_store.dart';

class EntidadeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => EntidadeStore(i(), i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => EntidadePage()),
    ChildRoute('/Entidade/Formulario', child: (_, args) => EntidadeFormPage()),
  ];
}
