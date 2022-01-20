import 'package:algorithms/heaps/base.dart';
import 'package:algorithms/lists/circular_doubly_linked_list.dart';
import 'package:test/test.dart';

void main() {
  late CircularDoublyLinkedList emptyList;
  late CircularDoublyLinkedList singleItemList;
  late CircularDoublyLinkedList dceuMovieListLol;

  setUp(
    () {
      emptyList = CircularDoublyLinkedList();
      singleItemList = CircularDoublyLinkedList()..append(42);
      dceuMovieListLol = CircularDoublyLinkedList.fromList(
          ["Superman", "Batman v Superman", "Wonder Woman"]);
    },
  );

  test(
    "List size",
    () {
      expect(emptyList.length, equals(0));
      expect(singleItemList.length, equals(1));
      expect(dceuMovieListLol.length, equals(3));
    },
  );

  test(
    "Append",
    () {
      expect(emptyList.toList, equals([]));
      expect(singleItemList.toList, equals([42]));
      expect(dceuMovieListLol.toList,
          equals(["Superman", "Batman v Superman", "Wonder Woman"]));
    },
  );

  test(
    "Prepend",
    () {
      emptyList.prepend('¯\_(ツ)_/¯');
      expect(emptyList.toList, equals(['¯\_(ツ)_/¯']));
      expect(emptyList.length, equals(1));

      singleItemList
        ..prepend(41)
        ..prepend(40)
        ..prepend(39)
        ..prepend(38)
        ..prepend(37);

      expect(singleItemList.toList, equals([37, 38, 39, 40, 41, 42]));
      expect(singleItemList.length, equals(6));
    },
  );

  test(
    "Pop",
    () {
      expect(() => emptyList.pop(), throwsA(isA<InvalidIndexError>()));

      var dceuMovieListLater = dceuMovieListLol
        ..append('Suicide Squad')
        ..append('Justice League');

      expect(dceuMovieListLater.length, equals(5));

      var justiceLeague = dceuMovieListLater.pop();
      var suicideSquad = dceuMovieListLater.pop();

      expect(justiceLeague, equals("Justice League"));
      expect(suicideSquad, equals("Suicide Squad"));
      expect(dceuMovieListLater.length, equals(3));
      expect(dceuMovieListLater, equals(dceuMovieListLol));

      var theAnswer = singleItemList.pop();
      expect(theAnswer, equals(42));
      expect(singleItemList.isEmpty, equals(true));
    },
  );

  test(
    "Shift",
    () {
      expect(() => emptyList.shift(), throwsA(isA<InvalidIndexError>()));

      var superman = dceuMovieListLol.shift();
      expect(superman, equals("Superman"));
      expect(dceuMovieListLol.toList,
          equals(["Batman v Superman", "Wonder Woman"]));
      expect(dceuMovieListLol.length, equals(2));
      var bVs = dceuMovieListLol.shift();
      expect(bVs, equals("Batman v Superman"));
      expect(dceuMovieListLol.toList, equals(["Wonder Woman"]));
      expect(dceuMovieListLol.length, equals(1));
      var wonderWoman = dceuMovieListLol.shift();
      expect(wonderWoman, equals("Wonder Woman"));
      expect(dceuMovieListLol.toList, equals([]));
      expect(dceuMovieListLol.length, equals(0));
      expect(dceuMovieListLol.isEmpty, equals(true));
      expect(() => dceuMovieListLol.shift(), throwsA(isA<InvalidIndexError>()));

      var theAnswerAgain = singleItemList.shift();
      expect(theAnswerAgain, equals(42));
      expect(singleItemList.toList, equals([]));
      expect(singleItemList.isEmpty, equals(true));
    },
  );

  test(
    "At",
    () {
      var flames = ["F", "L", "A", "M", "E", "S"];
      var flamesList = CircularDoublyLinkedList.fromList(flames);

      expect(flamesList.at(0), equals("F"));
      expect(flamesList.at(1), equals('L'));
      expect(flamesList.at(2), equals('A'));
      expect(flamesList.at(21), equals('M'));
      expect(flamesList.at(10), equals('E'));
      expect(flamesList.at(35), equals('S'));
      expect(() => flamesList.at(-20), throwsA(isA<InvalidIndexError>()));
    },
  );
}
