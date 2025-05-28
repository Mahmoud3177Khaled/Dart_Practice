class RnaTranscription {
  String toRna(String dna) {

    String rna = ""; 
    Map transcription = {
      "G": "C",
      "C": "G",
      "T": "A",
      "A": "U"
    };


    for (int i = 0; i < dna.length; i++) {
      rna += transcription[dna[i]];
    }
    
    return rna;

  }
}
