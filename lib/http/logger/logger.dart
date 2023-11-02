import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = _CustomLogger();

class _CustomLogger extends Logger {
  _CustomLogger()
      : super(
          printer: _LogPrinter(),
          level: _LogPrinter().level,
        );
}

class _LogPrinter extends LogPrinter {
  static final _LogPrinter _logPrinter = _LogPrinter._();

  _LogPrinter._();

  factory _LogPrinter() {
    return _logPrinter;
  }

  @override
  List<String> log(LogEvent event) {
    AnsiColor color;

    String emoji;

    String message = event.message;

    switch (event.level) {
      case Level.error:
        var splitedMessage = message.split('||');

        if (splitedMessage.isNotEmpty && splitedMessage.length > 1) {
          color = PrettyPrinter.defaultLevelColors[event.level]!;
          emoji = PrettyPrinter.defaultLevelEmojis[event.level]!;

          var resultErrorList = [
            color('=' * splitedMessage.first.length),
            color('$emoji ${splitedMessage.first.trim()}'),
            color('$emoji ${splitedMessage[1].trim()}'),
            color('$emoji ${splitedMessage[2].trim()}'),
            color('=' * splitedMessage.first.length),
          ];

          if (message.contains('unknownFailure')) {
            return resultErrorList;
          }

          resultErrorList
            ..removeLast()
            ..addAll([
              color('$emoji ${splitedMessage[3].trim()}'),
              color('$emoji ${splitedMessage[4].trim()}'),
              color('$emoji ${splitedMessage.last.trim()}'),
              color('=' * splitedMessage.first.length),
            ]);

          return resultErrorList;
        } else {
          return [''];
        }

      default:
        color = PrettyPrinter.defaultLevelColors[event.level]!;
        emoji = PrettyPrinter.defaultLevelEmojis[event.level]!;
    }

    return [
      color('==' * message.length),
      color('$emoji $message'),
      color('==' * message.length)
    ];
  }

  Level? get level {
    if (kDebugMode) {
      return Level.debug;
    }

    return Level.error;
  }
}
