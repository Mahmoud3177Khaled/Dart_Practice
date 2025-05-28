class ResistorColorDuo {
  List<String> colors = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];

  int value(List<String> colors_input) {
    
    String sum = "";
    int counter = 0;
    for (var element in colors_input) {

      if(counter == 2) {
        break;
      }

      sum += colors.indexOf(element).toString();
      counter++;

    }

    return int.parse(sum);

  }
}
