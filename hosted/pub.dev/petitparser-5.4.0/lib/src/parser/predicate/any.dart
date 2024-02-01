import 'package:meta/meta.dart';

import '../../context/context.dart';
import '../../context/result.dart';
import '../../core/parser.dart';

/// Returns a parser that accepts any input element.
///
/// For example, `any()` succeeds and consumes any given letter. It only
/// fails for an empty input.
@useResult
Parser<String> any([String message = 'input expected']) =>
    AnyCharacterParser(message);

/// Alias for deprecated class name.
@Deprecated('Instead use `AnyCharacterParser`')
typedef AnyParser = AnyCharacterParser;

/// A parser that accepts any input element.
class AnyCharacterParser extends Parser<String> {
  AnyCharacterParser(this.message);

  /// Error message to annotate parse failures with.
  final String message;

  @override
  Result<String> parseOn(Context context) {
    final buffer = context.buffer;
    final position = context.position;
    return position < buffer.length
        ? context.success(buffer[position], position + 1)
        : context.failure(message);
  }

  @override
  int fastParseOn(String buffer, int position) =>
      position < buffer.length ? position + 1 : -1;

  @override
  AnyCharacterParser copy() => AnyCharacterParser(message);

  @override
  bool hasEqualProperties(AnyCharacterParser other) =>
      super.hasEqualProperties(other) && message == other.message;
}
