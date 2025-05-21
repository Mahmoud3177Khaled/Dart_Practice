import 'dart:io';

// Title: HackMD Excercise #26

// Purpose: For this exercise, we will keep track of when our friend’s birthdays are,
// and be able to find that information based on their name.

// Create a dictionary (in your file) of names and birthdays.
// When you run your program it should ask the user to enter a name, and return the birthday of that person back to them.

// Author: Mahmoud Khaled

void main() {

    Map birthdays = {'Ali' : "03/13/2004.", 
                     'Mohamed': "10/17/2011.",
                     'Khaled': "11/22/1998.",
                     'Philo': "06/30/2000.",
                     'Ahmed': "02/29/2003.",
                     
                      };

  try {

    print(">>> Welcome to the birthday dictionary. We know the birthdays of: ");
    for(var key in birthdays.keys) {
      print(key);
    }

    stdout.writeln(">>> Who's birthday do you want to look up?");
    String friend = stdin.readLineSync()!;

    print("$friend's birthday is ${birthdays[friend]}");


  } catch(e) {
    print("Can't find file...");

  }
}