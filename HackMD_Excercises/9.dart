import 'dart:io';
import 'dart:math';

// Title: HackMD Excercise #9

// Purpose: Generate a random number between 1 and 100. Ask the user to guess the number,
// then tell them whether they guessed too low, too high, or exactly right.

// Author: Mahmoud Khaled

void main() {

  var random = Random();
  int goal = random.nextInt(100);
  int guess = 0;
  int guess_counter = 0;

  try {
    print("Guess a number from 1 to 100");

    while(guess != goal) {

      stdout.write("Your guess: ");
      guess = int.parse(stdin.readLineSync()!);

      guess_counter++;

      if(guess == goal) {
        print("Exactly right, Correct guess!!");
        print("It took you $guess_counter guesses");
        break;

      } else if(guess < goal) {
        print("too low");

      } else if(guess > goal) {
        print("too high");

      }

    }

  } catch(e) {
    print("Please enter a decimal number...");

  }
}