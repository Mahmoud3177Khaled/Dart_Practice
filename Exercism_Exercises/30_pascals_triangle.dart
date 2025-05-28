class PascalsTriangle {

  List<List<int>> rows(int row_num) {
    List<int> curr_row = [1];
    List<int> new_row = [];
    List<List<int>> pascals_triangle = [];

    // row_num--;
    for (int row = 0; row < row_num; row++) {
      
      for(int i = 1; i <= row; i++) {

        for (int j = 1; j <= i; j++) {

          if(j == 1) {
            new_row.add(1);
          }

          if(j == i) {
            new_row.add(curr_row[j-1]);

          } else {
            new_row.add(curr_row[j-1] + curr_row[j]);

          }

        }

        curr_row = new_row.toList();
        new_row.clear();

      }

      pascals_triangle.add(curr_row);
    }

    return pascals_triangle;
  }
}

void main(List<String> args) {
  PascalsTriangle pascalsTriangle = PascalsTriangle();

  print(pascalsTriangle.rows(5));
}
// 1
// 1 1
// 1 2 1
// 1 3 3 1
// 1 4 6 4 1
