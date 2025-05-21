import 'dart:io';

// Title: HackMD Excercise #7

// Purpose: Let’s say you are given a list saved in a variable,
// Write a Dart code that takes this list and makes a new list that has only the even elements of this list in it.

// Author: Mahmoud Khaled 

void main() {

  List<int> list = [];
  List<int> new_list = [];

  try {

    stdout.write("Please enter your list size: ");
    int size = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < size; i++) {
      stdout.write("Please enter item #${i+1}: ");
      int item = int.parse(stdin.readLineSync()!);

      list.add(item);
      
    }

    for(int item in list) {
      if(item % 2 == 0) {
        new_list.add(item);
      }

    }

    print("Even elements from your list: ");
    print(new_list);

  } catch(e) {
    print("Please enter a decimal number...");

  }
}