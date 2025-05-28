enum Classification {perfect, 
                     abundant, 
                     deficient
                    }

class PerfectNumbers {
  Classification classify(int n) {

    if(n <= 0) {
      throw ArgumentError();
    }


    int sum = 0;
    int limit = (n/2.toDouble()).floor();

    for (int i = 1; i <= limit; i++) {
      if(n % i == 0) {
        sum += i;
      }

    }

    if(n == sum) {
      return Classification.perfect;

    } else if(n < sum) {
      return Classification.abundant;

    } else {
      return Classification.deficient;

    }

  }
}

void main(List<String> args) {
  PerfectNumbers numbers = PerfectNumbers();

  print(numbers.classify(2));
}