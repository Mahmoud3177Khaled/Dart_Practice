class SecretHandshake {
  List<String> all_actions = ["reverse", "jump", "close your eyes", "double blink", "wink"];

  List<String> commands(int num) {

    String command = num.toRadixString(2);
    List<String> actions = [];

    command = command.padLeft(5);

    for (int i = command.length-1; i >= 0 ; i--) {
      
      // if(command == "1") {
      //   return ["wink"];
      // }



      if(command[i] == "1") {
        actions.add(all_actions[i]);

      }
    }

    if(command[0] == "1") {
      actions = actions.reversed.toList();
      actions.removeAt(0);
    }
    
    return actions;
  } 
}

void main(List<String> args) {
  SecretHandshake handshake = SecretHandshake();

  print(handshake.commands(2));
}