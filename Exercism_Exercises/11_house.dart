class House {

  List<String> part1 = ["lay in", 
                        "ate", 
                        "killed", 
                        "worried", 
                        "tossed", 
                        "milked", 
                        "kissed", 
                        "married", 
                        "woke", 
                        "kept", 
                        "belonged to"];

  List<String> part2 = ["house that Jack built.", 
                        "malt", 
                        "rat", 
                        "cat", 
                        "dog", 
                        "cow with the crumpled horn", 
                        "maiden all forlorn", 
                        "man all tattered and torn", 
                        "priest all shaven and shorn", 
                        "rooster that crowed in the morn", 
                        "farmer sowing his corn", 
                        "horse and the hound and the horn"];

// This is the horse and the hound and the horn
// that belonged to the farmer sowing his corn
// that kept the rooster that crowed in the morn
// that woke the priest all shaven and shorn
// that married the man all tattered and torn
// that kissed the maiden all forlorn
// that milked the cow with the crumpled horn
// that tossed the dog
// that worried the cat
// that killed the rat
// that ate the malt
// that lay in the house that Jack built.


  String recite(int from, int to) {

    int ogfrom = from;
    String rhyme = "";

    for (; from <= to; from++) {
      if(ogfrom != from) {
        rhyme += "\n";
      }

      rhyme += "This is the " + part2[from-1];

      for (int i = from-1; i > 0; i--) {
        rhyme += " that " + part1[i-1] + " the " + part2[i-1];

      }

    }

    return rhyme;
  }

}


void main(List<String> args) {
  
  House house = House();
  print(house.recite(4, 8));

}