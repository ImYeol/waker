import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_study_app/restapi/StopWatchRestapi.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter_study_app/Models/Account.dart' as account;
import 'package:rflutter_alert/rflutter_alert.dart';

class ElapsedTime {
  final int hundreds;
  final int seconds;
  final int minutes;
  final int hours;

  ElapsedTime({
    this.hundreds,
    this.seconds,
    this.minutes,
    this.hours,
  });
}

class Dependencies {

  final List<ValueChanged<ElapsedTime>> timerListeners = <ValueChanged<ElapsedTime>>[];
  final TextStyle textStyle = const TextStyle(fontSize: 70.0, fontFamily: "Bebas Neue");
  final Stopwatch stopwatch = new Stopwatch();
  final int timerMillisecondsRefreshRate = 10;
}

class TimerPage extends StatefulWidget {
  TimerPage({Key key}) : super(key: key);

  TimerPageState createState() => new TimerPageState();
}

class TimerPageState extends State<TimerPage> {
  final Dependencies dependencies = new Dependencies();
  final StopWatchRestapi stopWatchRestapi = new StopWatchRestapi();

  int milliseconds;
  int hundreds;
  int seconds; 
  int minutes; 
  int hours;

  void leftButtonPressed() {
    setState(() {
      if (dependencies.stopwatch.isRunning) {
        print("${dependencies.stopwatch.elapsedMilliseconds}");
      } else {
        dependencies.stopwatch.reset();
      }
    });
  }

  void rightButtonPressed() {
    setState(() {
      if (dependencies.stopwatch.isRunning) {
        dependencies.stopwatch.stop();
      } else {
        dependencies.stopwatch.start();
      }
    });
  }

  Widget buildFloatingButton(String text, VoidCallback callback) {
    return new FloatingActionButton(
      child: new Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(50.0),
        ),
        child: dependencies.stopwatch.isRunning ? studyPlayIcon(Icon(Icons.stop)) : studyPlayIcon(Icon(Icons.arrow_right))
      ),
      onPressed: callback);
  }

  IconButton studyPlayIcon(Icon icon){
    return new IconButton(
      alignment: Alignment.center,
      color: Colors.white,
      iconSize: 40.0,
      icon: icon, 
      onPressed: (){
        setState(() {
          if(dependencies.stopwatch.isRunning != false){
            milliseconds = dependencies.stopwatch.elapsedMilliseconds;
            hundreds = (milliseconds / 10).truncate();
            seconds = (hundreds / 100).truncate();
            minutes = (seconds / 60).truncate();
            hours = (minutes / 60).truncate();
            // Alert(
            //   context: context,
            //   type: AlertType.success,
            //   title: "Study Time",
            //   desc: "Today Current Time : ${hours} : ${minutes} : ${seconds}",
            //   buttons: [
            //     DialogButton(
            //       child: Text(
            //         "Save",
            //         style: TextStyle(color: Colors.white, fontSize: 20),
            //       ),
            //       onPressed: (){
            //         stopWatchRestapi.studyTimeUpdate(hours, minutes, seconds).then((timerState) async{
            //           // Navigator.pushNamed(context, '/TimerPage');
            //           // Navigator.popAndPushNamed(context, '/Login');
            //           switch(timerState){
            //             case HttpStatus.ok:
            //               break;
            //             default:
            //               break;
            //           }
            //         });
            //       },
            //       width: 120,
            //     ),
            //     DialogButton(
            //       color: Colors.red,
            //       child: Text(
            //         "Cancel",
            //         style: TextStyle(color: Colors.white, fontSize: 20),
            //       ),
            //       onPressed: () => Navigator.pop(context),
            //       width: 120,
            //     )
            //   ],
            // ).show();
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: new Text("ALERT"),
                  content: new Text("Save study time?"),
                  actions: <Widget>[
                    new FlatButton(
                      child: new Text("Save"),
                      onPressed: () {
                        stopWatchRestapi.studyTimeUpdate(hours, minutes, seconds).then((timerState) async {
                          switch(timerState){
                            case HttpStatus.ok:
                              break;
                            case HttpStatus.badRequest:
                              debugPrint("[FAIL] study_time_update error");
                              break;
                            default:
                              debugPrint("[FAIL] study_time_update error");
                              break;
                          }
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                    new FlatButton(
                      child: new Text("cancel"),
                      onPressed: () {
                          Navigator.of(context).pop();
                      },
                    )
                  ],
                );
              },
            );
          }
          dependencies.stopwatch.isRunning ? dependencies.stopwatch.stop() : dependencies.stopwatch.start();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Expanded(
              flex:1,
              child: Text(""),
            ),
            new Expanded(
              flex: 1,
              child: new TimerText(dependencies: dependencies),
            ),
            new Expanded(
              flex: 2,
              child: new Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buildFloatingButton(dependencies.stopwatch.isRunning ? "stop" : "start", rightButtonPressed),
                  ],
                ),
              ),
            ),
            new Expanded(
              flex: 4,
              child: Text("DEBUG : 1-${dependencies.stopwatch.elapsedMilliseconds}"),
            )
          ],
        ),
      ),
    ); 
  }
}

