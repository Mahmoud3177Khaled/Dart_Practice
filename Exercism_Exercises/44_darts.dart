class Darts {
  int score(double x, double y) {
    if((x*x + y*y) <= 1) {
      return 10;

    } else if((x*x + y*y) <= 25) {
      return 5;

    } else if((x*x + y*y) <= 100) {
      return 1;

    } else {
      return 0;
    }
  }
}

void main(List<String> args) {
  Darts darts = Darts();

  print(darts.score(0, 10));
}