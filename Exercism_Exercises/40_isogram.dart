class Isogram {
  bool isIsogram(String word) {
    Map freq = {};

    word = word.toLowerCase();

    word = word.replaceAll(" ", "");
    word = word.replaceAll("-", "");

    word.split("").forEach((String letter) {

      if(freq[letter] == null) {
        freq[letter] = 1;
      } else {
        freq[letter] += 1;

      }

    });


    for (var val in freq.values) {
      if(val != 1) {
        return false;
      }
    }

    return true;
  }
}
