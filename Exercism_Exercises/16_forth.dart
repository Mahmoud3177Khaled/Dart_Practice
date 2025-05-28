class Forth {

  List<int> stack = [];
  Map user_defined_cmds = {};

  List<int> evaluate(String command) {

    List<String> cmd_list = command.toLowerCase().split(" ");
    // print(cmd_list);

    for (int i = 0; i < cmd_list.length; i++) {
      if(cmd_list[i] == ":") {

        if(int.tryParse(cmd_list[i+1]) != null) {
          throw Exception("Invalid definition");
        }

        String definition = "";

        int j = i+2;
        while(cmd_list[j] != ";") {
          definition += cmd_list[j] + " ";
          j++;

        }
        definition = definition.trim();
        
        List<String> def_list = definition.split(" ");
        List<String> new_def_list = [];

        for (int i = 0; i < def_list.length; i++) {
          if(user_defined_cmds[def_list[i]] != null) {
            new_def_list.add(user_defined_cmds[def_list[i]]);

          } else {
            new_def_list.add(def_list[i]);
          }
        }

        definition = new_def_list.join(" ");
        
        if(user_defined_cmds[definition] != null) {
          user_defined_cmds[cmd_list[i + 1]] = user_defined_cmds[definition];

        } else {
          user_defined_cmds[cmd_list[i + 1]] = definition;

        }

        // print(user_defined_cmds);
        return stack;
      }
    }
    
    List<String> defined_cmd_list = [];

    for (int i = 0; i < cmd_list.length; i++) {

      if(user_defined_cmds[cmd_list[i]] != null) {
        defined_cmd_list.addAll(user_defined_cmds[cmd_list[i]].split(' '));

      } else {
        defined_cmd_list.add(cmd_list[i]);

      }
    }

    cmd_list = defined_cmd_list;


    // print(cmd_list);
    // print("\n");
    for (int i = 0; i < cmd_list.length; i++) {

      if(int.tryParse(cmd_list[i]) != null) {
        stack.add(int.parse(cmd_list[i]));

      } else if(cmd_list[i] == "+") {

        if(stack.length < 2) {
          throw Exception("Stack empty");
        }

        int result = stack[stack.length - 2] + stack[stack.length - 1];
        
        stack.removeLast();
        stack.removeLast();
        stack.add(result);


      } else if(cmd_list[i] == "-") {

        if(stack.length < 2) {
          throw Exception("Stack empty");
        }

        int result = stack[stack.length - 2] - stack[stack.length - 1];

        stack.removeLast();
        stack.removeLast();
        stack.add(result);


      } else if(cmd_list[i] == "*") {

        if(stack.length < 2) {
          throw Exception("Stack empty");
        }

        int result = stack[stack.length - 2] * stack[stack.length - 1];

        stack.removeLast();
        stack.removeLast();
        stack.add(result);
        

      } else if(cmd_list[i] == "/") {

        if(stack.length < 2) {
          throw Exception("Stack empty");

        } else if(stack[stack.length - 1] == 0) {
          throw Exception("Division by zero");
        }

        int result = stack[stack.length - 2] ~/ stack[stack.length - 1];

        stack.removeLast();
        stack.removeLast();
        stack.add(result);
        

      } else if(cmd_list[i].toLowerCase() == "dup") {
        
        if(stack.length < 1) {
          throw Exception("Stack empty");
        }

        stack.add(stack.last);


      } else if(cmd_list[i].toLowerCase() == "drop") {
        
        if(stack.length == 0) {
          throw Exception("Stack empty");
        }

        stack.removeLast();

      } else if(cmd_list[i].toLowerCase() == "swap") {
        
        if(stack.length < 2) {
          throw Exception("Stack empty");
        }

        int top = stack.last;
        stack.removeLast();
        int sec_top = stack.last;
        stack.removeLast();

        stack.add(top);
        stack.add(sec_top);


      } else if(cmd_list[i].toLowerCase() == "over") {
        
        if(stack.length < 2) {
          throw Exception("Stack empty");
        }

        int top = stack.last;
        stack.removeLast();
        int sec_top = stack.last;
        stack.removeLast();
        
        stack.add(sec_top);
        stack.add(top);
        stack.add(sec_top);

      } else {
        throw Exception("Unknown command");
      }



    }



    print(stack);


    return stack; 
  }
}



void main(List<String> args) {
  
  Forth forth = Forth();

  // forth.evaluate(": foo 10 ;");
  // forth.evaluate(": foo foo 1 + ;");
  // forth.evaluate(": foo 6 ;");
  // forth.evaluate("foo");
  // forth.evaluate("4 2 +");
  // forth.evaluate("4 2 -");
  // forth.evaluate("4 2 *");
  // forth.evaluate("4 2 /");
  forth.evaluate(': foo dup ;');
  forth.evaluate('1 foo Foo foo');
}