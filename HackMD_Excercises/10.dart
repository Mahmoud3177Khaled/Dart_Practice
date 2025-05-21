import 'dart:io';
import 'dart:math';

// Title: HackMD Excercise #10

// Purpose: Ask the user for a number and determine whether the number is prime or not.

// Author: Mahmoud Khaled 

void main() {


  try {

    stdout.write("Please enter a number: ");
    int number = int.parse(stdin.readLineSync()!);

    for (int i = 2; i <= sqrt(number).ceil(); i++) {
      if(number % i == 0) {
        print("$number is not prime...");
        return;
      }
      
    }

    

    print("$number is prime!");

  } catch(e) {
    print("Please enter a decimal number...");

  }
}