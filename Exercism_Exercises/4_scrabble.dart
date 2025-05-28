int score(String word) {

  word = word.toUpperCase();

  int score = 0;
  for (var i = 0; i < word.length; i++) {

    if("A, E, I, O, U, L, N, R, S, T".contains(word[i])) {
      score += 1;

    } else if("D, G".contains(word[i])) {
      score += 2;

    } else if("B, C, M, P".contains(word[i])) {
      score += 3;

    } else if("F, H, V, W, Y".contains(word[i])) {
      score += 4;

    } else if("K".contains(word[i])) {
      score += 5;

    } else if("J, X".contains(word[i])) {
      score += 8;

    } else if("Q, Z".contains(word[i])) {
      score += 10;

    }
  }

  return score;
}

void main() {

  print(score("quirky"));
  
}