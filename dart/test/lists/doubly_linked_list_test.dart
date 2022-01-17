import 'package:algorithms/heaps/base.dart';
import 'package:algorithms/lists/doubly_linked_list.dart';
import 'package:test/test.dart';

void main() {
  late DoublyLinkedList emptyList;
  late DoublyLinkedList<String> programmingLanguage;
  late DoublyLinkedList<num> fibonacciNumbers;
  // late DoublyLinkedList emptyList;
  // late DoublyLinkedList<String> programmingLanguage;
  // late DoublyLinkedList<num> fibonacciNumbers;

  setUp(
    () {
      emptyList = DoublyLinkedList();
      programmingLanguage = DoublyLinkedList()
        ..append("C")
        ..append("C++")
        ..append("Java")
        ..append("Dart");

      fibonacciNumbers = DoublyLinkedList.fromList([1, 2, 3, 5, 8]);
    },
  );

  test(
    "Head/Tail",
    () {
      expect([emptyList.head, emptyList.tail], equals([null, null]));
      expect(fibonacciNumbers.head, equals(1));
      expect(fibonacciNumbers.tail, equals(8));
      expect(programmingLanguage.head, equals("C"));
      expect(programmingLanguage.tail, equals("Dart"));
    },
  );

  test(
    "Test for length",
    () {
      expect(emptyList.length, equals(0));
      expect(programmingLanguage.length, equals(4));
      expect(fibonacciNumbers.length, equals(5));
    },
  );

  test(
    "test for Index Peek",
    () {
      expect(() => emptyList.at(10), throwsA(isA<InvalidIndexError>()));
      expect(programmingLanguage.at(0), equals("C"));
      expect(programmingLanguage.at(1), equals("C++"));
      expect(programmingLanguage.at(2), equals("Java"));
      expect(programmingLanguage.at(3), equals("Dart"));
      expect(
          () => programmingLanguage.at(4), throwsA(isA<InvalidIndexError>()));
    },
  );

  test(
    "Test for Appends",
    () {
      expect(emptyList.toList, equals([]));
      emptyList.append("Neo");
      expect(emptyList.toList, equals(["Neo"]));
      expect(emptyList.length, equals(1));
      emptyList.append("Agent Smith");
      expect(emptyList.toList, equals(["Neo", "Agent Smith"]));
      expect(emptyList.length, equals(2));
      emptyList.append("Agent Smith");
      expect(emptyList.toList, equals(["Neo", "Agent Smith", "Agent Smith"]));
      expect(emptyList.length, equals(3));
      emptyList.append("Agent Smith");
      expect(emptyList.toList,
          equals(["Neo", "Agent Smith", "Agent Smith", "Agent Smith"]));
      expect(emptyList.length, equals(4));

      expect(programmingLanguage.toList, equals(["C", "C++", "Java", "Dart"]));
      expect(fibonacciNumbers.toList, equals([1, 2, 3, 5, 8]));
    },
  );

  test(
    "Test for Prepends",
    () {
      programmingLanguage.prepend("Lisp");
      expect(programmingLanguage.toList,
          equals(["Lisp", "C", "C++", "Java", "Dart"]));
      expect(programmingLanguage.length, equals(5));

      emptyList.prepend('Dumb Agent 1');
      expect(emptyList.toList, equals(['Dumb Agent 1']));
      expect(emptyList.length, equals(1));

      emptyList.prepend('Dumb Agent 2');
      expect(emptyList.toList, equals(['Dumb Agent 2', 'Dumb Agent 1']));
      expect(emptyList.length, equals(2));

      emptyList.prepend('Agent Smith');
      expect(emptyList.toList,
          equals(['Agent Smith', 'Dumb Agent 2', 'Dumb Agent 1']));
      expect(emptyList.length, equals(3));

      emptyList.prepend('Neo');
      expect(emptyList.toList,
          equals(['Neo', 'Agent Smith', 'Dumb Agent 2', 'Dumb Agent 1']));
      expect(emptyList.length, equals(4));
    },
  );

  test(
    "Test for Pops",
    () {
      var dart = programmingLanguage.pop();
      expect(dart, equals("Dart"));
      expect(programmingLanguage.toList, equals(["C", "C++", "Java"]));
      expect(programmingLanguage.length, equals(3));

      var list = DoublyLinkedList.fromList([0]);
      var zero = list.pop();
      expect(zero, equals(0));
      expect(() => emptyList.pop(), throwsA(isA<InvalidIndexError>()));
    },
  );

  test(
    "Test for Shifts",
    () {
      var c = programmingLanguage.shift();
      expect(c, equals("C"));
      expect(programmingLanguage.toList, equals(["C++", "Java", "Dart"]));
      expect(programmingLanguage.length, equals(3));

      var list = DoublyLinkedList.fromList([0]);
      var zero = list.pop();
      expect(zero, equals(0));
      expect(() => emptyList.pop(), throwsA(isA<InvalidIndexError>()));
    },
  );

  test(
    "Test for Remove",
    () {
      var cpp = programmingLanguage.remove(1);
      expect(cpp, equals("C++"));
      expect(programmingLanguage.length, 3);
      expect(programmingLanguage.toList, ["C", "Java", "Dart"]);

      var java = programmingLanguage.remove(1);
      expect(java, equals('Java'));
      expect(programmingLanguage.toList, equals(['C', 'Dart']));
      expect(programmingLanguage.length, equals(2));

      var dart = programmingLanguage.remove(1);
      expect(dart, equals('Dart'));
      expect(programmingLanguage.toList, equals(['C']));
      expect(programmingLanguage.length, equals(1));

      var c = programmingLanguage.remove(0);
      expect(c, equals('C'));
      expect(programmingLanguage.toList, equals([]));
      expect(programmingLanguage.length, equals(0));
      expect(() => programmingLanguage.remove(-2),
          throwsA(isA<InvalidIndexError>()));
      expect(() => programmingLanguage.remove(10),
          throwsA(isA<InvalidIndexError>()));
      expect(() => emptyList.remove(-2), throwsA(isA<InvalidIndexError>()));
    },
  );

  test(
    "Test for Insert",
    () {
      programmingLanguage.insert("Pascal", 0);
      expect(programmingLanguage.toList,
          equals(["Pascal", "C", "C++", "Java", 'Dart']));
      expect(programmingLanguage.length, equals(5));

      programmingLanguage.insert('COBOL', 2);
      expect(programmingLanguage.toList,
          equals(['Pascal', 'C', 'COBOL', 'C++', 'Java', 'Dart']));
      expect(programmingLanguage.length, equals(6));

      programmingLanguage.insert('Clojure', 5);
      expect(programmingLanguage.toList,
          equals(['Pascal', 'C', 'COBOL', 'C++', 'Java', 'Clojure', 'Dart']));
      expect(programmingLanguage.length, equals(7));
      expect(() => programmingLanguage.insert('JavaScript', 7),
          throwsA(isA<InvalidIndexError>()));
      expect(() => programmingLanguage.insert('PHP', -1),
          throwsA(isA<InvalidIndexError>()));
    },
  );
}
