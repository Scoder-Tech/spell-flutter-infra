extension CpfStringParsing on String {
  String clearCpf() {
    var cpf = this;

    return cpf.replaceAll(RegExp(r'[^0-9]'), '');
  }
}


extension CpfStringNullParsing on String? {
  String? clearCpf() {
    var cpf = this;

    if(cpf == null) {
      return null;
    }

    return cpf.replaceAll(RegExp(r'[^0-9]'), '');
  }
}