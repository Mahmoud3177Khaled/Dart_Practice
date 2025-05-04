import "dart:io";

// global repositories ------------------------------

List<String> Questions = ["Q1", "Q2", "Q3"];
List<String> KeyAnswers = ["A1", "A2", "A3"];
Map<int, String> Users = {0: "Mahmoud"};
List<int> scores = [0];

// Quiz Editing ------------------------------------

// adding a question to db
void addQuestion({required String question, required String correctAnswer}) {
  Questions.add(question);
  KeyAnswers.add(correctAnswer);

  print("Question ${Questions.length-1}: '$question' added.");

}

// removing a question from db using its index
void removeQuestion({required int qIndex}) {
  try {
    String name = Questions[qIndex];

    Questions.removeAt(qIndex);
    KeyAnswers.removeAt(qIndex);

    print("Question $qIndex: '$name' removed.");

  } catch(e) {
    print("No such question...");
  }
}

// get the question at index 'qIndex'
void getQuestionAt({required int qIndex}) {
  try{
    print("$qIndex: '${Questions[qIndex]}'.");

  } catch (e) {
    print("No such question in database...");
  }
}

// replace question at 'qIndex' by another
bool changeQuestion({required int qIndex, required String newQuestion}) {
  try{
    Questions[qIndex] = newQuestion;
    return true;

  } catch (e) {
    return false;

  }
}


// replace correct answer of question at 'qIndex' by another
bool changeAnswer({required int qIndex, required String newAnswer}) {
  try{
    KeyAnswers[qIndex] = newAnswer;
    return true;

  } catch (e) {
    return false;

  }
}

// prints all questions in the currunt quiz cleanly
void printAllQuestions() {
  Questions.asMap().forEach((index, question) {
    print("$index: $question -> ${KeyAnswers[index]}");
  });
} 


// play Quiz ----------------------------------

// checks if entered answer matches the set correct one or not
void evaluateAnswer({required int qIndex, required String userAnswer, required int userIndex}) {
  try {

    // if so, increase that user's score by 1
    if(KeyAnswers[qIndex] == userAnswer) {
      scores[userIndex]++;

      print("Correct Answer!! ✅\n");

    // if not, just print incorrect
    } else {
      print("Wrong answer! ❌\n");
    }

  } catch(e) {
    print("No such user/question...");

  }
}

// prints the user's final quiz score after finishing or quiting
void printUserScore({required int userIndex}) {
  print("Well done, '${Users[userIndex]}'!   You got: ${scores[userIndex]} out of ${Questions.length}!");}


// User editing ----------------------------------

// add a new playable user to choose
void createNewUser({required String userName}) {
  try {
    Users[Users.length] = userName;
    scores.add(0);
    print("Created new user: '$userName'");

  } catch(e) {
    print("Can't create user");

  }
}

// remove an existing user at index 'qIndex'
void removeUser({required int userIndex}) {
  try {
    String name = Users[userIndex]!;
    Users.remove(userIndex);
    print("user '$name' removed.");
  } catch(e) {
    print("No such user...");
  }
}

// print all available users to choose from
void printAllusers() {
  Users.forEach((index, username) {
    print("$index: $username");
  });
}

// print all available users with thier final attempt score
void getAllUsersWithScores() {
  for(int i = 0; i < Users.length; i++) {
    print("$i. '${Users[i]}' score: ${scores[i]}");
  }
}

// quiz game loop logic
void runQuiz({required int userIndex}) {

  scores[userIndex] = 0;

  print(
"""

    === Welcome '${Users[userIndex]}'! ====
lets start the quiz! (type exit to finish quiz early)
"""
  );

  for(int i = 0; i < Questions.length; i++) {
    print("Q$i: '${Questions[i]}'");
    
    String userAnswer = "";

    while(true) {
      stdout.write("Your answer: ");
      userAnswer = stdin.readLineSync()!;

      if(userAnswer == "") {
        print("please provide an answer...");
        continue;

      } else {
        break;
      }

    }

    if(userAnswer == "exit") {
      break;
    }

    evaluateAnswer(qIndex: i, userAnswer: userAnswer, userIndex: userIndex);
  }

  printUserScore(userIndex: userIndex);
}

