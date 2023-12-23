import 'stack.dart';
import 'LinkedList.dart';

void stackTest() {
  Stack<int> intStack = Stack<int>();

  intStack.push(1);
  intStack.push(2);
  intStack.push(3);

  print(intStack.size());

  print(intStack);

  print(intStack.pop());
  print(intStack.pop());

  print(intStack.peek());
  print(intStack.peek());

  print(intStack);

  print(intStack.isEmpty());

  print(intStack.size());
}

void printReverseTest() {
  List list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List obadaSkills = [
    'ReactJS',
    'C++',
    'Problem-Solving',
    'Node.js',
    'HTML',
    'CSS',
    'JavaScript',
    'Data Structures',
    'Algorithms',
    'Git',
    'GitHub',
    'Database',
  ];

  List obadaAims = ['Dart', 'Flutter', 'Mobile Development', 'Python'];

  printReverse(list);

  print('=====================');

  printReverse(obadaSkills);

  print('=====================');

  printReverse(obadaAims);
}

void isBalancedTest() {
  print(isBalanced('((()))'));
  print(isBalanced('(()))'));
  print(isBalanced('(()()()())'));
  print(isBalanced('((((((())'));
  print(isBalanced('()))'));
  print(isBalanced('(()()(()'));
  print(isBalanced('())('));
  print(isBalanced(')('));
}

void linkedListTest() {
  LinkedList<int> linkedList = LinkedList<int>();

  linkedList.push(1);
  linkedList.push(2);
  linkedList.push(3);

  print(linkedList);

  linkedList.append(4);
  linkedList.append(5);
  linkedList.append(6);

  print(linkedList);

  linkedList.insertAfter(linkedList.head!, 7);
  linkedList.insertAfter(linkedList.head!, 8);
  linkedList.insertAfter(linkedList.head!, 9);

  print(linkedList);

  linkedList.pop();
  print(linkedList);
  print(linkedList.pop());
  print(linkedList);
  print(linkedList.pop());

  print(linkedList);

  linkedList.removeLast();
  print(linkedList.removeLast());
  print(linkedList.removeLast());

  print(linkedList);

  print(linkedList.removeAfter(linkedList.head!));
  print(linkedList.removeAfter(linkedList.head!));
  print(linkedList.removeAfter(linkedList.head!));

  print(linkedList);
}

void testPrintReverseLinkedList() {
  LinkedList<int> linkedList = LinkedList<int>();

  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  linkedList.append(4);
  linkedList.append(5);

  printReverseLinkedList(linkedList);
  print(linkedList);
}

void testFindMiddleNode() {
  LinkedList<int> linkedList = LinkedList<int>();

  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  linkedList.append(4);
  linkedList.append(5);

  print("The middle node is: ${findMiddleNode(linkedList)}");
  print('linkedList: $linkedList');

  linkedList.append(6);

  print("The middle node is: ${findMiddleNode(linkedList)}");
  print('linkedList: $linkedList');

  linkedList.append(7);

  print("The middle node is: ${findMiddleNode(linkedList)}");
  print('linkedList: $linkedList');

  linkedList.append(8);

  print("The middle node is: ${findMiddleNode(linkedList)}");
  print('linkedList: $linkedList');
}


void testReverseLinkedList() {
  LinkedList<int> linkedList = LinkedList<int>();

  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  linkedList.append(4);
  linkedList.append(5);

  print('linkedList: $linkedList');
  reverseLinkedList(linkedList);
  print('linkedList: $linkedList');
}

void testRemoveAllOccurence() {
  LinkedList<int> linkedList = LinkedList<int>();

  linkedList.append(1);
  linkedList.append(2);
  linkedList.append(3);
  linkedList.append(4);
  linkedList.append(5);
  linkedList.append(3);
  linkedList.append(6);
  linkedList.append(3);
  linkedList.append(7);
  linkedList.append(8);
  linkedList.append(3);
  linkedList.append(9);
  linkedList.append(10);
  linkedList.append(3);

  print('linkedList: $linkedList');
  removeAllOccurrences(linkedList, 3);
  print('linkedList: $linkedList');
}