class TimerText extends StatefulWidget {
  TimerText({this.dependencies});
  final Dependencies dependencies;

  TimerTextState createState() => new TimerTextState(dependencies: dependencies);
}

class TimerTextState extends State<TimerText> {
  TimerTextState({this.dependencies});
  final Dependencies dependencies;
  Timer timer;
  int milliseconds;

  @override
  void initState() {
    timer = new Timer.periodic(new Duration(milliseconds: dependencies.timerMillisecondsRefreshRate), callback);
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  void callback(Timer timer) {
    if (milliseconds != dependencies.stopwatch.elapsedMilliseconds) {
      milliseconds = dependencies.stopwatch.elapsedMilliseconds;
      final int hundreds = (milliseconds / 10).truncate();
      final int seconds = (hundreds / 100).truncate();
      final int minutes = (seconds / 60).truncate();
      final ElapsedTime elapsedTime = new ElapsedTime(
        hundreds: hundreds,
        seconds: seconds,
        minutes: minutes,
      );
      for (final listener in dependencies.timerListeners) {
        listener(elapsedTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
          new RepaintBoundary(
            child: new SizedBox(
              height: 100.0,
              child: new MinutesAndSeconds(dependencies: dependencies),
            ),
          ),
          new RepaintBoundary(
            child: new SizedBox(
              height: 100.0,
              child: new Hundreds(dependencies: dependencies),
            ),
          ),
      ],
    );
  }
}

class MinutesAndSeconds extends StatefulWidget {
  MinutesAndSeconds({this.dependencies});
  final Dependencies dependencies;

  MinutesAndSecondsState createState() => new MinutesAndSecondsState(dependencies: dependencies);
}

class MinutesAndSecondsState extends State<MinutesAndSeconds> {
  MinutesAndSecondsState({this.dependencies});
  final Dependencies dependencies;

  int minutes = 0;
  int seconds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.minutes != minutes || elapsed.seconds != seconds) {
      setState(() {
        minutes = elapsed.minutes;
        seconds = elapsed.seconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    return new Text('$minutesStr:$secondsStr.', style: dependencies.textStyle);
  }
}

class Hundreds extends StatefulWidget {
  Hundreds({this.dependencies});
  final Dependencies dependencies;

  HundredsState createState() => new HundredsState(dependencies: dependencies);
}

class HundredsState extends State<Hundreds> {
  HundredsState({this.dependencies});
  final Dependencies dependencies;

  int hundreds = 0;

  @override
  void initState() {
    dependencies.timerListeners.add(onTick);
    super.initState();
  }

  void onTick(ElapsedTime elapsed) {
    if (elapsed.hundreds != hundreds) {
      setState(() {
        hundreds = elapsed.hundreds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');
    return new Text(hundredsStr, style: dependencies.textStyle);
  }
}