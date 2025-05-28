class Anagram {
  List<String> findAnagrams(String word, List<String> candidates) {
    List<String> result = [];

    Map word_signature = {};
    Map candidate_signature = {};

    word = word.toLowerCase();

    for (int i = 0; i < word.length; i++) {
      if(word_signature[word[i]] == null) {
        word_signature[word[i]] = 1;

      } else {
        word_signature[word[i]] += 1;

      }
    }

    for (String og_candidate in candidates) {
      String candidate = og_candidate.toLowerCase();

      if(word == candidate) {
        continue;
      }

      for (int i = 0; i < candidate.length; i++) {
        if(candidate_signature[candidate[i]] == null) {
          candidate_signature[candidate[i]] = 1;

        } else {
          candidate_signature[candidate[i]] += 1;

        }
      }

      bool same = true;
      if(word_signature.length == candidate_signature.length) {

        for (var key in word_signature.keys) {
          if(!candidate_signature.containsKey(key) || word_signature[key] != candidate_signature[key]) {
            same = false;
            break;
          }
        }
      } else {
        same = false;
      }

      if(same) {
        result.add(og_candidate);
      }
        candidate_signature.clear();


    }
    

    return result;
  }
}

void main(List<String> args) {
  Anagram anagram = Anagram();

  print(anagram.findAnagrams("stone", ["stone", "tones", "banana", "tons", "notes", "Seton"]));
}