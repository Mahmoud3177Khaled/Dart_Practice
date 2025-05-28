class BottleSong {
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

  Map nums = { 0: "no",
               1: "One",
               2: "Two",
               3: "Three",
               4: "Four",
               5: "Five",
               6: "Six",
               7: "Seven",
               8: "Eight",
               9: "Nine",
               10: "Ten",
               
             };

  List<String> recite(int from, int to) {

    // int og_to = to;
    // int og_from = from;
    
    List<String> recitation = [];

    // for (int i = from; i <= to; i++) {
    while(to != 0) {

      // for (int i = from; i < 12; i++) {
       
      // }
      String bottles = "bottles";
      if(from == 1) {
        bottles = "bottle";
      }

      String bottles2 = "bottles";
      if(from - 1 == 1) {
        bottles2 = "bottle";
      }
      recitation.add("${nums[from]} green $bottles hanging on the wall,");
      recitation.add("${nums[from]} green $bottles hanging on the wall,");
      recitation.add("And if one green bottle should accidentally fall,");
      recitation.add("There'll be ${nums[from-1].toLowerCase()} green $bottles2 hanging on the wall.");
      recitation.add("");

      from--;
      to--;

    }

    recitation.removeLast();
    return recitation;
    
  }
}

void main(List<String> args) {
  BottleSong twelveDays = BottleSong();

  print(twelveDays.recite(10, 1));
}
