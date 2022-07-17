class PesquisarModel {
  String? texto;
  bool? ativo;

  PesquisarModel({this.texto, this.ativo});

  PesquisarModel.fromJson(Map<String, dynamic> json) {
    texto = json['texto'];
    ativo = json['ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['texto'] = texto;
    data['ativo'] = ativo;
    return data;
  }
}
