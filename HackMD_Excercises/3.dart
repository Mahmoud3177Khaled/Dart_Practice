import 'dart:io';

// Title: HackMD Excercise #3

// Purpose: Take a list, and write a program that prints
// out all the elements of the list that are less than 5.

// Author: Mahmoud Khaled 

void main() {

  List<int> list = [];

  try {

    stdout.write("Please enter your list size: ");
    int size = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < size; i++) {
      stdout.write("Please enter item #${i+1}: ");
      int item = int.parse(stdin.readLineSync()!);

      list.add(item);
      
    }

    print("Elements in your list that are less than 5");
    for (var item in list) {
      if(item < 5) {
        print("$item ");
      }
      
    }

  } catch(e) {
    print("Please enter a decimal number...");

  }
}