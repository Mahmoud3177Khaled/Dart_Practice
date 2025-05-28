class Hamming {
  int distance(String dna1, String dna2) {
    int distance = 0;

    if(dna1.length != dna2.length) {
      throw ArgumentError("strands must be of equal length");
    }

    for (int i = 0; i < dna1.length; i++) {
      if(dna1[i] != dna2[i]) {
        distance++;
      }

    }

    return distance;
  }
}
