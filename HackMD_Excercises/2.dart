import 'dart:io';

// Title: HackMD Excercise #2

// Purpose: Ask the user for a number. Depending on whether the number is even or odd,
// print out an appropriate message to the user.

// Author: Mahmoud Khaled 

void main() {
  try {

    stdout.write("Please enter a number: ");
    int number = int.parse(stdin.readLineSync()!);

    if(number % 2 == 0) {
      print("Your number is even!");

    } else {
      print("Your number is odd!");

    }

  } catch(e) {
    print("Please enter a decimal number...");

  }
}