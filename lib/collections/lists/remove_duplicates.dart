extension ListRemoveDuplicates<T> on List<T> {
  /// Returns a new list containing all elements from this list with duplicates removed.
  /// 
  /// The first occurrence of each element is kept, and subsequent duplicates are omitted.
  /// The order of elements in the resulting list matches their first occurrence in the original list.
  List<T> distinct() {
    final List<T> result = [];
    final Set<T> unique = {};
    for (final item in this) {
      if (unique.add(item)) {
        result.add(item);
      }
    }
    return result;
  }

  /// Removes duplicate elements from this list in-place.
  /// 
  /// Modifies the original list by keeping only the first occurrence of each element
  /// and removing any subsequent duplicates. This operation changes the list length.
  void removeDuplicates() {
    final Set<T> unique = {};
    int i = 0;
    while (i < length) {
      if (unique.add(this[i])) {
        i++;
      } else {
        removeAt(i);
      }
    }
  }

  /// Returns a new list with duplicates removed based on the specified [selector] function.
  /// 
  /// Elements are considered duplicates if the [selector] function returns the same key for them.
  /// The first occurrence of each element with a unique key is kept, and subsequent elements
  /// with the same key are omitted.
  /// 
  /// Example:
  /// ```dart
  /// final people = [Person('John', 25), Person('Jane', 30), Person('John', 40)];
  /// final uniqueByName = people.distinctBy((p) => p.name);
  /// ```
  List<T> distinctBy<K>(K Function(T) selector) {
    final List<T> result = [];
    final Set<K> uniqueKeys = {};
    for (final item in this) {
      final K key = selector(item);
      if (uniqueKeys.add(key)) {
        result.add(item);
      }
    }
    return result;
  }

  /// Removes elements from this list in-place based on the specified [selector] function.
  /// 
  /// Elements are considered duplicates if the [selector] function returns the same key for them.
  /// Keeps only the first occurrence of elements with each unique key and removes subsequent
  /// elements with the same key. This operation changes the list length.
  /// 
  /// Example:
  /// ```dart
  /// final people = [Person('John', 25), Person('Jane', 30), Person('John', 40)];
  /// people.removeDuplicatesBy((p) => p.name);
  /// ```
  void removeDuplicatesBy<K>(K Function(T) selector) {
    final Set<K> uniqueKeys = {};
    int i = 0;
    while (i < length) {
      final K key = selector(this[i]);
      if (uniqueKeys.add(key)) {
        i++;
      } else {
        removeAt(i);
      }
    }
  }
}
