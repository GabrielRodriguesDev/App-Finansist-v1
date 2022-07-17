import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../components/input/input_form.dart';
import '../../domain/entites/entidade.dart';
import 'entidade_store.dart';

class EntidadeFormPage extends StatelessWidget {
  EntidadeFormPage({Key? key}) : super(key: key);
  final EntidadeStore store = Modular.get();
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    store.entidade ??= Entidade();
    _formKey.currentState?.save();
    store.saveEntidade();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entidade Form')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputForm(
                initialValue:
                    store.entidade == null ? null : store.entidade!.nome ?? '',
                labelText: 'Nome',
                validator: (String? fieldContent) {
                  fieldContent = fieldContent ?? '';
                  return fieldContent.isEmpty ? 'Nome é obrigatório' : null;
                },
                onSaved: (String? nome) {
                  store.entidade?.nome = nome ?? '';
                },
              ),
              const SizedBox(height: 20),
              InputForm(
                initialValue: store.entidade == null
                    ? null
                    : store.entidade!.descricao ?? '',
                labelText: 'Descrição',
                validator: (String? fieldContent) {
                  fieldContent = fieldContent ?? '';
                  return fieldContent.isEmpty
                      ? 'Descrição é obrigatório'
                      : null;
                },
                onSaved: (String? descricao) {
                  store.entidade?.descricao = descricao ?? '';
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 12),
                ),
                child: const Text(
                  'Salvar',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
