import 'dart:io';

abstract class State {
  void handler(Stateful context);
  @override
  String toString();
}

class StatusOn implements State {
  handler(Stateful context) {
    context.state = StatusOff();
  }

  @override
  String toString() {
    return 'on';
  }
}

class StatusOff implements State {
  handler(Stateful context) {
    context.state = StatusOn();
  }

  @override
  String toString() {
    return 'off';
  }
}

class Stateful {
  State _state;

  Stateful(this._state);

  State get state => _state;
  set state(State newState) => _state = newState;

  void set(hours, minutes) {
    print('//---setState---//');
    String increment = stdin.readLineSync();
    String commandInc = increment.toString();
    if (commandInc == 'inc') {
      inc(hours, minutes);
    }
  }

  void inc(hours, minutes) {
    print('//---Increment State---//');
    hours = (hours+1)%24;
    print('Increment the time to : $hours : $minutes');

    String increment2 = stdin.readLineSync();
    String commandInc2 = increment2.toString();
    if (commandInc2 == 'inc') {
      inc2(hours, minutes);
    } else {
      set(hours, minutes);
    }
  }
  
  void inc2(hours, minutes){
    minutes = (minutes+1)%60;
    print('Increment the time to : $hours : $minutes');
  }
}

void main() {
  var timeState = Stateful(StatusOff());
  var hours, minutes;
  while (true) {
    print('The timeState is ${timeState.state}. Please turn on!');
    String command = stdin.readLineSync();
    List<String> commandList = command.toString().split(' ');
    if (commandList[1] != 0 && commandList[2] != 0) {
      //idle
      var hours = commandList[1];
      var minutes = commandList[2];
      var h = int.parse(hours);
      var m = int.parse(minutes);
      print('Now, The time is $hours : $minutes');
      String command = stdin.readLineSync();
      List<String> command_set_inc = command.toString().split(' ');
      //setting Hours
      if (command_set_inc[0] == 'set') {
        timeState.set(h, m);
      }
    } else if(commandList[1] == 0 && commandList[2] == 0){
      //setting Hours
      var hours = commandList[1];
      var minutes = commandList[2];
      var h = int.parse(hours);
      var m = int.parse(minutes);
      timeState.set(h, m);
    }
    else {
      print('Unknown command...');
      exit(1);
    }
  }
}