class BankModel {
  final String? id;
  final String? name;
  BankModel({this.id, this.name});

  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
      id: json['id'],
      name: json['name'],
    );
  }
  List<String> listBank = [
    "Banco do Brasil S.A.",
    "CAIXA ECONOMICA FEDERAL",
    "Banco Inter S.A.",
    "BANCO COOPERATIVO SICREDI S.A.",
    "BANCO COOPERATIVO SICOOB S.A. - BANCO SICOOB",
    "COOPERATIVA DE ECONOMIA E CREDITO MUTUO DOS TRABALHADORES PORTUARIOS DA GRANDE V",
    "PORTOSEG S.A. - CREDITO",
    "J&F DISTRIBUIDORA DE TÍTULOS E VALORES MOBILIÁRIOS LTDA",
    "PAGSEGURO INTERNET INSTITUIÇÃO DE PAGAMENTO S.A.",
    "MERCADO PAGO INSTITUIÇÃO DE PAGAMENTO LTDA.",
    "Banco Agibank S.A.",
    "GAZINCRED S.A. SOCIEDADE DE CRÉDITO",
    "NU PAGAMENTOS S.A. - INSTITUIÇÃO DE PAGAMENTO",
    "CDC SOCIEDADE DE CRÉDITO AO MICROEMPREENDEDOR E À EMPRESADE PEQUENO PORTE LTDA.",
    "PICPAY INSTITUIçãO DE PAGAMENTO S.A.",
    "WILL FINANCEIRA S.A. CRÉDITO",
    "Banco Digio S.A.",
    "Banco C6 S.A.",
    "Banco Caixa Geral - Brasil S.A.",
    "J17 - SOCIEDADE DE CRÉDITO DIRETO S/A",
    "UNAVANTI SOCIEDADE DE CRÉDITO DIRETO S/A",
    "Banco Safra S.A.",
    "Banco Pan S.A.",
    "Banco Votorantim S.A.",
    "ITAÚ UNIBANCO S.A.",
    "Banco Bradesco S.A.",
    "Banco BMG S.A.",
    "Banco BS2 S.A.",
    "BANCO SANTANDER (BRASIL) S.A.",
    "BANCO DIGIMAIS S.A.",
    "Banco Original S.A."
  ];
}