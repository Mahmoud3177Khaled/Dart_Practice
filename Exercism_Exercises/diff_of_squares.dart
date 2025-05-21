class DifferenceOfSquares {
  int squareOfSum(int n) {
    int result = 0;

    for (int i = 0; i <= n; i++) {
      result += i;
    }

    return result*result;

  }

  int sumOfSquares(int n) {
    int result = 0;

    for (int i = 0; i <= n; i++) {
      result += i*i;
    }

    return result;

  }

  int differenceOfSquares(int n) {
    int result1 = squareOfSum(n);
    int result2 = sumOfSquares(n);

    return result1-result2;

  }
}

