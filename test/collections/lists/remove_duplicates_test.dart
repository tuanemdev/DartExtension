import 'package:flutter_test/flutter_test.dart';
import 'package:darty_x/collections/lists/remove_duplicates.dart';

class Person {
  final String name;
  final int age;

  Person(this.name, this.age);

  @override
  String toString() => 'Person($name, $age)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          age == other.age;

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

void main() {
  group('distinct() tests', () {
    test('should return a list with unique integers', () {
      final list = [1, 2, 3, 1, 2, 5, 6];
      final result = list.distinct();

      expect(result, equals([1, 2, 3, 5, 6]));
      // Original list should remain unchanged
      expect(list, equals([1, 2, 3, 1, 2, 5, 6]));
    });

    test('should return a list with unique strings', () {
      final list = ['a', 'b', 'c', 'a', 'b', 'd'];
      expect(list.distinct(), equals(['a', 'b', 'c', 'd']));
    });

    test('should handle empty list', () {
      final List<int> list = [];
      expect(list.distinct(), isEmpty);
    });

    test('should handle list without duplicates', () {
      final list = [1, 2, 3, 4];
      expect(list.distinct(), equals([1, 2, 3, 4]));
    });

    test('should maintain order of first occurrences', () {
      final list = ['d', 'a', 'b', 'a', 'c', 'b'];
      expect(list.distinct(), equals(['d', 'a', 'b', 'c']));
    });
  });

  group('removeDuplicates() tests', () {
    test('should remove duplicate integers in-place', () {
      final list = [1, 2, 3, 1, 2, 5, 6];
      list.removeDuplicates();
      expect(list, equals([1, 2, 3, 5, 6]));
    });

    test('should remove duplicate strings in-place', () {
      final list = ['a', 'b', 'c', 'a', 'b', 'd'];
      list.removeDuplicates();
      expect(list, equals(['a', 'b', 'c', 'd']));
    });

    test('should handle empty list', () {
      final List<int> list = [];
      list.removeDuplicates();
      expect(list, isEmpty);
    });

    test('should not change list without duplicates', () {
      final list = [1, 2, 3, 4];
      list.removeDuplicates();
      expect(list, equals([1, 2, 3, 4]));
    });
  });

  group('distinctBy() tests', () {
    test('should return a list with unique elements by selector', () {
      final people = [
        Person('John', 25),
        Person('Jane', 30),
        Person('John', 40),
        Person('Alice', 35),
      ];

      final uniqueByName = people.distinctBy((p) => p.name);
      expect(uniqueByName.length, equals(3));
      expect(uniqueByName[0].name, equals('John'));
      expect(uniqueByName[1].name, equals('Jane'));
      expect(uniqueByName[2].name, equals('Alice'));

      // Original list should remain unchanged
      expect(people.length, equals(4));
    });

    test('should handle empty list with selector', () {
      final List<Person> people = [];
      final result = people.distinctBy((p) => p.name);
      expect(result, isEmpty);
    });

    test('should work with different selectors', () {
      final people = [
        Person('John', 25),
        Person('Jane', 30),
        Person('Alice', 25),
        Person('Bob', 30),
      ];

      // Distinct by age should return 2 items
      final uniqueByAge = people.distinctBy((p) => p.age);
      expect(uniqueByAge.length, equals(2));
      expect(uniqueByAge[0].age, equals(25));
      expect(uniqueByAge[1].age, equals(30));
    });
  });

  group('removeDuplicatesBy() tests', () {
    test('should remove duplicates in-place by selector', () {
      final people = [
        Person('John', 25),
        Person('Jane', 30),
        Person('John', 40),
        Person('Alice', 35),
      ];

      people.removeDuplicatesBy((p) => p.name);
      expect(people.length, equals(3));
      expect(people[0].name, equals('John'));
      expect(people[0].age, equals(25)); // First John should be kept
      expect(people[1].name, equals('Jane'));
      expect(people[2].name, equals('Alice'));
    });

    test('should handle empty list with selector for in-place removal', () {
      final List<Person> people = [];
      people.removeDuplicatesBy((p) => p.name);
      expect(people, isEmpty);
    });

    test('should not change list without duplicates by selector', () {
      final people = [
        Person('John', 25),
        Person('Jane', 30),
        Person('Alice', 35),
      ];

      people.removeDuplicatesBy((p) => p.name);
      expect(people.length, equals(3));
      expect(people[0].name, equals('John'));
      expect(people[1].name, equals('Jane'));
      expect(people[2].name, equals('Alice'));
    });
  });
}
