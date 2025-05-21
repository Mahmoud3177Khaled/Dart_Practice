import 'dart:io';
import 'dart:math';

// Title: HackMD Excercise #16

// Purpose: Create a program that will play the “cows and bulls” game with the user. The game works like this:

// Randomly generate a 4-digit number. Ask the user to guess a 4-digit number. 
// For every digit the user guessed correctly in the correct place, they have a “cow”.
// For every digit the user guessed correctly in the wrong place is a “bull.”

// Every time the user makes a guess, tell them how many “cows” and “bulls” they have.
// Once the user guesses the correct number, the game is over. 
// Keep track of the number of guesses the user makes throughout the game and tell the user at the end.

// Author: Mahmoud Khaled 

void main() {

  var random = Random();
  String goal = (1000 + random.nextInt(8999)).toString();
  String guess = "";
  int cows = 0;
  int guess_counter = 0;

  // print(goal);

  try {
    print("Guess a number of 4 digits");

    while(guess != goal) {

      stdout.write("Your guess: ");
      guess = stdin.readLineSync()!;

      guess_counter++;

      for (int i = 0; i < 4; i++) {
        if(guess[i] == goal[i]) {
          cows++;
        }
      }

      print("You have $cows cows and ${4-cows} bulls");

      if(cows == 4) {
        print("Correct!!");
        print("it took you $guess_counter guesses.");
        return;
      }

      cows = 0;

    }

  } catch(e) {
    print("Please enter a 4 digit number number...");

  }
}