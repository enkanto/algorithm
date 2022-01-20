import '../heaps/base.dart';

import 'doubly_linked_list.dart' show Node;

/// This circular linked list is based off of [DoublyLinkedList]
class CircularDoublyLinkedList<T> {
  /// First node of the list
  Node<T>? _head;

  /// Last node of the list
  Node<T>? _tail;

  /// Size of the list
  int length;

  /// getter for [head]
  T? get head => _head?.data;

  /// getter for [tail]
  T? get tail => _tail?.data;

  /// Checks if [this] is empty
  bool get isEmpty => length == 0;

  /// Construct a doubly circular linked list
  CircularDoublyLinkedList() : length = 0;

  /// Construct a doubly circular linked list using list
  CircularDoublyLinkedList.fromList(List<T> items) : length = 0 {
    for (final item in items) {
      append(item);
    }
  }

  /// Converts [this] into a [List]
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

  /// Adds data to the end of the list
  void append(T data) {
    var newNode = Node(data);

    if (isEmpty) {
      _makeSingleNode(newNode);
    } else {
      _tail!.next = newNode;
      newNode.previous = _tail;
      newNode.next = _head;
      // CHECK
      _head!.previous = newNode;

      _tail = newNode;
    }

    length++;
  }

  /// Adds data to the beginning of the list.
  void prepend(T data) {
    var newNode = Node(data);

    if (isEmpty) {
      _makeSingleNode(newNode);
    } else {
      _head!.previous = newNode;
      newNode.next = _head;
      // CHECK
      newNode.previous = _tail;
      _tail!.next = newNode;

      _head = newNode;
    }

    length++;
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

    var iterNo = n >= length ? n % length : n;
    var current = _head;
    for (var i = 0; i < iterNo; i++) {
      current = current!.next;
    }

    return current!;
  }

  /// Remove from the end of the list
  T pop() {
    if (isEmpty) throw InvalidIndexError();

    var removeMe = _tail;

    _tail = _tail!.previous;
    _tail!.next = _head;
    _head!.previous = _tail;

    length--;
    return removeMe!.data;
  }

  /// Remove from the beginning of the list
  T shift() {
    if (isEmpty) throw InvalidIndexError();

    var removeMe = _head;

    _head = _head!.next;
    _head!.previous = _tail;
    _tail!.next = _head;

    length--;
    return removeMe!.data;
  }

  void _makeSingleNode(Node<T> newNode) {
    _head = newNode;
    _tail = newNode;

    _head!.next = _tail;
    _head!.previous = _tail;
    _tail!.next = _head;
    _tail!.previous = _head;
  }
}
