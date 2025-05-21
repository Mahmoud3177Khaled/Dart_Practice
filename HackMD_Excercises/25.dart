import 'dart:io';
import 'dart:math';

// Title: HackMD Excercise #25

// Purpose: In this exercise, we will finish building Hangman. In the game of Hangman,
// the player only has 6 incorrect guesses (head, body, 2 legs, and 2 arms) before they lose the game.

// In Part 1, we loaded a random word list and picked a word from it.
// In Part 2, we wrote a logic for guessing the letter and displaying that information to user.
// In this exercise, we have to put it all together and add logic for handling guesses.

// Author: Mahmoud Khaled 

String getRandomWord() {
  var random = Random();
  List<String> sowpods = File("sowpods.txt").readAsLinesSync();
    
  return sowpods[random.nextInt(sowpods.length-1)];

}
  
bool printGuess(String word, String guess) {

  bool found = false;
  for (int i = 0; i < word.length; i++) {

    found = false;
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
  print("\n");
  return found;
  
}

void main() {

  String goal = getRandomWord();
  String guess = "";

  int guess_counter = 6;

  try {

    while(true) {
      
      stdout.write("Please enter your guess letter (in uppercase): ");
      String single_guess = stdin.readLineSync()!;

      if(!guess.contains(single_guess)) {
        guess += single_guess;

      } else {
        print("letter already guessed before...");
        continue;

      }

      printGuess(goal, guess);

      if(!goal.contains(single_guess)) {
        guess_counter--;
        print("Remianing guesses: $guess_counter");

      }

      if(guess_counter == 0) {
        print("Out of guesses... :(\n it was '$goal'");
        break;
      }

      if((goal.split('')..sort()).join() == (guess.split('')..sort()).join()) {
        print("Congratulations! it is '$goal'! :D");
      }

    }

    print("Thanks for playing! :)");



  } catch(e) {
    print("Please enter a letter...");

  }
}