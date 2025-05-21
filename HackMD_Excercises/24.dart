import 'dart:io';

// Title: HackMD Excercise #24

// Purpose: In the game of Hangman, a clue word is given by the program that the player has to guess, letter by letter.
// The player guesses one letter at a time until the entire word has been guessed.
// (In the actual game, the player can only guess 6 letters incorrectly before losing).

// Let’s say the word the player has to guess is EVAPORATE.
// For this exercise:

// Write the logic that asks a player to guess a letter and displays letters in the clue word that were guessed correctly.
// For now, let the player guess an infinite number of times until they get the entire word.

// As a bonus, keep track of the letters the player guessed and display a different message if the player tries to guess that letter again.

// Remember to stop the game when all the letters have been guessed correctly! Don’t worry about choosing a word randomly or keeping
// track of the number of guesses the player has remaining - we will deal with those in a future exercise.

// Author: Mahmoud Khaled 

void takeGuess(String word, String guess) {

  for (int i = 0; i < word.length; i++) {

    bool found = false;
    for (int j = 0; j < guess.length; j++) {

      if(word[i] == guess[j]) {
        stdout.write("${word[i]} ");
        found = true;
        break;
      
      }
    }

    if(!found) {
      stdout.write("_ ");

    }

  }
  
}

void main() {

  String goal = "EVAPORATE";
  String guess = "ETR";

  try {

    takeGuess(goal, guess);


  } catch(e) {
    print("Please enter a decimal number...");

  }
}