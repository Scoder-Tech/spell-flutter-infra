extension ToNumExtension on String {
  double? toNum() {
    if (this == '') {
      return null;
    }

    RegExp regex = RegExp(r'[^0-9.]');

    return double.tryParse(replaceAll(regex, ''));
  }

  double currencyToNum() {
    return double.parse(replaceAll('B\$ ', '').replaceAll(',', ''));
  }
}
