import 'package:flutter_i18n/flutter_i18n.dart';

class CustomNetworkFileTranslationLoader extends NetworkFileTranslationLoader {
  CustomNetworkFileTranslationLoader({required baseUri})
      : super(baseUri: baseUri);

  @override
  Uri resolveUri(String fileName, String extension) {
    return baseUri;
  }
}
