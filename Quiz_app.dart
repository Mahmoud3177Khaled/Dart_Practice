import "dart:io";

// global repositories ------------------------------

// we follow a simple schema in out app, we keep 2 lists: 'Questions' and 'KeyAnswers', 
// to store and check answer to a specific question with its key answer, where Questions[i] has a key answer at KeyAnswers[i].
List<String> Questions = ["Q1", "Q2", "Q3"];
List<String> KeyAnswers = ["A1", "A2", "A3"];

// we will also need a way to store our app users and to differentiate who is curruntly playing the quiz,
// i chose to store them in a simple map, where each entry holds the users index (think of at as him id in the whole app) with his name as value,
// for simplicity, we only allow the user to set his name but not his id, where we assign him an id automatically based on his rank in creation .
Map<int, String> Users = {0: "Mahmoud"};

// finally, we keep a list of our users Scores, where a user at Users[i] has his more recent score at Scores[i] too.
List<int> Scores = [0];




// Quiz Editing Functions  ------------------------------------

// adding a question to db
void addQuestion({required String question, required String correctAnswer}) {

  // add the recieved question to 'Questions', and its answer directly in 'KeyAnswers'.
  Questions.add(question);
  KeyAnswers.add(correctAnswer);

  // then print a confirmation message to the user
  print("Question ${Questions.length-1}: '$question' added.");

}

// removing a question from db using its index
void removeQuestion({required int qIndex}) {
  // a try block for safety
  try {

    // get the question as the provided index (we will need later for the confirmation meassge, 
    // but by then, it would have been deleted... so we keep it in a temp variable 'name')
    String name = Questions[qIndex];

    // attempt to remove the question and its answer from 'Questions' and 'KeyAnswers' keeping our questions and answer in sync safely
    Questions.removeAt(qIndex);
    KeyAnswers.removeAt(qIndex);

    // then we print the confirmation message
    print("Question $qIndex: '$name' removed.");

  // if anything went wrong, the catch block's got us, and we just print an error to the user
  } catch(e) {
    print("No such question...");
  }
}

// get the question at index 'qIndex'
void getQuestionAt({required int qIndex}) {

  // just attempt to print the question stored at Questions[qIndex] 
  try{
    print("$qIndex: '${Questions[qIndex]}'.");

  // if user passed a question index that doesn't exists, the catch block just prints him an error saying so
  } catch (e) {
    print("No such question...");
  }
}

// replace the question at 'qIndex' by another
void changeQuestion({required int qIndex, required String newQuestion}) {
  // attempt to change the question stored at Questions[qIndex] with the 'newQuestion' provided
  try{
    Questions[qIndex] = newQuestion;

  // if no question exists at the passed qIndex, catch prints and error saying so
  } catch (e) {
    print("No such question...");

  }
}


// replace correct answer of the question at 'qIndex' by another
void changeAnswer({required int qIndex, required String newAnswer}) {
  // just as the question, we try to change the answer stored at KeyAnswers[qIndex] with the newAnswer provided
  try{
    KeyAnswers[qIndex] = newAnswer;

  } catch (e) {
    print("No such question...");
  }
}

// prints all questions in the currunt quiz cleanly
void printAllQuestions() {

  // ok, for this to work, we use need to print both the questions index togther with its contents, so to use a forEach loop, we first
  // call asMap on out list, to turn it into a map keyed with the index and valued with the question, then we simply tell the for each to 
  // print the question's index, answer, and the question itself
  Questions.asMap().forEach((index, question) {
    print("$index: $question -> ${KeyAnswers[index]}");
  });
} 


// play Quiz Functions ----------------------------------

// checks if entered answer matches the correct one or not
void evaluateAnswer({required int qIndex, required String userAnswer, required int userIndex}) {
  try {

    // we compair if the answer (of the question at qIndex) stored at KeyAnswers[qIndex] matches the user's answer provided
    // if so, increase that user's score by 1 and congratulate him immediately
    if(KeyAnswers[qIndex] == userAnswer) {
      Scores[userIndex]++;

      print("Correct Answer!! ✅\n");

    // if not, we just print 'incorrect answer'
    } else {
      print("Wrong answer! ❌\n");
    }

  // if somehow the user got to answer a question that doesnt exist for whatever reason... a catch prints him an error says so
  } catch(e) {
    print("No such user/question...");

  }
}

