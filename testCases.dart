import 'stack.dart';

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
