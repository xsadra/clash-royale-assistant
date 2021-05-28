import 'package:meta/meta.dart' show required;

abstract class ValidateTagRepository {
  Future<bool> isValidTag({
    @required String tag,
    @required String type,
  });
}
