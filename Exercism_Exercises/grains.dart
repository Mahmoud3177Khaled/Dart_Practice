class ArgumentError implements Exception {

  final String message = "square must be between 1 and 64";

  ArgumentError() {
    print("square must be between 1 and 64");
  }
}

BigInt square(final int n) {
  BigInt val = BigInt.one;

  if(n < 1 || n > 64) {
    throw ArgumentError();
  }

  for (int i = 0; i < n-1; i++) {
    val = BigInt.from((val+val).toInt());
  }

  if(n == 64) {
    val = val + BigInt.one;
  }

  return val;  
}

BigInt total() {
  BigInt total = BigInt.zero;

  for (int i = 1; i <= 64; i++) {
    total += square(i);
  }


  return total;  
  
}


void main(List<String> args) {
  print(square(-1));
  print(total());
}