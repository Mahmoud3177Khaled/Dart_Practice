import 'dart:convert';
import 'dart:io';

// Title: HackMD Excercise #28

// Purpose: In the previous exercise we saved information about famous scientists’ names and birthdays to disk.

// In this exercise, load that JSON file from disk, extract the months of all the birthdays,
// and count how many scientists have a birthday in each month.

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

    Map<String, dynamic> birthdays = {};
    Map<String, dynamic> count = {};

    List<String> months = ['January', 'February', 'March', 'April', 'May', 'June',
                           'July', 'August', 'September', 'October', 'November', 'December'];

  try {

    birthdays = jsonDecode(File("birthdays.txt").readAsStringSync());
    
    for(String entry in birthdays.values) {
      List<String> splitted = entry.split("/");

      String month = splitted[0];

      if(count[month] == null) {
        count[month] = 1;

      } else {
        count[month] += 1;

      }

    }

    for(var entry in count.entries) {
      print("${months[int.parse(entry.key)]}: ${entry.value}");
    }


  } catch(e) {
    print("Can't find file...");

  }
}