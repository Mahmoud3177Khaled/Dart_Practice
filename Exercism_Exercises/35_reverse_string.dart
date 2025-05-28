String reverse(String str) {
  String rev_str = "";
  
  for (int i = str.length-1; i >= 0; i--) {
    rev_str += str[i];
  }

  return rev_str;
}
