class ResistorColorTrio {
  List<String> colors = ['black', 'brown', 'red', 'orange', 'yellow', 'green', 'blue', 'violet', 'grey', 'white'];
  Map Extra = {0: " ohms",
               1: "0 ohms",
               2: "00 ohms",
               3: " kiloohms",
               4: "0 kiloohms",
               5: "00 kiloohms",
               6: " megaohms",
               7: "0 megaohms",
               8: "00 megaohms",
               9: " gigaohms"

  };

  String label(List<String> colors_input) {
    
    String sum = "";
    int counter = 0;

    bool upone = false;
    for (var element in colors_input) {

      if(counter == 2) {
        break;
      }

      if(element == "black" && counter == 1) {
        upone = true;
        break;
      }

      if(element == "black" && counter == 0) {
        continue;
      }

      sum += colors.indexOf(element).toString();
      counter++;

    }

    if(sum == "") {
      sum = "0";
    }

    int extra_index = colors.indexOf(colors_input[2]);

    if(upone && extra_index >= 1) {
      extra_index++;
    }
    
    return sum + Extra[extra_index];

  }
}
