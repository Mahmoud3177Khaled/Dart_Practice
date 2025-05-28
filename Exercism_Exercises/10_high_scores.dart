class HighScores {
  List<int> scores = [];

  HighScores(List<int> scoresin) {
    scores = scoresin;
  }

  int latest() {
    return scores[scores.length-1];
  }

  int personalBest() {
    int max = 0;
    scores.forEach((var ele){
      ele > max ? max = ele : max = max;
    });

    return max;
  }

  List<int> personalTopThree() {
    if(scores.length <= 3) {
      List<int> temp = scores;
      temp.sort((int a, int b) => b.compareTo(a));
      return temp; 
    }

    int max = 0;
    List<int> max3 = [];
    List<int> scoresTemp = scores.toList();

    for (var i = 0; i < 3; i++) {
      max = 0;

      scoresTemp.forEach((var ele){
        ele > max ? max = ele : max = max;
      });

      max3.add(max);

      scoresTemp.remove(max);

    }

    return max3;
  }
}
