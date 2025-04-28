/// Extension on [List] that provides grouping functionality.
///
/// These methods allow grouping list elements by specified keys.
extension GroupByExtension<T> on List<T> {
  /// Groups list elements by a key derived from each element.
  ///
  /// Returns a [Map] where each key is the result of [keySelector] function
  /// applied to one or more elements, and the value is a list of all elements
  /// that produced that key.
  ///
  /// Example:
  /// ```dart
  /// final people = [
  ///   {'name': 'Alice', 'age': 25},
  ///   {'name': 'Bob', 'age': 30},
  ///   {'name': 'Charlie', 'age': 25},
  /// ];
  /// final groupedByAge = people.groupBy((p) => p['age']);
  /// // Result: {25: [{'name': 'Alice', 'age': 25}, {'name': 'Charlie', 'age': 25}], 30: [{'name': 'Bob', 'age': 30}]}
  /// ```
  Map<K, List<T>> groupBy<K>(K Function(T) keySelector) {
    final Map<K, List<T>> result = {};
    for (final item in this) {
      final key = keySelector(item);
      result.putIfAbsent(key, () => <T>[]).add(item);
    }
    return result;
  }

  /// Groups list elements by a key and maps each element to a new value.
  ///
  /// Returns a [Map] where each key is the result of [keySelector] function
  /// applied to one or more elements, and the value is a list of transformed elements
  /// (using [valueSelector]) that produced that key.
  ///
  /// Example:
  /// ```dart
  /// final people = [
  ///   {'name': 'Alice', 'age': 25},
  ///   {'name': 'Bob', 'age': 30},
  ///   {'name': 'Charlie', 'age': 25},
  /// ];
  /// final groupedNames = people.groupByMap(
  ///   (p) => p['age'],
  ///   (p) => p['name']
  /// );
  /// // Result: {25: ['Alice', 'Charlie'], 30: ['Bob']}
  /// ```
  Map<K, List<V>> groupByMap<K, V>(
    K Function(T) keySelector,
    V Function(T) valueSelector,
  ) {
    final Map<K, List<V>> result = {};
    for (final item in this) {
      final key = keySelector(item);
      final value = valueSelector(item);
      result.putIfAbsent(key, () => <V>[]).add(value);
    }
    return result;
  }
}
