import 'dart:io';

// Title: HackMD Excercise #11

// Purpose: Write a program that takes a list of numbers for example
// and makes a new list of only the first and last elements of the given list. For practice, write this code inside a function.

// Author: Mahmoud Khaled 

List<int> FirstAndLastInLists(List<int> list) {

  List<int> output_list = [list.first, list.last];

  return output_list;

  
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


    print(FirstAndLastInLists(list));

  } catch(e) {
    print("Please enter a decimal number...");

  }
}