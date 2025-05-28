String removeAt(String str, int index) {
  if (index < 0 || index >= str.length) return str; // safety check
  return str.substring(0, index) + str.substring(index + 1);
}

class WordCount {

  Map countWords(String sentence) {
    Map count = {};

    sentence = sentence.replaceAll("!", " ");
    sentence = sentence.replaceAll('"', ' ');
    sentence = sentence.replaceAll(",", " ");
    sentence = sentence.replaceAll(".", " ");
    sentence = sentence.replaceAll(":", " ");
    sentence = sentence.replaceAll(";", " ");
    sentence = sentence.replaceAll("&", " ");
    sentence = sentence.replaceAll("|", " ");
    sentence = sentence.replaceAll("@", " ");
    sentence = sentence.replaceAll("#", " ");
    sentence = sentence.replaceAll("^", " ");
    sentence = sentence.replaceAll("\$", " ");
    sentence = sentence.replaceAll("%", " ");
    sentence = sentence.replaceAll("\n", " ");
    
    // sentence = sentence.replaceAll("'", "");

    List<String> splitted = sentence.split(" ");

    for(int i = 0; i < splitted.length; i++) {

      String word = splitted[i];

      if(word == "" || word == " ") {
        continue;
      }

      for (int j = 0; j < word.length; j++) {
        
        if(word[j] == "'" && (j == 0 || j == word.length-1)) {
          word = removeAt(word, j);
          continue;
        }
        String alpha = "abcdefghijklmnopqrstuvwxyz";
        if(word[j] == "'" && !alpha.contains(word[j-1]) && !alpha.contains(word[j+1])) {
          word = removeAt(word, j);
        }
      }

      splitted[i] = word;

    }

    splitted.where((String word) => (word != " " && word != "")).forEach((String word) {

      word = word.toLowerCase();

      if(count[word] == null) {
        count[word] = 1;

      } else {
        count[word] += 1;
        
      }

    });

    return count;
  }
}

void main(List<String> args) {
  
  WordCount counter = WordCount();

  print(counter.countWords("""car: carpet as java': javascript!!&@\$%^&'"""));
}