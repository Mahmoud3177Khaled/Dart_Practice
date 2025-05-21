import 'dart:convert';
import 'dart:io';

// Title: HackMD Excercise #27

// Purpose: In the previous exercise we created a dictionary of famous scientists’ birthdays.

// In this exercise, modify your program from Part 1 to load the birthday dictionary from a JSON file on disk,
// rather than having the dictionary defined in the program.

// Author: Mahmoud Khaled

Map addNewEntry(Map birthdays) {

  stdout.writeln(">>> Name? ");
  String name = stdin.readLineSync()!;

  stdout.writeln(">>> birthday? ");
  String birthday = stdin.readLineSync()!;

  birthdays = jsonDecode(File("birthdays.txt").readAsStringSync());

  birthdays[name] = birthday;

  final jsonBirthdays = jsonEncode(birthdays);
  File("Birthdays.txt").writeAsStringSync(jsonBirthdays);

  return birthdays;

}


void main() {

    Map birthdays = {};

  try {

    // final jsonBirthdays = jsonEncode(birthdays);
    // File("Birthdays.txt").writeAsStringSync(jsonBirthdays);

    birthdays = jsonDecode(File("birthdays.txt").readAsStringSync());
    while(true) {

      print(">>> Welcome to the birthday dictionary. We know the birthdays of: ");
      for(var key in birthdays.keys) {
        print(key);
      }

      stdout.writeln(">>> Who's birthday do you want to look up? (press 0 to exit or 1 to add a new birthday)");
      String friend = stdin.readLineSync()!;

      if(friend == "0") {
        print("Thank you! :)");
        break;

      }

      if(friend == "1") {
        birthdays = addNewEntry(birthdays);
        print("Added!\n");
        continue;

      }

      if(birthdays[friend] == null) {
        print("we don't have that birthday sir...\n");

      } else {
        print("$friend's birthday is ${birthdays[friend]}\n");

      }

    }



  } catch(e) {
    print("Can't find file...");

  }
}