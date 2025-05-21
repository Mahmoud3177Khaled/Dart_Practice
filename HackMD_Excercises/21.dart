import 'dart:io';
import 'dart:math';

// Title: HackMD Excercise #21

// Purpose: You, the user, will have in your head a number between 0 and 100.
// The program will guess a number, and you, the user, will say whether it is too high, too low, or your number.

// Author: Mahmoud Khaled

void main() {

  var random = Random();
  int goal = 0;
  int guess = 0;
  int guess_counter = 0;

  int start = 0;
  int end = 100;

  try {
    print("Pick a number from 1 to 100 for me to guess");
    goal = int.parse(stdin.readLineSync()!);

    while(guess != goal) {

      guess = start + random.nextInt(end-start);
      stdout.write("My guess is: $guess");

      guess_counter++;

      stdout.write("\nIs that correct? \n1. Yes \n2. Too low \n3. too high\n");
      int feedback = int.parse(stdin.readLineSync()!);

      if(feedback == 1) {
        print("Yay!! i guessed right :D");
        print("It took me $guess_counter guesses :)");
        break;

      } else if(feedback == 2) {
        print("Okay, that was low huh... what about...");
        start = guess;

      } else if(feedback == 3) {
        print("Okay, that was high huh... what about...");
        end = guess;

      }

    }

  } catch(e) {
    print("Please enter a decimal number...");

  }
}