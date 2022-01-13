/// Binary Search
/// - 정렬되어 있는 array일 때, 사용할 수 있는 search
/// - binary search: O(lg(n)) time complexity
/// - 어떻게 구현? => left, right, pivot으로 찾아간다
/// - pivot = (left index + right index) / 2
/// - list[pivot] 과 비교하여 left 혹은 right 값 업데이트
int binarySearch<T extends Comparable>(List<T> hayStack, T target) {
  var min = 0;
  var max = hayStack.length;

  while (min < max) {
    var mid = min + ((max - min) >> 1);
    var comparison = hayStack[mid].compareTo(target);
    if (comparison == 0) return mid;
    if (comparison < 0) {
      //  hayStack[mid]이 target 보다 앞에 온다
      min = mid + 1;
    } else {
      // hayStack[mid]이 target 보다 뒤에 온다
      max = mid;
    }
  }

  return -1;
}

/// practice reference
int binarySearchPractice(List<int> list, int target) {
  var left = 0;
  var right = list.length - 1;

  while (left <= right) {
    var pivot = (left + right) >> 1;

    if (list[pivot] == target) {
      return pivot;
    } else if (list[pivot] < target) {
      left = pivot + 1;
    } else {
      right = pivot - 1;
    }
  }

  return -1;
}
