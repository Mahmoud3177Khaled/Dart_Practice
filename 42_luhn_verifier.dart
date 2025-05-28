class Luhn {
  bool valid(String serial) {

    serial = serial.trim().replaceAll(" ", "");

    if(serial == "" || serial.length == 1 || num.tryParse(serial) == null) {
      return false;
    }

    String verification_serial = "";
    for (int i = serial.length-2; i >= 0; i -= 2) {
      verification_serial += serial[i+1];
      if(int.parse(serial[i])*2 > 9) {
        verification_serial += (int.parse(serial[i])*2 - 9).toString();

      } else {
        verification_serial += (int.parse(serial[i])*2).toString();

      }

    }

    if(serial.length % 2 != 0) {
      verification_serial += serial[0];
    }

    int sum = 0;
    verification_serial.trim().split("").forEach((String ele) {
      sum += int.parse(ele);
    });

    if(sum % 10 == 0) {
      return true;

    } else {
      return false;

    }

    

  }
}

void main(List<String> args) {
  Luhn luhn = Luhn();

  print(luhn.valid("109"));
}