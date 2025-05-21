import 'dart:io';

// Title: HackMD Excercise #6

// Purpose: Ask the user for a string and print out whether this string is a palindrome or not.

// Author: Mahmoud Khaled

void main() {

  try {

    stdout.write("Please enter a string: ");
    String txt = stdin.readLineSync()!;

    for (int i = 0; i <= txt.length/2; i++) {
      if(txt[i] != txt[txt.length-1-i]) {
        print("This is not palindrome.");
        return;
      }
    }

    print("This is a palindrome.");


  } catch(e) {
    print("Please enter a decimal number...");

  }
}