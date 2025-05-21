import 'dart:io';

// Title: HackMD Excercise #12

// Purpose: Write a program that asks the user how many Fibonnaci numbers to generate and then generates them.
// Take this opportunity to think about how you can use functions.

// Author: Mahmoud Khaled 

void FibonnaciTilln(int n) {

  int fib1 = 0;
  int fib2 = 1;

  for (var i = 0; i < n-1; i++) {
    int temp = fib1;
    fib1 = fib2;
    fib2 += temp;

    print("$fib2 "); 
  }

  
}

void main() {

  try {

    stdout.write("Please enter a number: ");
    int number = int.parse(stdin.readLineSync()!);


    FibonnaciTilln(number);

  } catch(e) {
    print("Please enter a decimal number...");

  }
}