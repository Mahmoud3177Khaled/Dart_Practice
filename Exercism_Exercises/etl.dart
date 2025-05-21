class Etl {
  Map transform(Map input) {
    Map output = Map();

    for(var entry in input.entries) {
      for(String ele in entry.value) {
        output[ele.toLowerCase()] = int.parse(entry.key);
      }
    }

    return output;
  }
}

void main() {
  Etl etl = Etl();

  print(etl.transform({
        "1": ["A", "E"],
        "2": ["D", "G"]
      }));
}