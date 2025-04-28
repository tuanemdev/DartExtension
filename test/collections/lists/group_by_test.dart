import 'package:flutter_test/flutter_test.dart';
import 'package:darty_x/collections/lists/group_by.dart';

class Person {
  final String name;
  final int age;
  
  Person(this.name, this.age);
}

void main() {
  group('GroupByExtension', () {
    test('groupBy with integers', () {
      final numbers = [1, 2, 3, 4, 5, 6];
      final result = numbers.groupBy((number) => number % 2 == 0 ? 'even' : 'odd');
      
      expect(result.length, 2);
      expect(result['even'], [2, 4, 6]);
      expect(result['odd'], [1, 3, 5]);
    });

    test('groupBy with objects', () {
      final people = [
        Person('Alice', 25),
        Person('Bob', 30),
        Person('Charlie', 25),
        Person('David', 30),
      ];
      
      final result = people.groupBy((person) => person.age);
      
      expect(result.length, 2);
      expect(result[25]?.length, 2);
      expect(result[30]?.length, 2);
      expect(result[25]?.map((p) => p.name).toList(), ['Alice', 'Charlie']);
      expect(result[30]?.map((p) => p.name).toList(), ['Bob', 'David']);
    });
    
    test('groupBy with empty list', () {
      final empty = <String>[];
      final result = empty.groupBy((s) => s.length);
      
      expect(result.isEmpty, true);
    });

    test('groupByMap with integers', () {
      final numbers = [1, 2, 3, 4, 5, 6];
      final result = numbers.groupByMap(
        (number) => number % 2 == 0 ? 'even' : 'odd',
        (number) => number * number,
      );
      
      expect(result.length, 2);
      expect(result['even'], [4, 16, 36]);
      expect(result['odd'], [1, 9, 25]);
    });

    test('groupByMap with objects', () {
      final people = [
        Person('Alice', 25),
        Person('Bob', 30),
        Person('Charlie', 25),
        Person('David', 30),
      ];
      
      final result = people.groupByMap(
        (person) => person.age,
        (person) => person.name,
      );
      
      expect(result.length, 2);
      expect(result[25], ['Alice', 'Charlie']);
      expect(result[30], ['Bob', 'David']);
    });
    
    test('groupByMap with empty list', () {
      final empty = <String>[];
      final result = empty.groupByMap((s) => s.length, (s) => s.toUpperCase());
      
      expect(result.isEmpty, true);
    });
  });
}
