class EggCounter {
  int count(int dec) {
    String binaryString = dec.toRadixString(2);
    int ones_count = 0;

    for (int i = 0; i < binaryString.length; i++) {
      if(binaryString[i] == "1") {
        ones_count++;
      }

    }

    return ones_count;
    
  }
}
