import 'dart:io';

// Title: HackMD Excercise #4

// Purpose: Create a program that asks the user for a number
// and then prints out a list of all the divisors of that number.

// Author: Mahmoud Khaled

void main() {

  try {

    stdout.write("Please enter a number: ");
    int number = int.parse(stdin.readLineSync()!);

    for (int i = 1; i <= number; i++) {
      if(number % i == 0) {
        print("$i ");
      }
      
    }

  } catch(e) {
    print("Please enter a decimal number...");

  }
}