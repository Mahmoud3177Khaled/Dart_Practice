bool isValid(String num) {

  num = num.replaceAll("-", "");
  List<String> splitted = num.split("");
  int sum = 0;

  if(splitted.length != 10) {
    return false;
  }

  for (int i = 0; i < splitted.length; i++) {
    if(splitted[i] == "X" && i == splitted.length-1) {
      sum += 10 * (10-i);
      continue;
    } 

    if("qwertyuioplkjhgfdsazcvbnm".contains(splitted[i].toLowerCase()) || (splitted[i] == "X" && i != splitted.length-1)) {
      return false;
    }

    sum += int.parse(splitted[i]) * (10-i);

  }

  if(sum % 11 == 0) {
    return true;

  } else {
    return false;

  }

}

void main(List<String> args) {
  print(isValid("3-598-21507-X"));
}