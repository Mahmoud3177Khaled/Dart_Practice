import 'dart:io';

void main() {
  Map<String, String> db = Map();

  print("\n     ====== Welcome To Our Authentication System ======");

  while(true) {

    print("""

      Please select from below:
      1. Create new account
      2. Login with an existing user
      3. Delete an acount
      4. Exit

    """);

    
    try {
      String? choice = stdin.readLineSync();

      if(choice == "1") {
        stdout.write("username: ");
        String? user = stdin.readLineSync();

        stdout.write("Password: ");
        String? password = stdin.readLineSync();

        if(user == "") {
          print("Please enter a username...");
          continue;

        } 
        if(password == "") {
          print("Please enter a password...");
          continue;  

        }

        try {
          if(db[user] == null) {
            db[user!] = password!;
            print("Account '$user' Created.");

          } else {
            print("A user with this username already exists...");

          }

        } catch (e) {
          print("invalid email or password...");
        }
        

      } else if(choice == "2") {

        int deadCounter = 0;
        while(true) {
          print("Attempts left: ${3 - deadCounter}");

          stdout.write("user: ");
          String? user = stdin.readLineSync();

          stdout.write("Password: ");
          String? password = stdin.readLineSync();

          if(user == null) {
            print("Please enter a username...");
            continue;

          } 
          if(password == "") {
            print("Please enter a password...");
            continue;  

          }

          if(db[user] == "") {
            print("No such user...");
            break;
          }

          if(db[user] == password) {
            print("✅ Login Successful! Welcome $user");
            break;

          } else {
            print("❌ Incorrect credentials. Try again.\n");
            deadCounter++;

          }

          if(deadCounter == 3) {
            print("🔒 Account locked. No attempts left.");
            return;
          }
        }


      } else if(choice == "3") {
        stdout.write("user: ");
        String? user = stdin.readLineSync();

        stdout.write("Password: ");
        String? password = stdin.readLineSync();


        if(user == "") {
          print("Please enter a username...");
          continue;

        } 
        if(password == "") {
          print("Please enter the password...");
          continue;  

        }


        if(db[user] != null) {

          if(db[user] != password) {
            print("Incorrect password...");
            continue;
          }

          String? confirmation = null;

          while (confirmation == null) {
            stdout.write("Are you sure you want tp delete your account(this action can't be reversed)? (y/n) ");
            confirmation = stdin.readLineSync();

          }

          if(confirmation == "y") {
            db.remove(user);
            print("Account '$user' deleted.");

          } else {
            print("Aborted.");
          }

        } else {
          print("No such user exists...");

        }


      } else if(choice == "4") {
        print("Thank you! :)");
        return;

      } else {
        print("Please select from 1 through 4...");
      }

    } catch (e) {
      print("An arror occured");
    }
  }
}