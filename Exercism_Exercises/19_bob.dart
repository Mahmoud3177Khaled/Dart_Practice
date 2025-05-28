bool hasNoLetters(String input) {
  return !RegExp(r'[a-zA-Z]').hasMatch(input);
}


class Bob {
  String response(String input) {

    input = input.trim();

    String og_input = input;
    if(input.trim() == "") {
      return "Fine. Be that way!";

    } 
    else if(hasNoLetters(input) && input[input.length-1] != "?") {
      return "Whatever.";

    }
    else if(hasNoLetters(input) && input[input.length-1] == "?") {
      return "Sure.";

    }
    else if(input.toUpperCase() != og_input && input[input.length-1] == "?") {
      return "Sure.";

    } 
    else if(input.toUpperCase() == og_input && input[input.length-1] != "?") {
      return "Whoa, chill out!";

    } 
    else if(input.toUpperCase() == og_input && input[input.length-1] == "?") {
      return "Calm down, I know what I'm doing!";

    } 
    else /*if(hasNoLetters(input))*/ {
      return "Whatever.";
    }
  
  }
}
