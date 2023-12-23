import 'stack.dart';

// This code is copied from Kodeco.
class Node<T> {
  Node({required this.value, this.next});
  T value;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;

  bool get isEmpty => head == null;

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }

  void push(E value) {
    head = Node(value: value, next: head);
    tail ??= head;
  }

  void append(E value) {
    // 1
    if (isEmpty) {
      push(value);
      return;
    }

    // 2
    tail!.next = Node(value: value);

    // 3
    tail = tail!.next;
  }

  Node<E>? nodeAt(int index) {
    // 1
    var currentNode = head;
    var currentIndex = 0;

    // 2
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    // 1
    if (tail == node) {
      append(value);
      return tail!;
    }

    // 2
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  E? pop() {
    final value = head?.value;
    head = head?.next;
    if (isEmpty) {
      tail = null;
    }
    return value;
  }

  E? removeLast() {
    // 1
    if (head?.next == null) return pop();

    // 2
    var current = head;
    while (current!.next != tail) {
      current = current.next;
    }

    // 3
    final value = tail?.value;
    tail = current;
    tail?.next = null;
    return value;
  }

  E? removeAfter(Node<E> node) {
    final value = node.next?.value;
    if (node.next == tail) {
      tail = node;
    }
    node.next = node.next?.next;
    return value;
  }

  void clear() {
    while (!isEmpty) {
      pop();
    }
  }
}

// this function prints the nodes of a linked list in reverse order.

void printReverseLinkedList(LinkedList linkedList) {
  var stack = Stack();
  var currentNode = linkedList.head;
  while (currentNode != null) {
    stack.push(currentNode.value);
    currentNode = currentNode.next;
  }
  while (stack.isNotEmpty()) {
    print(stack.pop());
  }
}


// This function finds middle node in a linked list
// it takes a linked list as an argument
// the logic is to use two pointers, one is moving twice as fast as the other'
// when the fast pointer reaches the end of the list, the slow pointer will be in the middle of the list
// if the list is even, the slow pointer will be in the middle of the second half of the list
// if the list is odd, the slow pointer will be in the middle of the list

Node? findMiddleNode(LinkedList linkedList) {
  var currentNode = linkedList.head;
  var middleNode = linkedList.head;
  while (currentNode != null && currentNode.next != null) {
    currentNode = currentNode.next?.next;
    middleNode = middleNode?.next;
  }
  return middleNode;
}

// this function reverse the linked list

void reverseLinkedList(LinkedList linkedList) {
  var currentNode = linkedList.head;
  Node? previousNode;
  Node? nextNode;
  while (currentNode != null) {
    nextNode = currentNode.next;
    currentNode.next = previousNode;
    previousNode = currentNode;
    currentNode = nextNode;
  }
  linkedList.tail = linkedList.head;
  linkedList.head = previousNode;
}

// this function removes all occurrences of a specific element from a linked list which is similar to the removeAfter function

void removeAllOccurrences(LinkedList linkedList, int value) {
  var currentNode = linkedList.head;
  while (currentNode != null) {
    if (currentNode.next?.value == value) {
      currentNode.next = currentNode.next?.next;
    } else {
      currentNode = currentNode.next;
    }
  }
}
