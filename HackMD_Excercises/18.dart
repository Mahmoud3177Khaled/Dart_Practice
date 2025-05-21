
// Title: HackMD Excercise #18

// Purpose: As you may have guessed, we are trying to build up to a full tic-tac-toe board.
// For now, we will simply focus on checking whether someone has WON the game, not worrying about how the moves were made.

// If a game of Tic Tac Toe is represented as a list of lists, like so:

// game = [[1, 2, 0],
//         [2, 1, 0],
//         [2, 1, 1]]

// where a 0 means an empty square, a 1 means that player 1 put their token in that space, and a 2 means that player 2 put their token in that space.

// Your task: given a 3 by 3 list of lists that represents a Tic Tac Toe game board, tell whether anyone has won, and tell which player won, if any.

// Author: Mahmoud Khaled 

void main() {

  List<List<int>> game = [[0,0,0], 
                          [2,0,0],
                          [1,1,1]];

  try {

    if((game[0][0] == game[0][1] && game[0][0] == game[0][2] && game[0][0] != 0) || 
       (game[0][0] == game[1][0] && game[0][0] == game[2][0] && game[0][0] != 0) || 
       (game[0][0] == game[1][1] && game[0][0] == game[2][2] && game[0][0] != 0)) {
      print("player ${game[0][0]} wins!!");

    }

    if((game[0][1] == game[1][1] && game[0][1] == game[2][1] && game[1][1] != 0) ||
       (game[1][0] == game[1][1] && game[1][0] == game[1][2] && game[1][1] != 0)) {
      print("player ${game[1][1]} wins!!");

    }

    if((game[0][2] == game[1][2] && game[0][2] == game[2][2] && game[2][2] != 0) ||
       (game[2][0] == game[2][1] && game[2][0] == game[2][2] && game[2][2] != 0)) {

      print("player ${game[2][2]} wins!!");
    }

  } catch(e) {
    print("an error happened...");

  }
}