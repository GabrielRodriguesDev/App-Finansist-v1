import 'package:finansist_v1/src/modules/components/custom_snackbar/custom_snackbar_store.dart';
import 'package:finansist_v1/src/modules/pages/entidade/widgets/entidade_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../infra/utils/constantes.dart';
import 'entidade_store.dart';

class EntidadePage extends StatelessWidget {
  EntidadePage({Key? key}) : super(key: key);
  final EntidadeStore store = Modular.get();
  final CustomSnackBarStore storeSnackBar = Modular.get();
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
      floatingActionButton: Observer(builder: (context) {
        return store.entidades.isNotEmpty && !storeSnackBar.showingSnackbar
            ? Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: FloatingActionButton(
                  elevation: 4,
                  child: const Icon(Icons.add),
                  onPressed: () {
                    Modular.to
                        .pushNamed(rotaEntidadeForm)
                        .then((value) => store.pesquisarEntidades());
                  },
                ),
              )
            : const SizedBox();
      }),
    );
  }
}
