import 'package:algorithms/heaps/base.dart';
import 'package:algorithms/lists/stack.dart';
import 'package:test/test.dart';

void main() {
  late Stack<String> mcuHeros;
  late Stack<String> emptyStack;

  setUp(
    () {
      emptyStack = Stack();
      mcuHeros = Stack()
        ..push("Iron Man")
        ..push("Captain America")
        ..push("Thor")
        ..push("Hulk");
    },
  );

  test(
    "Push increases the size and adds to the container",
    () {
      mcuHeros.push("Ant-man");
      expect(mcuHeros.size, equals(5));
      expect(mcuHeros.peek(), equals("Ant-man"));
      mcuHeros.push("Ben Affleck");
      expect(mcuHeros.peek(), equals("Ben Affleck"));
      expect(mcuHeros.peek(), equals("Ben Affleck"));
      expect(mcuHeros.size, equals(6));
      expect(mcuHeros.pop(), equals("Ben Affleck"));
    },
  );

  test(
    "Pop from empty list",
    () {
      expect(() => emptyStack.pop(), throwsA(isA<InvalidIndexError>()));
    },
  );

  test(
    "Pop decreases size and returns the top",
    () {
      expect(mcuHeros.pop(), equals("Hulk"));
      expect(mcuHeros.size, equals(3));
      expect(mcuHeros.pop(), equals("Thor"));
      expect(mcuHeros.size, equals(2));
      expect(mcuHeros.pop(), equals("Captain America"));
      expect(mcuHeros.size, equals(1));
      expect(mcuHeros.pop(), equals("Iron Man"));
      expect(mcuHeros.size, equals(0));
      expect(mcuHeros.isEmpty, equals(true));
    },
  );

  test(
    "Peek an empty list",
    () {
      expect(emptyStack.peek(), equals(null));
    },
  );

  test(
    "Peek",
    () {
      expect(mcuHeros.peek(), equals("Hulk"));
      expect(mcuHeros.size, equals(4));
    },
  );
}
