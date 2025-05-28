class NthPrime {
  int prime(int n) {
    List<int> primes = [];

    if(n == 0) {
      throw ArgumentError("There is no zeroth prime");
    }

    int curr = 2;
    while(primes.length != n) {

      bool prime = true;
      for (int i = 2; i <= curr/2; i++) {
        if(curr % i == 0) {
          prime = false;
          break;
        } 

      }

      if(prime) {
        primes.add(curr);
      }

      curr++;
      
    }

    return primes.last;
  }


}

void main(List<String> args) {
  NthPrime nthPrime = NthPrime();

  print(nthPrime.prime(10001));
}
