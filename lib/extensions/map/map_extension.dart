extension RemoveNull on Map<String, dynamic> {
  Map<String, dynamic> removeNull() {
    return Map.fromEntries(entries
        .where((element) => element.value != null && element.value != '' && element.value != 'null'));
  }
}
