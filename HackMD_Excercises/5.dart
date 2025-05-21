import 'dart:io';

// Title: HackMD Excercise #5

// Purpose: Take two lists,and write a program that returns a list that contains only the 
// elements that are common between them (without duplicates). 
// Make sure your program works on two lists of different sizes.

// Author: Mahmoud Khaled 

List<int> commonInLists(List<int> list1, List<int> list2) {

  List<int> output_list = [];

  print("Elements that exists in both lists: ");
    for (var item in list1) {
      if(list2.contains(item)) {
        output_list.add(item);
      }
      
    }

    return output_list.toSet().toList();
}

void main() {

  List<int> list1 = [];
  List<int> list2 = [];

  try {

    stdout.write("Please enter your list1 size: ");
    int size1 = int.parse(stdin.readLineSync()!);

    stdout.write("Please enter your list2 size: ");
    int size2 = int.parse(stdin.readLineSync()!);

    for (int i = 0; i < size1; i++) {
      stdout.write("Please enter item #${i+1} in list1: ");
      int item = int.parse(stdin.readLineSync()!);

      list1.add(item);
      
    }

    for (int i = 0; i < size2; i++) {
      stdout.write("Please enter item #${i+1} in list2: ");
      int item = int.parse(stdin.readLineSync()!);

      list2.add(item);
      
    }

    print(commonInLists(list1, list2));

  } catch(e) {
    print("Please enter a decimal number...");

  }
}