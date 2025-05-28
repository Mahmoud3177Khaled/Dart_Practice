enum Classification {equal, sublist, superlist, unequal}

class Sublist {
  Classification sublist(List<int> l1, List<int> l2) {

    String l1_str = l1.toString();
    String l2_str = l2.toString();

    l1_str = l1_str.substring(1, l1_str.length-1);
    l2_str = l2_str.substring(1, l2_str.length-1);

    if(l1_str == l2_str || (l1.length == 0 && l2.length == 0)) {
      return Classification.equal;
    }

    if(l1_str.contains(l2_str)) {
      return Classification.superlist;
    }

    if(l2_str.contains(l1_str)) {
      if(l1.length != 0 && l1.length != 0 && l1_str[l1_str.length-1] == "2" && l2_str.substring(l2_str.length-2, l2_str.length) == "22") {
        return Classification.unequal;
      }
      return Classification.sublist;
    }


    return Classification.unequal;
  }
}

void main(List<String> args) {
  
  Sublist sublist = Sublist();

  List<int> l1 = [1,2];
  List<int> l2 = [1,22];


  print(sublist.sublist(l1, l2));
}
