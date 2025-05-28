class Acronym {
  String abbreviate(String sentence) {
    
    String symbols = "-=+,./;[]{}(!@#\$\\%^&*)_";
    symbols.split("").forEach((String symbol) {
      sentence =sentence.replaceAll(symbol, " ");
    });

    List<String> splitted = sentence.split(" ");
    String result = "";

    for (String word in splitted) {
      if(word == "" || word == " ") {
        continue;
      }
      result += word[0].toUpperCase();
    }

    return result;


  }
}

void main(List<String> args) {
  Acronym acronym = Acronym();

  print(acronym.abbreviate("Complementary metal-oxide semiconductor"));
}