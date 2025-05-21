import 'dart:io';

// Title: HackMD Excercise #20

// Purpose: In 3 previous exercises, we built up a few components needed to build a Tic Tac Toe game in Dart:

// Draw the Tic Tac Toe game board
// Checking whether a game board has a winner
// Handle a player move from user input
// The next step is to put all these three components together to make a two-player Tic Tac Toe game!

// Your challenge in this exercise is to use the functions from those previous exercises all together in the same program to make a two-player game that
// you can play with a friend. There are a lot of choices you will have to make when completing this exercise,
// so you can go as far or as little as you want with it.

// Author: Mahmoud Khaled 

void drawGrid(List<List<String>> game) {
  int rows = 3;
  int columns = 3;

  for (var i = 0; i <= rows*2; i++) {

    String row = "";
    for (var j = 0; j < columns; j++) {

      if(i % 2 == 0) {
        row += " ---";
      } else {
        row += "| ${game[((2*i-((i-1)))/2 - 1).toInt()][j]} ";

        if(j == columns-1) {
          row += "|";
        }

      }

    }
    print(row);
  }
}

bool CheckWinning(List<List<String>> game) {
  if((game[0][0] == game[0][1] && game[0][0] == game[0][2] && game[0][0] != " ") || 
       (game[0][0] == game[1][0] && game[0][0] == game[2][0] && game[0][0] != " ") || 
       (game[0][0] == game[1][1] && game[0][0] == game[2][2] && game[0][0] != " ")) {
      print("player ${game[0][0]} wins!!");
      return true;

    }

    if((game[0][1] == game[1][1] && game[0][1] == game[2][1] && game[1][1] != " ") ||
       (game[1][0] == game[1][1] && game[1][0] == game[1][2] && game[1][1] != " ")) {
      print("player ${game[1][1]} wins!!");
      return true;

    }

    if((game[0][2] == game[1][2] && game[0][2] == game[2][2] && game[2][2] != " ") ||
       (game[2][0] == game[2][1] && game[2][0] == game[2][2] && game[2][2] != " ")) {

      print("player ${game[2][2]} wins!!");
      return true;
    }

    return false;
}


bool takeInput(List<List<String>> game, int currPlayer) {

  print("Player $currPlayer turn: ");

  stdout.write("Row coordinate: ");
  int row = int.parse(stdin.readLineSync()!);

  stdout.write("Column coordinate: ");
  int column = int.parse(stdin.readLineSync()!);

  if(game[row-1][column-1] != " ") {
    print("cell occupied...");
    return false;
  }

  if(row > 3 || column > 3) {
    print("please enter coordinates from 1 to 3");
  }

  currPlayer == 1 ?  game[row-1][column-1] = 'X' : game[row-1][column-1] = 'O';
  return true;

  // print(game);
}

void main() {

  int currPlayer = 0;

  List<List<String>> game =  [[' ',' ',' '], 
                              [' ',' ',' '],
                              [' ',' ',' ']];

  print("Welcome to tic-tac-toe game!");

  while (true) {
    drawGrid(game);

    if(takeInput(game, currPlayer)) {
      currPlayer = ++currPlayer % 2;
    }


    if(CheckWinning(game)) {
      drawGrid(game);
      break;
    }
    
  }

  print("Thank you! :)");



}