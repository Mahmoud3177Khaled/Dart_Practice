class SumOfMultiples {


  int sum(List<int> items, int level) {

    int score = 0;
    List<int> all_bases = [];

    for (var item in items) {
      if(item == 0) {
        continue;
      }
      
      for (int i = item; i < level; i += item) {
        if(i <= level && !all_bases.contains(i)) {
          all_bases.add(i);
        }

      }

    }

    if(!all_bases.isEmpty) {
      score = all_bases.reduce((int a, int b) => a+b);

    }

    return score;

  }
}

void main(List<String> args) {
  SumOfMultiples sumOfMultiples = SumOfMultiples();

  print(sumOfMultiples.sum([3, 0], 4));
}
