import 'package:algorithms/search/interval.dart';
import 'package:test/test.dart';

void main() {
  const sampleList = <int>[
    -7,
    2,
    3,
    45,
    65,
    78,
    90,
    200,
    349,
    359,
    453,
    1012,
    2932,
    4540
  ];

  group(
    "Binary Search",
    () {
      test(
        "should return index when there is a right value in the list",
        () {
          for (var i = 0; i < sampleList.length; i++) {
            expect(binarySearch(sampleList, sampleList[i]), equals(i));
          }
        },
      );

      test(
        "should return -1 when there is no value in the list",
        () {
          for (var needle = 0; needle < 100; needle++) {
            if (!sampleList.contains(needle)) {
              expect(binarySearch(sampleList, needle), equals(-1));
            }
          }
        },
      );
    },
  );
}
