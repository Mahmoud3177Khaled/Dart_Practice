class SquareRoot {

  int squareRoot(double number) {
    if (number == 0 || number == 1) {
      return number.toInt();
    } 

    double guess = number / 2;
    double epsilon = 0.0001;

    while ((guess * guess - number).abs() > epsilon) {
      guess = (guess + number / guess) / 2;
    }

    return guess.toInt();
  }

}

