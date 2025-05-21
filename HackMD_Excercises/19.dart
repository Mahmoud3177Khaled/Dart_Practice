import 'dart:io';

// Title: HackMD Excercise #19

// Purpose: In a previous exercise we explored the idea of using a list of lists as a “data structure” to store information about a tic tac toe game.
// In a tic tac toe game, the “game server” needs to know where the Xs and Os are in the board,
// to know whether player 1 or player 2 (or whoever is X and O) won.

// There has also been an exercise (17) about drawing the actual tic tac toe gameboard using text characters.

// The next logical step is to deal with handling user input. When a player (say player 1, who is X) wants to place an X on the screen,
// they can’t just click on a terminal. So you are going to approximate this clicking simply by asking the user for a coordinate of where
// they want to place their piece.

// Author: Mahmoud Khaled 

void takeInput(List<List<String>> game, int currPlayer) {

  stdout.write("Row coordinate: ");
    int row = int.parse(stdin.readLineSync()!);

    stdout.write("Column coordinate: ");
    int column = int.parse(stdin.readLineSync()!);

    if(row > 3 || column > 3) {
      print("please enter coordinates from 1 to 3");
    }

    currPlayer == 1 ?  game[row-1][column-1] = 'X' : game[row-1][column-1] = 'O';

    print(game);
}

void main() {

  List<List<String>> game = [['X','O','X'], 
                             ['O','X','O'],
                             ['X','O','X']];

  try {

    takeInput(game, 1);


  } catch(e) {
    print("Please enter a decimal number...");

  }
}