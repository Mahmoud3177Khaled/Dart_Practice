class TwelveDays {
  List<String> verses = [ "twelve Drummers Drumming",
                          "eleven Pipers Piping",
                          "ten Lords-a-Leaping",
                          "nine Ladies Dancing",
                          "eight Maids-a-Milking",
                          "seven Swans-a-Swimming",
                          "six Geese-a-Laying",
                          "five Gold Rings",
                          "four Calling Birds",
                          "three French Hens",
                          "two Turtle Doves",
                          "a Partridge in a Pear Tree"

                        ];

  Map days = { 0: "first",
               1: "second",
               2: "third",
               3: "fourth",
               4: "fifth",
               5: "sixth",
               6: "seventh",
               7: "eighth",
               8: "ninth",
               9: "tenth",
               10: "eleventh",
               11: "twelfth"
               
             };

  String recite(int from, int to) {

    int og_to = to;
    int og_from = from;
    
    String recitation = "";
    from = 12-from;

    for (int c = og_from; c <= to; c++) {
      recitation += "On the ${days[11-from]} day of Christmas my true love gave to me:";

      for (int i = from; i < 12; i++) {
        if(i != from) {
          recitation += ",";
        }

        if(i == 11 && from != 11) {
          recitation += " and";
        }

        recitation += " " + verses[i];
      }
      from--;

      recitation += ".\n";

      // if(c != to-1) {
      //   recitation += "\n";
      // }

      if(og_to == og_from) {
        break;
      }
    }


    return recitation.substring(0, recitation.length-1);
    
  }
}

void main(List<String> args) {
  TwelveDays twelveDays = TwelveDays();

  print(twelveDays.recite(6, 6));
}
