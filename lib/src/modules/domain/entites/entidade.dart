class Entidade {
  String? id;
  String? nome;
  String? descricao;
  bool? ativo;

  Entidade();

  Entidade.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    descricao = json['descricao'];
    ativo = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['ativo'] = ativo;
    return data;
  }
}
