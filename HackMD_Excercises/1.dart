import 'dart:io';

// Title: HackMD Excercise #1

// Purpose: Create a program that asks the user to enter their name and their age. 
// Print out a message that tells how many years they have to be 100 years old.

// Author: Mahmoud Khaled 

void main() {
  try {

    stdout.write("Please enter your name: ");
    String name = stdin.readLineSync()!;

    stdout.write("Please enter your age: ");
    int age = int.parse(stdin.readLineSync()!);

    print("$name, You have ${100-age} years till you are 100 years old!");

  } catch(e) {
    print("Please enter your name and enter your age in numbers...");
  }
}