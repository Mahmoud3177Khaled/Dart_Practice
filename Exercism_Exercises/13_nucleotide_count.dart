class InvalidNucleotideException implements Exception {

  InvalidNucleotideException() {
    print("Invalid DNA!");
  }

}

class NucleotideCount {
  Map count(String strand) {
    Map count_mp = {'A': 0, 'C': 0, 'G': 0, 'T': 0};

    strand.split('').forEach((String p) {

      if(count_mp[p] == null) {
        throw InvalidNucleotideException();
      }

      count_mp[p] = ++count_mp[p];
    });

    return count_mp;
  }
}
