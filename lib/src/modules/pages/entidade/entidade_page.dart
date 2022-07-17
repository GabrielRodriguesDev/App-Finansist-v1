import 'package:finansist_v1/src/modules/pages/entidade/widgets/entidade_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../infra/utils/constantes.dart';
import 'entidade_store.dart';

class EntidadePage extends StatelessWidget {
  EntidadePage({Key? key}) : super(key: key);
  final EntidadeStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Entidade page'),
        ),
        body: Column(
          children: const [
            EntidadeWidget(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: store.entidades.isNotEmpty
            ? Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: FloatingActionButton(
                  elevation: 4,
                  child: const Icon(Icons.add),
                  onPressed: () {
                    Modular.to.pushNamed(rotaEntidadeForm);
                  },
                ),
              )
            : null);
  }
}
