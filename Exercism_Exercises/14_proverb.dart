class Proverb {
  String recite(List<String> lst) {

    String result = "";
    for (int i = 0; i < lst.length-1; i++) {

      String verse = "For want of a ";
      verse += lst[i] + " the " + lst[i+1] + " was lost.\n";

      result += verse;

    }

    if(!lst.isEmpty) {
      result += "And all for the want of a ${lst[0]}.";

    }

    return result;
  }
}
