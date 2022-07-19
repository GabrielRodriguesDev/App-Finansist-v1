import 'package:finansist_v1/src/modules/infra/utils/constantes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../entidade_store.dart';
import 'entidade_card_widget.dart';

class EntidadeWidget extends StatefulWidget {
  const EntidadeWidget({Key? key}) : super(key: key);

  @override
  State<EntidadeWidget> createState() => _EntidadeWidgetState();
}

class _EntidadeWidgetState extends State<EntidadeWidget> {
  final EntidadeStore store = Modular.get();
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    store.entidade = null;
    store.pesquisarEntidades();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return store.isLoading
            ? Expanded(
                child: Center(
                  child: SpinKitChasingDots(
                    size: 80,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              )
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: store.entidades.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var entidadeTemp = store.entidades[index];
                      return Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {
                          store.deletarEntidade(entidadeTemp);
                        },
                        child: InkWell(
                          onTap: () {
                            store.entidade = entidadeTemp;
                            Modular.to
                                .pushNamed(rotaEntidadeForm)
                                .then((value) {
                              store.pesquisarEntidades();
                              store.entidade = null;
                            });
                          },
                          child: EntidadeCardWidget(
                            titulo: entidadeTemp.nome.toString(),
                            subtitlo: entidadeTemp.descricao,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
      },
    );
  }
}
