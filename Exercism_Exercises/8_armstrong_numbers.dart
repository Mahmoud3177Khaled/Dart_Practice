// import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String num) {
    BigInt total = BigInt.parse('0');
    // String num_in_string = num.toString();

    for(String letter in num.split('')) {
      BigInt powered = BigInt.parse('1');

      for (var i = 0; i < num.length; i++) {
        powered *= BigInt.parse(letter);
      }

      total += powered;
    }

    
    return num == total.toString() || num == 0 ? true : false;
  }
}
void main(List<String> args) {
  ArmstrongNumbers arm = ArmstrongNumbers();

  print(arm.isArmstrongNumber('186709961001538790100634132976990'));
}