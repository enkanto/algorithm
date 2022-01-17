import '../heaps/base.dart';

/// The DoublyLinkedList Node.
///
/// It has both previous and next references.
class Node<T> {
  /// The data [this] contains
  T data;

  /// Reference to previous [Node]
  Node<T>? previous;

  /// Reference to next [Node]
  Node<T>? next;

  /// Initialize [Node] with data.
  Node(this.data);
}

/// DoubleLinkedList ADT
class DoublyLinkedList<T> {
  /// First node of the list
  Node<T>? _head;

  /// Last node of the list
  Node<T>? _tail;

  /// Size of the list
  int length;

  /// Constructor
  DoublyLinkedList() : length = 0;

  /// Getter for head
  T? get head => _head?.data;

  /// Getter for tail
  T? get tail => _tail?.data;

  /// Create DoublyLinkedList from [list]
  DoublyLinkedList.fromList(List<T> list) : length = 0 {
    for (final item in list) {
      append(item);
    }
  }

  /// Check whether the list is empty
  bool get isEmpty => length == 0;

  /// Converts [this] to a [List]
  List<T> get toList {
    var asList = <T>[];

    var current = _head;
    while (current != null) {
      asList.add(current.data);
      current = current.next;
    }

    return asList;
  }

  /// Show the [n]th element of the list
  Node<T> _at(int n) {
    if (n < 0 || n >= length) throw InvalidIndexError();

    var current = _head;
    for (var index = 0; index != n; index++) {
      current = current!.next;
    }

    return current!;
  }

  /// Show the [n]th data of the list
  T at(int n) {
    return _at(n).data;
  }

  /// Add something to the beginning of [this]
  void prepend(T data) {
    var newNode = Node(data);

    if (isEmpty) {
      _setOnlyNode(newNode);
    } else {
      newNode.next = _head;
      _head!.previous = newNode;
      _head = newNode;
    }

    length++;
  }

  /// Add something at the end of [this]
  void append(T data) {
    var newNode = Node(data);

    if (isEmpty) {
      _setOnlyNode(newNode);
    } else {
      newNode.previous = _tail;
      _tail!.next = newNode;
      _tail = newNode;
    }

    length++;
  }

  /// Insert [data] at [n] index
  void insert(T data, int n) {
    var newNode = Node(data);

    var nextNode = _at(n);

    if (nextNode == _head) {
      prepend(newNode.data);
    } else {
      newNode.next = nextNode;
      newNode.previous = nextNode.previous;

      newNode.previous!.next = newNode;
      nextNode.previous = newNode;

      length++;
    }
  }

  /// Remove the last element
  T pop() {
    if (isEmpty) throw InvalidIndexError();

    var removeMe = _tail!;

    if (length == 1) {
      _makeEmpty();
    } else {
      _tail = removeMe.previous;
      _tail!.next = null;
      removeMe.previous = null;
    }

    length--;
    return removeMe.data;
  }

  /// Remove the first element
  T shift() {
    if (isEmpty) throw InvalidIndexError();

    var removeMe = _head!;

    if (length == 1) {
      _makeEmpty();
    } else {
      _head = removeMe.next;
      _head!.previous = null;
      removeMe.next = null;
    }

    length--;
    return removeMe.data;
  }

  /// Remove from [n] index
  T remove(int n) {
    var removeMe = _at(n);

    if (removeMe == _head) {
      return shift();
    } else if (removeMe == _tail) {
      return pop();
    } else {
      removeMe.previous?.next = removeMe.next;
      removeMe.next?.previous = removeMe.previous;
      length--;
    }

    return removeMe.data;
  }

  /// Set the list to empty
  void _makeEmpty() {
    _head = null;
    _tail = null;
  }

  /// Set [node] as the only node for [this]
  void _setOnlyNode(Node<T> node) {
    _head = node;
    _tail = node;
  }
}