// prints the user's final quiz score after finishing or quiting
void printUserScore({required int userIndex}) {

  // we tell the user at the end of the quiz by his name that he answered x questions right out of the whole quiz size 
  print("Well done, '${Users[userIndex]}'!   You got: ${Scores[userIndex]} out of ${Questions.length}!");}




// User Editing Functions ----------------------------------

// add a new playable user to be chosen
void createNewUser({required String userName}) {

  // we attempt to add a new user in 'Users' and initialize him a score of zero in 'Scores'
  try {

    // to add in 'Users', knowing is is a map, we add it the username provided at the length of our currect Users lenght,
    // so it is always added with an incrementing index/id for each new user
    Users[Users.length] = userName;
    Scores.add(0);

    // and print a confirmation message
    print("Created new user: '$userName'");

  // if anything unexpected happens, a catch block prints an error 
  } catch(e) {
    print("Can't create user");

  }
}

// remove an existing user at index 'qIndex'
void removeUser({required int userIndex}) {

  // we attempt to remove the user stored in Users at the provided index
  try {

    // we keep a copy of the his name (will be need later after deletion in the confirmation message)
    String name = Users[userIndex]!;
    Users.remove(userIndex);

    // and print a confirmation message
    print("user '$name' removed.");

  // again,  if anything unexpected happens, a catch block prints an error 
  } catch(e) {
    print("No such user...");
  }
}

// print all available users to choose from
void printAllusers() {

  // to print every user alongside his index, we use forEach loop to loop thorugh ous 'Users' map, print each key-value pair
  Users.forEach((index, username) {
    print("$index: $username");
  });
}

// print all available users with thier final attempt score
void getAllUsersWithScores() {

  // just like printAllusers(), but we also need to print data from another list at each iteration, so we use a traditional for loop on
  // 'Users' and 'Scores', printing each time the user stored at Users[i] togther with his score stored at Scores[i] too
  for(int i = 0; i < Users.length; i++) {
    print("$i. '${Users[i]}' score: ${Scores[i]}");
  }
}

// main quiz game loop logic
void runQuiz({required int userIndex}) {

  // first we remove any past scores for the provided user curruntly palying by setting Scores[userIndex] to zero before beginning
  Scores[userIndex] = 0;

  // print a message confirming the quiz has begun, and how many questions the quiz holds
  print(
"""

    === Welcome '${Users[userIndex]}'! ====
lets start the quiz! (type exit to finish quiz early)   -${Questions.length} Questions
"""
  );

  // then we loop on each question we have at store in 'Questions' 
  for(int i = 0; i < Questions.length; i++) {

    // print the question togther with its index to the user to answer, and know where he curruntly is in the quiz
    print("Q$i: '${Questions[i]}'");
    
    // declare a variable to take the user input of each question in
    String userAnswer = "";

    // here, we can't let the user enter an empty answer for a question, so we keep asking again and again in a loop until her enters an answer
    while(true) {

      // prompt user for his answer to the currunt question
      stdout.write("Your answer: ");
      userAnswer = stdin.readLineSync()!;

      // and if the answer he provided was empty, we tell him he must provide one, and aske him again via the small loop we we made
      if(userAnswer == "") {
        print("please provide an answer...");
        continue;

      // if he did provide an answer after some persuasion... we can proceed as if nothing happened via breaking the small infinit loop
      } else {
        break;
      }

    }

    // we allow the user at any time to type 'exit' instead of an answer to finish the quiz prematurely
    if(userAnswer == "exit") {
      break;
    }

    // then, we pass the question curruntly being answered, the user answer, and the user index himself
    // to evaluateAnswer(), which will check his answer with the key answer of the question at Questions[i], 
    // and incement the user's score of Users[userIndex] stored in Scores[i].
    evaluateAnswer(qIndex: i, userAnswer: userAnswer, userIndex: userIndex);
  }

  // finally after finsihing the quiz, we tell the user how many questions he got right by calling printUserScore() and providing it with his index 
  printUserScore(userIndex: userIndex);
}





