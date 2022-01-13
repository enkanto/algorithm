import 'package:algorithms/lists/queue.dart';
import 'package:test/test.dart';

void main() {
  late Queue<String> mcuUpcomingMovies;
  late Queue<String> emptyQueue;

  setUp(
    () {
      emptyQueue = Queue();
      mcuUpcomingMovies = Queue()
        ..enqueue("Avengers: Infinity War")
        ..enqueue("Ant-man and Wasp")
        ..enqueue("Captain Marvel")
        ..enqueue("Avengers: Endgame");
    },
  );

  test(
    "Show the earliest",
    () {
      expect(emptyQueue.head, equals(null));
      expect(mcuUpcomingMovies.head, equals("Avengers: Infinity War"));
    },
  );

  test(
    "Show the latest",
    () {
      expect(emptyQueue.tail, equals(null));
      expect(mcuUpcomingMovies.tail, equals("Avengers: Endgame"));
    },
  );

  test(
    "New movies coming up and getting released",
    () {
      mcuUpcomingMovies
        ..enqueue("Spider-man: Far from home")
        ..enqueue("Black Widow");
      expect(mcuUpcomingMovies.length, equals(6));

      expect(mcuUpcomingMovies.dequeue(), equals("Avengers: Infinity War"));
      expect(mcuUpcomingMovies.length, equals(5));

      expect(mcuUpcomingMovies.dequeue(), equals("Ant-man and Wasp"));
      expect(mcuUpcomingMovies.length, equals(4));

      expect(mcuUpcomingMovies.dequeue(), equals("Captain Marvel"));
      expect(mcuUpcomingMovies.length, equals(3));

      expect(mcuUpcomingMovies.dequeue(), equals("Avengers: Endgame"));
      expect(mcuUpcomingMovies.length, equals(2));

      expect(mcuUpcomingMovies.dequeue(), equals("Spider-man: Far from home"));
      expect(mcuUpcomingMovies.length, equals(1));

      expect(mcuUpcomingMovies.dequeue(), equals("Black Widow"));
      expect(mcuUpcomingMovies.length, equals(0));
      expect(mcuUpcomingMovies.isEmpty, equals(true));
    },
  );
}
