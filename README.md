# First Challenge:

# Tic-Tac-Toe Console Application

# Overview
This Dart console application implements a simple Tic-Tac-Toe game that allows two players to take turns making moves on a 3x3 grid until one player wins or the game ends in a draw.


# Features


Game Board:

Implemented a 3x3 grid to represent the Tic-Tac-Toe board.
Displays the current state of the board after each move.

Players:

Allows two players to take turns, one representing 'X' and the other 'O'.
Prompts players to input their moves using the console.

Input Validation:

Validates user inputs to ensure they are within the valid range (1-9) and correspond to an empty cell on the board.
Displays an error message for invalid inputs and prompts the player to enter a valid move.

Winning Conditions:

Determines and checks for winning conditions after each move.
Declares the winner if there are three consecutive 'X' or 'O' markers in a row, column, or diagonal.
Ends the game if a winner is declared.

Draw Condition:

Declares the game as a draw if all cells are filled, and no player has achieved a winning condition.

Game Loop:

Implements a loop to allow the game to continue until there is a winner or a draw.
Provides an option to restart the game after it concludes.

Code Structure:

Organized code into functions and classes to enhance readability and maintainability.
Used proper naming conventions for variables and functions.

Documentation:

Included comments and documentation within the code to explain the logic and functionality.

# How to Run
Clone the repository.
Open the terminal and navigate to the project directory.
Run the Dart application using the command: dart TicTacToe.dart.