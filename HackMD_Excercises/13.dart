import 'dart:io';

// Title: HackMD Excercise #13

// Purpose: Write a program (function) that takes a list and returns a new list that 
// contains all the elements of the first list minus all the duplicates.

// Author: Mahmoud Khaled 

List<int> removeDuplicates(List<int> list) {

  return list.toSet().toList();

}

void main() {

  List<int> list = [];

  try {

    stdout.write("Please enter your list size: ");
    int size = int.parse(stdin.readLineSync()!);


    for (int i = 0; i < size; i++) {
      stdout.write("Please enter item #${i+1} in list: ");
      int item = int.parse(stdin.readLineSync()!);

      list.add(item);
      
    }


    print(removeDuplicates(list));

  } catch(e) {
    print("Please enter a decimal number...");

  }
}