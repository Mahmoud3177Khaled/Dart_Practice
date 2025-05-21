import 'dart:io';

// Title: HackMD Excercise #14

// Purpose: Write a program (using functions!) that asks the user for a long string containing multiple words.
// Print back to the user the same string, except with the words in backwards order.

// Author: Mahmoud Khaled 

String reverse(String list) {

  return list.split(" ").reversed.join(" ");

}

void main() {

  try {

    stdout.write("Please enter some text: ");
    String txt = stdin.readLineSync()!;


    print(reverse(txt));

  } catch(e) {
    print("Please enter a decimal number...");

  }
}