void main() {

  while(true) {
    print("""

    ==== Welcome to Our Quiz Game! ==== 
Please select mode: 
1. Edit Quiz
2. Play quiz
3. Edit users
0. Exit
    """); 

    stdout.write("Your choice: ");
    String choice = stdin.readLineSync()!;

    if(choice == "" || (choice != "1" && choice != "2" && choice != "3" && choice != "0")) {
      print("Please select from the menu above...");
      continue;
    }

    if(choice == "1") {

      while(true) {

        print("""

    ==== Editing Quiz ====
1. Add question
2. Remove question
3. Get Question at [index]
4. Change question
5. Change answer
6. Print all questions
0. <- Back
        """);

        stdout.write("Your choice: ");
        String? quizEditorChoice = stdin.readLineSync();

        if(choice == "" || (choice != "1" && choice != "2" &&  choice != "3" && choice != "4" && choice != "5" && choice != "6" && choice != "0")) {
          print("Please select from the menu above...");
          continue;
        }

        try {
          if(quizEditorChoice == "1") {
            stdout.write("Enter your question: ");
            String questionInput = stdin.readLineSync()!;
            stdout.write("Enter its correct answer: ");
            String correctAnswerInput = stdin.readLineSync()!;

            if(questionInput == "" || correctAnswerInput == "") {
              print("No empty inputs allowed...");
              continue;
            }

            addQuestion(question: questionInput, correctAnswer: correctAnswerInput);

          } else if(quizEditorChoice == "2") {
            stdout.write("Question index to delete: ");
            int qIndexInput = int.parse(stdin.readLineSync()!);

            if(qIndexInput == "") {
              print("No empty inputs allowed...");
              continue;
            }
            
            removeQuestion(qIndex: qIndexInput);

          } else if(quizEditorChoice == "3") {

            stdout.write("Question index to view: ");
            int qIndexInput = int.parse(stdin.readLineSync()!);

            if(qIndexInput == "") {
              print("No empty inputs allowed...");
              continue;
            }

            getQuestionAt(qIndex: qIndexInput);

          } else if(quizEditorChoice == "4") {
            stdout.write("Question index to change: ");
            int qIndexInput = int.parse(stdin.readLineSync()!);
            stdout.write("New question: ");
            String newQuestionInput = stdin.readLineSync()!;

            if(qIndexInput == "" || newQuestionInput == "" ) {
              print("No empty inputs allowed...");
              continue;
            }

            changeQuestion(qIndex: qIndexInput, newQuestion: newQuestionInput);
            
          } else if(quizEditorChoice == "5") {
            stdout.write("Question index to change: ");
            int qIndexInput = int.parse(stdin.readLineSync()!);
            stdout.write("New Answer: ");
            String newAnswerInput = stdin.readLineSync()!;

            if(qIndexInput == "" || newAnswerInput == "" ) {
              print("No empty inputs allowed...");
              continue;
            }

            changeAnswer(qIndex: qIndexInput, newAnswer: newAnswerInput);

          } else if(quizEditorChoice == "6") {
            print("All questions: ");
            printAllQuestions();

          } else if(quizEditorChoice == "0") {

            break;

          } 

        } catch(e) {
          print("invalid input...");
        }
      }

    } else if(choice == "2") {
      
      print(
        """

    ==== Quiz started ====
Who's playing?
        """
      );

      while(true) {
        print("All users: ");
        printAllusers();

        stdout.write("Please select a user by index: ");
        int userIndexInput = int.parse(stdin.readLineSync()!);

        if(userIndexInput == "") {
          print("Please select user...");
          continue;

        } else {

          if(Users[userIndexInput] == null) {
            print("No such user...");
            break;
          }

          runQuiz(userIndex: userIndexInput);

          break;

        }
      }

    } else if (choice == "3") {

      while(true) {

        print(
          """

    ==== Editing users ====
1. Create new user
2. Delete user
3. print all users
0. Back
          """
        );

        String userEditorChoice = "";

        while(true) {
          print("Your choice: ");
          userEditorChoice = stdin.readLineSync()!;

          if(userEditorChoice == "" || (userEditorChoice != "1" && userEditorChoice != "2" &&  userEditorChoice != "3" && userEditorChoice != "0")) {
            print("Please select from the menu above...");
            continue;
          } else {
            break;
          }
          
        }

        try {
          if(userEditorChoice == "1") {
            stdout.write("New username: ");
            String userName = stdin.readLineSync()!;

            if(userName == "") {
              print("Please provide a user name...");
              continue;
            }

            createNewUser(userName: userName);

          } else if(userEditorChoice == "2") {
            print("All users: ");
            printAllusers();

            stdout.write("user index to delete: ");
            int userIndex = int.parse(stdin.readLineSync()!);

            if(userIndex == "") {
              print("Please provide a user name...");
              continue;
            }

            removeUser(userIndex: userIndex);

          } else if(userEditorChoice == "3") {
            print("All users: ");
            getAllUsersWithScores();

          } else if(userEditorChoice == "0") {
            break;

          }

        } catch(e) {
          print("invalid input...");

        }
      }

    } else if(choice == "0") {
      print("Thank you & Good bye! :)");
      break;

    } else {
      print(choice);

    }

   }


}