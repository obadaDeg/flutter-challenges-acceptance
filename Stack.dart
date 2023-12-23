// // Purpose: Stack class


// this class implements a stack, its copied from Kodeco website.
// class Stack<E> {
//   Stack() : _storage = <E>[];
//   final List<E> _storage;

//   void push(E element) => _storage.add(element);

//   E pop() => _storage.removeLast();


//   E peek() => _storage.last;

//   bool get isEmpty => _storage.isEmpty;

//   bool get isNotEmpty => _storage.isNotEmpty;

//   int get length => _storage.length;



//   @override
//   String toString() {
//     return '--- Top ---\n'
//         '${_storage.reversed.join('\n')}'
//         '\n-----------';
//   }

// }


// this class implements a stack, I develop the code from Kodeco ideas and do some edits to it.

class Stack<T> {
  List<T> _items = [];

  void push(T item) {
    _items.add(item);
  }

  T pop() {
    if (_items.isEmpty) {
      throw StateError("The Stack is empty");
    }
    return _items.removeLast();
  }

  T peek() {
    if (_items.isEmpty) {
      throw StateError('The Stack is empty');
    }
    return _items.last;
  }



  bool isEmpty() {
    return _items.isEmpty;
  }

  bool isNotEmpty() {
    return _items.isNotEmpty;
  }

  @override
  String toString() {
    return '--- Top ---\n'
        '${_items.reversed.join('\n')}'
        '\n-----------';
  }

  int size() {
    return _items.length;
  }
}


// This function uses stack to balance the Parentheses, which take string as an argument
// it returns true if the parentheses are balanced
// it returns false if the parentheses are not balanced
// it doesnt modify the string


bool isBalanced(String string) {
  Stack stack = Stack();

  print('the String is: $string'); // just for readability in the console

  for (var i = 0; i < string.length; i++) {
    if (string[i] == '(') {
      stack.push(string[i]);
    } else if (string[i] == ')') {
      if (stack.isEmpty()) {
        return false;
      } else {
        stack.pop();
      }
    }
  }

  return stack.isEmpty();
}



// this function uses the stack to print the list in reverse order
// it takes a list as an argument
// it returns nothing
// it doesnt modify the list

void printReverse(List list) {
  Stack stack = Stack();

  for (var i = 0; i < list.length; i++) {
    stack.push(list[i]);
  }

  while (stack.isNotEmpty()) {
    print(stack.pop());
  }
}