void main() {

  // infinit loop until user selects 0. Exit to quit the app
  while(true) {

    // print main menu
    print("""

    ==== Welcome to Our Quiz Game! ==== 
Please select mode: 
1. Edit Quiz
2. Play quiz
3. Edit users
0. Exit
    """); 

    // get user choice as input
    stdout.write("Your choice: ");
    String choice = stdin.readLineSync()!;

    // check for empty input or out of menu inputs, and printing a response message accordingly
    if(choice == "" || (choice != "1" && choice != "2" && choice != "3" && choice != "0")) {
      print("Please select from the menu above...");
      continue;
    }

    // if user chose to edit the quiz
    if(choice == "1") {

      // infinite loop to let the user manipulate the quiz freely, and only exit when he chooses so by selecting 0 also
      while(true) {

        // print quiz editing manu
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

        // take user choice as input
        stdout.write("Your choice: ");
        String? quizEditorChoice = stdin.readLineSync();

        // check for empty input or out of menu inputs, and printing a response message accordingly
        if(choice == "" || (choice != "1" && choice != "2" &&  choice != "3" && choice != "4" && choice != "5" && choice != "6" && choice != "0")) {
          print("Please select from the menu above...");
          continue;
        }

        // now we handle user requests, wrapped in a try catch for exception handling to make the program
        // more reliable (avoid crashing) in case of incorrect input
        try {

          // if user chose to add a question
          if(quizEditorChoice == "1") {

            // asking the user for the question along with its answer
            stdout.write("Enter your question: ");
            String questionInput = stdin.readLineSync()!;
            stdout.write("Enter its correct answer: ");
            String correctAnswerInput = stdin.readLineSync()!;

            // handeling empty input cases
            if(questionInput == "" || correctAnswerInput == "") {
              print("No empty inputs allowed...");
              continue;
            }

            // and call addQuestion passing it a question with its answer to add the question to the global list
            addQuestion(question: questionInput, correctAnswer: correctAnswerInput);

          // ifuser chose to remove a Question
          } else if(quizEditorChoice == "2") {

            // taking user input (index of the question to delete)
            stdout.write("Question index to delete: ");
            int qIndexInput = int.parse(stdin.readLineSync()!);

            // handeling empty input cases
            if(qIndexInput == "") {
              print("No empty inputs allowed...");
              continue;
            }
            
            // then pass the question indexto removeQuestion to e checked and deleted if it exists
            removeQuestion(qIndex: qIndexInput);

          // if user chose to view a question at a certian index
          } else if(quizEditorChoice == "3") {

            // we take that index from the user, as input ofc as usual
            stdout.write("Question index to view: ");
            int qIndexInput = int.parse(stdin.readLineSync()!);

            // also handele empty input cases
            if(qIndexInput == "") {
              print("No empty inputs allowed...");
              continue;
            }

            // then call getQuestionAt() and pass it the indexto be checked and prints the name and score of a question if it exists.
            getQuestionAt(qIndex: qIndexInput);

          // if user chose to change a certain question 
          } else if(quizEditorChoice == "4") {

            // we prompt the user to input the question index he wishes to change, along with the new question he wishes to change it to
            stdout.write("Question index to change: ");
            int qIndexInput = int.parse(stdin.readLineSync()!);
            stdout.write("New question: ");
            String newQuestionInput = stdin.readLineSync()!;

            // check for empty input as usual
            if(qIndexInput == "" || newQuestionInput == "" ) {
              print("No empty inputs allowed...");
              continue;
            }

            // then call changeQuestion() and pass it the question index and the new question it is to be replaced by to be checked and saves there
            changeQuestion(qIndex: qIndexInput, newQuestion: newQuestionInput);
            
          // if user to change a certian question's answer
          } else if(quizEditorChoice == "5") {

            // prompt the user to input the index of the question he wishes to change its answer, along with the new answer
            stdout.write("Question index to change: ");
            int qIndexInput = int.parse(stdin.readLineSync()!);
            stdout.write("New Answer: ");
            String newAnswerInput = stdin.readLineSync()!;

            // check for empty input
            if(qIndexInput == "" || newAnswerInput == "" ) {
              print("No empty inputs allowed...");
              continue;
            }

            // then we pass them to changeAnswer() to check if that question exists, nad saves that new answer for that question if so
            changeAnswer(qIndex: qIndexInput, newAnswer: newAnswerInput);

          // if user chose to just print out all stored questions
          } else if(quizEditorChoice == "6") {

            // we just call printAllQuestions which iterates through them all and prints them cleanly
            print("All questions: ");
            printAllQuestions();

          // if user chose to exit the quiz editing menu:
          } else if(quizEditorChoice == "0") {
            
            // we break the smaller infinit loop we are in, to return to the bigger one outside (main menu), which prompts the 
            // user on which mode he would like to use next
            break;

          } 

        // if user input any problematic values, the catch keeps us safe from crashing on unforeseen inputs
        } catch(e) {
          print("invalid input...");
        }
      }


    // if user chose to play the quiz
    } else if(choice == "2") {
      
      // ask the user which user we would like to play as
      print(
        """

    ==== Quiz started ====
Who's playing?
        """
      );


      try{

        // infinit loop for taking input in the 'play quiz' section until user chooses 'back'
        while(true) {

          // printing all users the first thing, to help the user select which user he would like to play as 
          print("All users: ");
          printAllusers();

          // prompt user for a user index to play as (after printing them all with there indeces, it will be easier to just pick by index)
          stdout.write("Please select a user by index: ");
          int userIndexInput = int.parse(stdin.readLineSync()!);

          // check for empty inputs
          if(userIndexInput == "") {
            print("Please select user...");
            continue;

          }

          // check if user chose a valid user index from the ones he was shown, if not, inform him so, and return to main menu via 'break'
          if(Users[userIndexInput] == null) {
            print("No such user...");
            break;
          }

          // else, if everything is ok, we can finally initiate a quiz with the user index specified, and save him his own score afterwards
          runQuiz(userIndex: userIndexInput);

          // then, when quiz is done, we head back to main menu
          break;

        }
      } catch(e) {
        print("No empty inputs allowed...");
      }

    // if user chose to edit app users
    } else if (choice == "3") {

      // start a smaller infinit loop to handle user requests in the 'editing users' menu until he choses to go back to main menu
      while(true) {

        // print the 'Editing users' menu
        print(
          """

    ==== Editing users ====
1. Create new user
2. Delete user
3. print all users
0. <- Back
          """
        );


        String userEditorChoice = "";

        // take user input how he wishes to continue
        print("Your choice: ");
        userEditorChoice = stdin.readLineSync()!;

        // check for empty inputs (again and again and again!)
        if(userEditorChoice == "" || (userEditorChoice != "1" && userEditorChoice != "2" &&  userEditorChoice != "3" && userEditorChoice != "0")) {
          print("Please select from the menu above...");
          continue;
        }

        // wrap our calls logic in a try block, to avoid any crashs or unexpected behavior in case user decided to get creative... 
        try {

          // if user chose to create a new user
          if(userEditorChoice == "1") {

            // prompt him with the username he would like to add
            stdout.write("New username: ");
            String userName = stdin.readLineSync()!;

            // make sure he entered a value before proceeding wiht the call 
            if(userName == "") {
              print("Please provide a username...");
              continue;
            }

            // then we call createNewUser() and pass it the new username to be created and save in out 'Users' global list 
            createNewUser(userName: userName);

          // if user chose to remove a certian user
          } else if(userEditorChoice == "2") {

            // we first show him all currunt users, so he can pick on by index (easier for him than typing the user name, 
            // and safer and more efficient for me than searing with a name)
            print("All users: ");
            printAllusers();

            // take user input; user he wishes to obliterate
            stdout.write("user index to delete: ");
            int userIndex = int.parse(stdin.readLineSync()!);

            // make sure user didnt leave the prompt empty
            if(userIndex == "") {
              print("Please provide a user name...");
              continue;
            }

            // then, we call removeUser() and pass it that unlucky user index, to be checked if such user exists or not, and delete if so
            removeUser(userIndex: userIndex);

          // if user chose to just print all users
          } else if(userEditorChoice == "3") {

            // we do print him all users, but a little different than just printUsers(), we print them alongside 
            // thier Scores using getAllUsersWithScores() so we don't have any hidden or inaccessible data
            print("All users: ");
            getAllUsersWithScores();

          // if user chose to go back
          } else if(userEditorChoice == "0") {

            // we break from the 'editing user' menu, sending him back to the main menu 
            break;

          }

        // again, we print a simple error message to user in case anything went wrong throughout his usage
        } catch(e) {
          print("invalid input...");

        }
      }

    // in the main menu, if user chose to exit
    } else if(choice == "0") {

      // we greet him, and break from the main menu infinit loop, thus terminaitng the session
      print("Thank you & Good bye! :)");
      break;

      // And many thanks for the amazing soul reviewing my code! :)

    }

   }


}