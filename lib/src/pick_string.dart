import 'package:deep_pick/src/pick.dart';

extension NullableStringPick on Pick {
  @Deprecated('Use .asStringOrThrow()')
  String Function() get asString => asStringOrThrow;

  /// Returns the picked [value] as [String] representation
  ///
  /// {@template Pick.asString}
  /// Parses the picked [value] as String. If the value is not already a [String]
  /// its [Object.toString()] will be called. This means that this method works
  /// for [int], [double] and any other [Object].
  /// {@endtemplate}
  String _parse() {
    final value = this.value;
    if (value is String) {
      return value;
    }
    return value.toString();
  }

  /// Returns the picked [value] as String representation; only throws a
  /// [PickException] when the value is `null` or [isAbsent].
  ///
  /// {@macro Pick.asString}
  String asStringOrThrow() {
    withContext(requiredPickErrorHintKey,
        'Use asStringOrNull() when the value may be null/absent at some point (String?).');
    return required()._parse();
  }

  /// Returns the picked [value] as [String] or returns `null` when the picked value isn't available
  ///
  /// {@macro Pick.asString}
  String? asStringOrNull() {
    if (value == null) return null;
    try {
      return _parse();
    } catch (_) {
      return null;
    }
  }
}
