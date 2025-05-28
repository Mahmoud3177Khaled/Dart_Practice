class CollatzConjecture {
  int steps(int num) {
    int steps = 0;

    if(num <= 0) {
      throw ArgumentError("Only positive integers are allowed");
    }

    while(num != 1) {
      if(num % 2 == 0) {
        num ~/= 2;

      } else {
        num *= 3;
        num++;

      } 

      steps++;
    }

    return steps;
  }
}

void main(List<String> args) {
  CollatzConjecture collatzConjecture = CollatzConjecture();

  print(collatzConjecture.steps(16));
}