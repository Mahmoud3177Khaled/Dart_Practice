import 'dart:io';
import 'dart:math';

// Title: HackMD Excercise #8

// Purpose: Make a two-player Rock-Paper-Scissors game against computer.

// Author: Mahmoud Khaled

void main() {

  var random = Random();

  int winner = 0;
  int player_move;
  int computer_move;

  try {
    while(winner == 0) {

      print("Player 1: \n1. Rock\n2. Paper\n3. Scissors\n");
      stdout.write("choice: ");
      player_move = int.parse(stdin.readLineSync()!);

      print("Player move: ");
      if(player_move == 1) {
        print("Rock");

      } else if(player_move == 2) {
        print("Paper");

      } else if(player_move == 3) {
        print("Scissors");

      }

      computer_move = 1 + random.nextInt(3);
      print("Computer move: ");
      if(computer_move == 1) {
        print("Rock");

      } else if(computer_move == 2) {
        print("Paper");

      } else if(computer_move == 3) {
        print("Scissors");

      }

      if((player_move > computer_move && (player_move-computer_move).abs() == 1) || (player_move == 1 && computer_move == 3)) {
        winner = 1;
        break;

      } else if((computer_move > player_move && (computer_move-player_move).abs() == 1) || (computer_move == 1 && player_move == 3)) {
        winner = 2;
        break;

      }

    }
    
    if(winner == 1) {
      print("Player 1 Wins!!");
    } else {
      print("Computer Wins!");

    }

  } catch(e) {
    print("Please enter a decimal number...");

  }
}