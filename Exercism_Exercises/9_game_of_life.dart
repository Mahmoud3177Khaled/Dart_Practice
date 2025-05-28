class GameOfLife {
  List<List<int>> gen = [];

  GameOfLife(List<List<int>> gen) {
    List<int> firstrow = [];
    for (var i = 0; i < gen.length+2; i++) {
      firstrow.add(0);
    }

    this.gen.add(firstrow);

    for (var i = 0; i < gen.length; i++) {
      List<int> row = [0];
      row.addAll(gen[i]);
      row.add(0);

      this.gen.add(row);
      
    }

    this.gen.add(firstrow);

    print(this.gen);

  }

  void tick() {
    List<List<int>> nextgen = [];

    for (int i = 1; i < gen.length-1; i++) {

      List<int> nextgenRow = [];
      for (int j = 1; j < gen[i].length-1; j++) {

        // nextgenRow = [];
        int alive = 0;

        if(gen[i-1][j-1] == 1) {
          alive++;  
        }
        if(gen[i-1][j] == 1) {
          alive++;  
        }
        if(gen[i][j-1] == 1) {
          alive++;  
        }
        if(gen[i-1][j+1] == 1) {
          alive++;  
        }
        if(gen[i+1][j-1] == 1) {
          alive++;  
        }
        if(gen[i+1][j+1] == 1) {
          alive++;  
        }
        if(gen[i][j+1] == 1) {
          alive++;  
        }
        if(gen[i+1][j] == 1) {
          alive++;  
        }

        if(gen[i][j] == 1 && (alive == 2 || alive == 3) ) {
          print("added 1 as alive and alive surrounded");
          nextgenRow.add(1);

        } else if(gen[i][j] == 0 && alive == 3) {
          print("added 1 as dead but alive surrounded");
          nextgenRow.add(1);

        } else {
          nextgenRow.add(0);
        }

      }

      nextgen.add(nextgenRow);
    }

    // return nextgen;
    this.gen = nextgen;
  }

  List<List<int>> matrix() {
    return this.gen;
  }
}

void main(List<String> args) {
  GameOfLife game = GameOfLife([[0, 0, 0],
                                [0, 1, 0],
                                [0, 1, 1],]);
  game.tick();
  print("new gen: ");
  print(game.gen);
}