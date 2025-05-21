import 'dart:io';
import 'dart:math';

// Title: HackMD Excercise #23

// Purpose: In this exercise, the task is to write a function that picks
// a random word from a list of words from the SOWPODS dictionary.

// Author: Mahmoud Khaled

void main() {

  var random = Random();

  try {

    List<String> sowpods = File("sowpods.txt").readAsLinesSync();
    
    print(sowpods[random.nextInt(sowpods.length-1)]);

  } catch(e) {
    print("Can't find file...");

  }
}