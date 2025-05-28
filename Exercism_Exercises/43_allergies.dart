import 'dart:math';

class Allergies {

  List<String> allergies = ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"];

  bool allergicTo(String item, int score) {

    List<String> test_list = [];
    List<String> test_allergies = allergies.reversed.toList();

    String bin = score.toRadixString(2);
    bin = bin.padLeft(8);

    for (int i = 0; i < bin.length; i++) {
      if(bin[i] == "1") {
        test_list.add(test_allergies[i]);
      }
    }

    // print(test_list);

    if(test_list.contains(item)) {
      return true;

    } else {
      return false;

    }

  }

  List<String> list(int score) {
    List<String> result = [];

    int dec = 20;
    while(score > 255) {
      if(pow(2, dec) <= score) {
        score -= pow(2, dec).toInt();
      }
      dec--;
    }

    int test_item = 7;
    while(score > 0) {

      if(pow(2, test_item) <= score) {
        score -= pow(2, test_item).toInt();
        result.add(allergies[test_item]);
        
      }

      test_item--;

    }


    return result.reversed.toList();
  }
}


void main(List<String> args) {
  Allergies allergies =  Allergies();

  print(allergies.allergicTo("cats", 255));
  print(allergies.list(257));
}