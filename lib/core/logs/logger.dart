import 'dart:convert';

import 'package:logger/logger.dart';

var logger = Logger(printer: PrettyPrinter());

var logs = Logger(printer: PrettyPrinter(methodCount: 0));
var logClass = Logger(printer: PrettyPrinter(methodCount: 1));
var logClassTime =
    Logger(printer: PrettyPrinter(methodCount: 1, printTime: true));

var logShort = Logger(printer: MyPrinter());

var logVersion = Logger(printer: MyPrinter());

class MyPrinter extends LogPrinter {
  static final levelPrefixes = {
    Level.verbose: '[V]',
    Level.debug: '[D]',
    Level.info: '[I]',
    Level.warning: '[W]',
    Level.error: '[E]',
    Level.wtf: '[WTF]',
  };

  static final levelColors = {
    Level.verbose: AnsiColor.fg(AnsiColor.grey(0.5)),
    Level.debug: AnsiColor.none(),
    Level.info: AnsiColor.fg(12),
    Level.warning: AnsiColor.fg(208),
    Level.error: AnsiColor.fg(196),
    Level.wtf: AnsiColor.fg(199),
  };

  final bool printTime;
  final bool colors;

  MyPrinter({this.printTime = false, this.colors = true});

  @override
  List<String> log(LogEvent event) {
    var messageStr = _stringifyMessage(event.message);
    var errorStr = event.error != null ? '[${event.error}]' : '';
    var timeStr = printTime ? 'TIME: ${DateTime.now().toIso8601String()}' : '';
    return ['${_labelFor(event.level)} $timeStr $errorStr $messageStr'];
  }

  String _labelFor(Level level) {
    var prefix = levelPrefixes[level];
    var color = levelColors[level];

    return colors ? color!(prefix!) : prefix!;
  }

  String _stringifyMessage(dynamic message) {
    if (message is Map || message is Iterable) {
      var encoder = JsonEncoder.withIndent(null);
      return encoder.convert(message);
    } else {
      return message.toString();
    }
  }
}
