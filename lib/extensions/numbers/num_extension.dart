extension ToNumExtension on String {
  num? toNum() {
    if (this == '') {
      return null;
    }

    RegExp regex = RegExp(r'[^0-9.]');

    return num.tryParse(replaceAll(regex, ''));
  }

  double currencyToNum() {
    return double.parse(replaceAll('B\$ ', '').replaceAll(',', ''));
  }
}
