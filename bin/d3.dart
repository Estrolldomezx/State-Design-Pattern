import 'dart:io';

abstract class State {
  void handler(Stateful context);
  String toString();
}

class StatusOn implements State {
  handler(Stateful context) {
    print("");
    context.state = StatusOff();
  }

  @override
  String toString() {
    return "on";
  }
}

class StatusOff implements State {
  handler(Stateful context) {
    print("");
    context.state = StatusOn();
  }

  @override
  String toString() {
    return "off";
  }
}

class Stateful {
  State _state;

  Stateful(this._state);

  State get state => _state;
  set state(State newState) => _state = newState;

  void set() {
    print("  seting the Stateful...");
    _state.handler(this);
  }
}

void main() {
  // var lightSwitch = Stateful(StatusOff());
  var timeState = Stateful(StatusOff());
  while (true) {
    print("The timeState is ${timeState.state}. Please turn on!");
    String command = stdin.readLineSync();
    List<String> commandList = command.toString().split(' ');
    if (commandList[1] != 0) {
      //idle
      var hours = commandList[1];
      var minutes = commandList[2];
      print("Now, The time is ${hours} : ${minutes}");
      List<String> command_set_inc = command.toString().split(' ');
      //setting Hours
      if (command_set_inc[0] == 'set') {
        timeState.set();
      }
    } else {
      //setting Hours
    }
  }
}
