import 'dart:io';

void main() {
  List<String> board = List.filled(9, ' ');

  String firstPlayer = 'X';
  String secondPlayer = 'O';

  while (true) {
    gameLoop(board, firstPlayer, secondPlayer);

    if (!playAgain()) {
      break;
    } else {
      board = List.filled(9, ' ');
    }
  }
}

// Function to run the current match
void gameLoop(
    List<String> currentBoard, String firstPlayer, String secondPlayer) {
  // To track the current player turn
  String currentPlayer = firstPlayer;

  // Displays the initial board
  displayBoard(currentBoard);

  // Game loop
  while (true) {
    // Get the current player's move
    int move = getPlayerMove(currentPlayer, currentBoard);

    // Make the move on the board
    makeMove(currentBoard, move, currentPlayer);

    // Display the updated board
    displayBoard(currentBoard);

    // Check for a winner or a draw
    if (checkWinner(currentBoard, currentPlayer)) {
      print('Player $currentPlayer wins!');
      break;
    } else if (isBoardFull(currentBoard)) {
      print('The game is a draw!');
      break;
    }

    // Switch to the other player
    currentPlayer = (currentPlayer == firstPlayer) ? secondPlayer : firstPlayer;
  }
}

// Function to display the Tic-Tac-Toe board
void displayBoard(List<String> currentBoard) {
  for (var i = 0; i <= 6; i += 3) {
    print(
        ' ${currentBoard[i]} | ${currentBoard[i + 1]} | ${currentBoard[i + 2]} ');
    // Print horizontal lines
    // if i is greater than 6 then we dont need to print the horizontal line
    if (i < 6) print('-----------');
  }
}

// Function to get a player's move
int getPlayerMove(String currentPlayer, List<String> currentBoard) {
  int move;
  while (true) {
    stdout.write('Player $currentPlayer, enter your move (1-9): ');
    String input = stdin.readLineSync() ?? '';
    try {
      // Convert the input to an integer
      move = int.parse(input);

      // Check if the move is valid
      // The move must be between 1 and 9, and the cell must be empty
      // Also if the choosen cell is not empty, the player must choose another cell

      if (move < 1 || move > 9 || currentBoard[move - 1] != ' ') {
        throw FormatException();
      }

      // The move is valid so break out of the loop
      break;
    } catch (FormatException) {
      // The move is invalid so notify the player and repeat the loop

      print(
          'Invalid move. Please enter a number between 1 and 9, and make sure the cell is empty.');
    }
  }
  return move;
}

// Function to make a move on the board
void makeMove(
    List<String> currentBoard, int currentMove, String currentPlayer) {
  // Subtract 1 from the move to get the index of the cell
  // For example, if the player enters 1, the index is 0
  // If the player enters 9, the index is 8
  currentBoard[currentMove - 1] = currentPlayer;
}

// Function to check for a winner
bool checkWinner(List<String> currentBoard, String currentPlayer) {
  // Check rows, columns, and diagonals for a win
  for (int i = 0; i < 3; i++) {

    // Check rows and columns
    // for the first condition, i is 0, so the multiplication is 0, 3, and 6 which are the first row
    // for the second condition, i is 1, so the multiplication is 1, 4, and 7 which are the second row
    // for the third condition, i is 2, so the multiplication is 2, 5, and 8 which are the third row

    // for the second condition, i is 0, so the addition is 0, 1, and 2 which are the first column
    // for the second condition, i is 1, so the addition is 3, 4, and 5 which are the second column
    // for the second condition, i is 2, so the addition is 6, 7, and 8 which are the third column

    if ((currentBoard[i * 3] == currentPlayer &&
            currentBoard[i * 3 + 1] == currentPlayer &&
            currentBoard[i * 3 + 2] == currentPlayer) ||
        (currentBoard[i] == currentPlayer &&
            currentBoard[i + 3] == currentPlayer &&
            currentBoard[i + 6] == currentPlayer)) {
      return true;
    }
  }

  // Check diagonals
  // the first condition checks the left diagonal and the second checks the right diagonal
  // if the i is 0, then the first condition checks the left diagonal and the second checks the right diagonal
  // if the i is 1, then the first condition checks the right diagonal and the second checks the left diagonal
  // if the i is 2, then the first condition checks the left diagonal and the second checks the right diagonal
  if ((currentBoard[0] == currentPlayer &&
          currentBoard[4] == currentPlayer &&
          currentBoard[8] == currentPlayer) ||
      (currentBoard[2] == currentPlayer &&
          currentBoard[4] == currentPlayer &&
          currentBoard[6] == currentPlayer)) {
    return true;
  }

  // No winner
  return false;
}

// Function to check if the board is full
bool isBoardFull(List<String> currentBoard) {
  // if the board contains a space, then the board is not full
  return !currentBoard.contains(' ');
}

// Function to check if the player wants to play again

bool playAgain() {
  stdout.write('Would you like to play again? (y/n): ');
  String input = stdin.readLineSync() ?? '';
  return (input.toLowerCase() == 'y') ? true : false;
}
