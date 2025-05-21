import 'dart:io';

// Title: HackMD Excercise #16

// Purpose: Time for some fake graphics! Let’s say we want to draw game boards that look like this:

//  --- --- --- 
// |   |   |   | 
//  --- --- ---  
// |   |   |   | 
//  --- --- ---  
// |   |   |   | 
//  --- --- --- 

// This one is 3x3 (like in tic tac toe).

// Ask the user what size game board they want to draw, and draw it for them to the screen using Dart’s print statement.

// Author: Mahmoud Khaled 

void main() {

  try {

    stdout.write("Rows: ");
    int rows = int.parse(stdin.readLineSync()!);

    stdout.write("Columns: ");
    int columns = int.parse(stdin.readLineSync()!);

    for (var i = 0; i <= rows*2; i++) {

      String row = "";
      for (var j = 0; j < columns; j++) {

        if(i % 2 == 0) {
          row += " ---";
        } else {
          row += "| ${((2*i-((i-1)))/2 - 1).toInt()} ";

          if(j == columns-1) {
            row += "|";
          }

        }

      }
      print(row);
    }

  } catch(e) {
    print("Please enter a 4 digit number number...");

  }
}