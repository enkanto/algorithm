import '../heaps/base.dart';

import 'singly_linked_list.dart';

/// This circular linked list is based off of [SinglyLinkedList]
class CircularSinglyLinkedList<T> {
  /// Head of [this]
  Node<T>? _head;

  /// Size of [this]
  int length;

  /// Construct a CircularSinglyLinkedList
  CircularSinglyLinkedList() : length = 0;

  /// Create and propopulate [this] from a [List]
  CircularSinglyLinkedList.fromList(List<T> list) : length = 0 {
    for (final item in list) {
      append(item);
    }
  }

  /// Getter for [this.head]
  T? get head => _head?.data;

  /// Checks if [this] is empty
  bool get isEmpty => length == 0;

  /// Converts [this] to [List]
  List<T> get toList {
    if (isEmpty) return [];

    var asList = <T>[_head!.data];
    var current = _head!.next;

    while (current != _head) {
      asList.add(current!.data);
      current = current.next;
    }

    return asList;
  }

  /// Returns the element [n].
  ///
  /// Since this is a circular linked list, if [n] is greater than the size,
  /// it will still iterate, circling back to the beginning every time.
  T at(int n) {
    return _at(n).data;
  }

  Node<T> _at(int n) {
    if (isEmpty || n < 0) throw InvalidIndexError();

    var iterNo = n;
    if (n >= length) {
      iterNo %= length;
    }

    var current = _head;
    for (var i = 0; i < iterNo; i++, current = current!.next) {
      ;
    }
    return current!;
  }

  /// Adds data to the end of the list
  void append(T data) {
    var newNode = Node(data);

    if (isEmpty) {
      _head = newNode;
      newNode.next = _head;
    } else {
      var current = _head;
      while (current!.next != _head) {
        current = current.next;
      }

      current.next = newNode;
      newNode.next = _head;
    }

    length++;
  }

  /// Adds data to the beginning of the list
  void prepend(T data) {
    var newNode = Node(data);

    if (isEmpty) {
      _head = newNode;
      newNode.next = _head;
    } else {
      newNode.next = _head;
      var current = _head;

      while (current!.next != _head) {
        current = current.next;
      }

      current.next = newNode;
      _head = newNode;
    }

    length++;
  }

  /// Removes from the end of the list
  T pop() {
    if (isEmpty) throw InvalidIndexError();

    var current = _head;
    var beforeLast = current;

    beforeLast = current;
    current = current!.next;

    while (current!.next != _head) {
      beforeLast = current;
      current = current.next;
    }

    beforeLast!.next = _head;

    length--;
    return current.data;
  }

  /// Removes from the beginning of the list
  T shift() {
    if (isEmpty) throw InvalidIndexError();

    var removeMe = _head;
    var current = _head;

    while (current!.next != _head) {
      current = current.next;
    }

    _head = _head!.next;
    current.next = _head;

    length--;
    return removeMe!.data;
  }
}
