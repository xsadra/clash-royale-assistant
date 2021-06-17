import 'package:timeago/timeago.dart' as timeago;

extension StringExtentions on String {
  bool get isTag {
    return this.startsWith('#');
  }

  String timeAgo({String local}) {
    var parsedDate = DateTime.parse(this);
    return local == null
        ? timeago.format(parsedDate)
        : timeago.format(parsedDate, locale: local);
  }
}
