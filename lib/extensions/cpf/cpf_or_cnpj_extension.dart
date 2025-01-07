extension CpfCnpjExtension on String {
  String formatCpfCnpj() {
    String text = replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length <= 11) {
      return text.replaceAllMapped(
        RegExp(r'(\d{3})(\d{3})(\d{3})(\d{0,2})'),
        (Match m) => '${m[1]}.${m[2]}.${m[3]}-${m[4]}',
      );
    } else if (text.length <= 14) {
      return text.replaceAllMapped(
        RegExp(r'(\d{2})(\d{3})(\d{3})(\d{4})(\d{0,2})'),
        (Match m) => '${m[1]}.${m[2]}.${m[3]}/${m[4]}-${m[5]}',
      );
    }
    
    return this;
  }
}
