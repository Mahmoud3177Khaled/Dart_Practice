import "dart:io";

// global repositories ------------------------------

List<String> Questions = [];
List<String> KeyAnswers = [];
Map<int, String> Users = {};
List<int> scores = [];

// Editor ------------------------------------

void addQuestion({required String question, required String correctAnswer}) {
  Questions.add(question);
  KeyAnswers.add(correctAnswer);

  print("Question ${Questions.length-1}: '$question' added.");

}

void removeQuestion({required int qIndex}) {
  Questions.removeAt(qIndex);
  KeyAnswers.removeAt(qIndex);

  print("Question $qIndex: '${Questions[qIndex]}' removed.");
}

void getQuestionAt({required int qIndex}) {
  try{
    print("$qIndex: '${Questions[qIndex]}'.");

  } catch (e) {
    print("No such question in database...");
  }
}

bool changeQuestion({required int qIndex, required String newQuestion}) {
  try{
    Questions[qIndex] = newQuestion;
    return true;

  } catch (e) {
    return false;

  }
}

bool changeAnswer({required int qIndex, required String newAnswer}) {
  try{
    KeyAnswers[qIndex] = newAnswer;
    return true;

  } catch (e) {
    return false;

  }
}

void printAllQuestions() {
  Questions.asMap().forEach((index, question) {
    print("$index: $question -> ${KeyAnswers[index]}");
  });
} 


// User ----------------------------------

void evaluateAnswer({required int qIndex, required String userAnswer, required int userIndex}) {
  try {
    if(KeyAnswers[qIndex] == userAnswer) {
      scores[userIndex]++;

      print("Correct Answer!! ✅");

    } else {
      print("Wrong answer! ❌");
    }

  } catch(e) {
    print("No such user/question...");

  }
}

void printUserScore({required int userIndex}) {
  print("'${Users[userIndex]}': you got '${scores[userIndex]}' out of '${Questions.length}'");
}

// application ----------------------------------


void createNewUser({required String userName}) {
  try {
    Users[Users.length] = userName;
    scores[Users.length] = 0;
    print("Created new user: '$userName'");

  } catch(e) {
    print("Can't create user");
  }
}

void removeUser({required int userIndex}) {
  try {
    String name = Users[userIndex]!;
    Users.remove(userIndex);
    print("user '$name' removed.");
  } catch(e) {
    print("No such user...");
  }
}

void printAllusers() {
  Users.forEach((index, username) {
    print("$index: $username");
  });
}

void getAllUsersWithScores() {
  for(int i = 0; i < Users.length; i++) {
    print("$i. '${Users[i]}' score: ${scores[i]}");
  }
}

void runQuiz({required int userIndex}) {

  print(
    """
    === Welcome '${Users[userIndex]}'! =====

    lets start the quiz! (type exit to finish quiz early)
    """
  );

  for(int i = 0; i < Questions.length; i++) {
    print("Q$i: '${Questions[i]}'");
    
    String userAnswer = "";

    while(true) {

      userAnswer = stdin.readLineSync()!;

      if(userAnswer == "") {
        print("please provide an answer...");
        continue;

      } else {
        break;
      }

    }

    if(userAnswer == "exit") {
      printUserScore(userIndex: userIndex);
      break;
    }

    evaluateAnswer(qIndex: i, userAnswer: userAnswer, userIndex: userIndex);
  }
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

    String? choice = stdin.readLineSync();
    if(choice == "" || (choice != "1" && choice != "2" && choice != "0")) {
      print("Please select from the menu above...");
      continue;
    }

    if(choice == 1) {

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

        String? quizEditorChoice = stdin.readLineSync();

        if(choice == "" || (choice != "1" && choice != "2" &&  choice != "3" && choice != "4" && choice != "5" && choice != "6" && choice != "0")) {
          print("Please select from the menu above...");
          continue;
        }

        try {
          if(quizEditorChoice == "1") {
            String questionInput = stdin.readLineSync()!;
            String correctAnswerInput = stdin.readLineSync()!;

            if(questionInput == "" || correctAnswerInput == "") {
              print("No empty inputs allowed...");
              continue;
            }

            addQuestion(question: questionInput, correctAnswer: correctAnswerInput);

          } else if(quizEditorChoice == "2") {
            int qIndexInput = int.parse(stdin.readLineSync()!);

            if(qIndexInput == "") {
              print("No empty inputs allowed...");
              continue;
            }
            
            removeQuestion(qIndex: qIndexInput);

          } else if(quizEditorChoice == "3") {
            int qIndexInput = int.parse(stdin.readLineSync()!);

            if(qIndexInput == "") {
              print("No empty inputs allowed...");
              continue;
            }

            getQuestionAt(qIndex: qIndexInput);

          } else if(quizEditorChoice == "4") {
            int qIndexInput = int.parse(stdin.readLineSync()!);
            String newQuestionInput = stdin.readLineSync()!;

            if(qIndexInput == "" || newQuestionInput == "" ) {
              print("No empty inputs allowed...");
              continue;
            }

            changeQuestion(qIndex: qIndexInput, newQuestion: newQuestionInput);
            
          } else if(quizEditorChoice == "5") {
            int qIndexInput = int.parse(stdin.readLineSync()!);
            String newAnswerInput = stdin.readLineSync()!;

            if(qIndexInput == "" || newAnswerInput == "" ) {
              print("No empty inputs allowed...");
              continue;
            }

            changeAnswer(qIndex: qIndexInput, newAnswer: newAnswerInput);

          } else if(quizEditorChoice == "6") {

            printAllQuestions();

          } else if(quizEditorChoice == "0") {

            break;

          } 

        } catch(e) {
          print("invalid input...");
        }
      }

    } else if(choice == 2) {
      
      print(
        """
          ==== Quiz started ====
          Who's playing?

        """
      );

      while(true) {

        printAllusers();

        int userIndexInput = int.parse(stdin.readLineSync()!);

        if(userIndexInput == "") {
          print("Please select user...");
          continue;

        } else {

          runQuiz(userIndex: userIndexInput);

          break;

        }
      }

    } else if (choice == 3) {

      while(true) {

        print(
          """
          ==== Editing users ====
          1. Create new user
          2. Delete user
          3. print all users
          0. Exit
          """
        );

        String userEditorChoice = "";

        while(true) {
          String userEditorChoice = stdin.readLineSync()!;

          if(userEditorChoice == "" || (userEditorChoice != "1" && userEditorChoice != "2" &&  userEditorChoice != "3" && userEditorChoice != "0")) {
            print("Please select from the menu above...");
            continue;
          } else {
            break;
          }
          
        }

        try {
          if(userEditorChoice == "1") {

            String userName = stdin.readLineSync()!;

            if(userName == "") {
              print("Please provide a user name...");
              continue;
            }

            createNewUser(userName: userName);

          } else if(userEditorChoice == "2") {
            int userIndex = int.parse(stdin.readLineSync()!);

            if(userIndex == "") {
              print("Please provide a user name...");
              continue;
            }

            removeUser(userIndex: userIndex);

          } else if(userEditorChoice == "3") {

            printAllusers();

          } else if(userEditorChoice == "0") {
            break;

          }

        } catch(e) {
          print("invalid input...");
        }
      }

    } else if(choice == 0) {
      print("Thank you & Good bye! :)");
      break;
    }

   }


}