import 'dart:io';
import 'dart:math';

// Title: HackMD Excercise #15

// Purpose: Write a password generator in Dart. Be creative with how you generate passwords
// strong passwords have a mix of lowercase letters,
// uppercase letters, numbers, and symbols. The passwords should be random,
// generating a new password every time the user asks for a new password.
// Include your run-time code in a main method.

// Author: Mahmoud Khaled 

void main() {

  int start = 0;
  int end = 0;

  String password = "";
  var random = Random();


  try {
    stdout.write("Password lenght: ");
    int lenght = int.parse(stdin.readLineSync()!);

    print("How strong do you want your password to be: \n1. Strong\n2. Medium\n3. Weak\n");
    stdout.write("Choice: ");
    int strength = int.parse(stdin.readLineSync()!);

    if(strength == 1) {
      start = 48;
      end = 122;

    } else if (strength == 2) {
      start = 65;
      end = 122;
      
    } else if(strength == 3) {
      start = 65;
      end = 90;

    }

    for (int i = 0; i < lenght; i++) {
      password += String.fromCharCode(start + random.nextInt(end-start));
    }
  
  print("Your generated password is: $password");
    

  } catch(e) {
    print("please recheck your input...");

  }
}