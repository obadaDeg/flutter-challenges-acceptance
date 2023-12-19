import 'dart:io';

void main() {
  List<String> board = List.filled(9, ' ');

  String firstPlayer = 'X';
  String secondPlayer = 'O';

  String currentPlayer = firstPlayer;

  displayBoard(board);

  
}


void displayBoard(List<String> board) {
  print(' ${board[0]} | ${board[1]} | ${board[2]} ');
  print('-----------');
  print(' ${board[3]} | ${board[4]} | ${board[5]} ');
  print('-----------');
  print(' ${board[6]} | ${board[7]} | ${board[8]} ');
}



