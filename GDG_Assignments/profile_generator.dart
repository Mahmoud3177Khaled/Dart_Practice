import 'dart:io';

void main() {
  // college: once user states his college, he can't change it... therefor... a final string will be unchangeable once set
  // and also late, cause im 100% sure it will be assigned before being used
  late final String college;

  // year will be a constant 2025... thats just today
  const int year = 2025;

  // pretty much no one changes thier name... so i made it final to be immutable once set
  // and also late, cause im 100% sure it will be assigned before being used
  late final String name;

  // IDs can take many forms, it might be at a time only numbers or another numbers with chars...
  // so we use dynamic to handle that...
  // and also late, cause im 100% sure it will be assigned before being used
  late dynamic id;

  // we let var figure out the major type, a string, a char, a num... who knows...
  // even if it were null, we just store "undeclared"
  // and late cause it 100% wont get used before being assigned too
  late var major;

  // an intermidietry input variable, to check user input before assigning it to a variable
  // needs to be dynamic, as not all inputs are the same type 
  dynamic input;

  // for the college, name, and id... since a student must have all those entered (can't just store a student
  // without a name, a college or an id)...  so if user skips input, i keep asking him for them, avoiding crashes, 
  // and ensuring they are always assigned a value before being used,
  // once so, the loops breaks and we procced to the next field
  while(true) {

    print("\nCollege: ");
    input = stdin.readLineSync();

    if(input != "") {
      college = input;
      break;
    } 
    else {
      print("Please specify your college...");
      continue;
    }

  }

  while(true) {

    print("\nName: ");
    input = stdin.readLineSync();

    if(input != "") {
      name = input;
      break;
    }
    else {
      print("Please specify your name...");
      continue;
    }

  }

  while(true) {

    print("\nID: ");
    input = stdin.readLineSync();

    if(input != "") {
      id = input;
      break;
    } 
    else {
      print("Please specify your ID...");
      continue;
    }

  }

  // A student might not be assigned in a department or a major at a moment in time
  // (like freshmen in some colleges like mine),
  // so we cant just store "undeclared" if the user skips input, meaning he doesn't belong to any yet...
  print("\nMajor: ");
  input = stdin.readLineSync();
  major = input == "" ? "Undeclared" : input;

  // after gathering all that information, and forcing the user to enter required data (all late and unnullable variables)
  // we can now print him his very own profile
  print("""

  === STUDENT PROFILE ===
  College: $college
  Year: $year
  Name: $name
  ID: $id
  Major: $major

  """);



}