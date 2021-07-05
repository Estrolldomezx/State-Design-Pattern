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

  void set(hours, minutes) {
    print("Set the time : //setState");
    // _state.handler(this);
    inc(hours, minutes);
  }

  void inc(hours, minutes) {
    print("Increment the time to :");
    // var new_hours = int.parse(hours);
    hours = (hours+1)%24;
    // print(new_hours);
    print(hours);
    String inc2 = stdin.readLineSync();
    String commandInc2 = inc2.toString();
    if (commandInc2 == 'inc') {
      inc2(minutes);
    } else {
    }
  }
  
  void inc2(minutes)
}

void main() {
  var timeState = Stateful(StatusOff());
  while (true) {
    print("The timeState is ${timeState.state}. Please turn on!");
    String command = stdin.readLineSync();
    List<String> commandList = command.toString().split(' ');
    if (commandList[1] != 0 && commandList[2] != 0) {
      //idle
      var hours = commandList[1];
      var minutes = commandList[2];
      var h = int.parse(hours);
      var m = int.parse(minutes);
      print("Now, The time is ${hours} : ${minutes}");
      String command = stdin.readLineSync();
      List<String> command_set_inc = command.toString().split(' ');
      //setting Hours
      if (command_set_inc[0] == 'set') {
        timeState.set(h, m);
      }
    } else {
      //setting Hours
    }
  }
}
