import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class alarm extends StatefulWidget {
  @override
  State<alarm> createState() => _alarm();
}

class _alarm extends State<alarm> {
  static const int water = 7200;
  static const int between = 14400;
  static const int after = 50400;
  int watersec = 7200;
  int betweensec = 14400;
  int aftersec = 50400;
  bool _wisRunning = false;
  bool _bisRunning = false;
  bool _aisRunning = false;
  late Timer wtimer;
  late Timer btimer;
  late Timer atimer;
  Duration wselected = Duration(hours: 2, minutes: 0, seconds: 0);
  Duration bselected = Duration(hours: 4, minutes: 0, seconds: 0);
  Duration aselected = Duration(hours: 14, minutes: 0, seconds: 0);

  void _wshowTimePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: CupertinoColors.white,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                      child: Text("DONE"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              ),
              Expanded(
                child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    initialTimerDuration: wselected,
                    onTimerDurationChanged: (Duration duration) {
                      setState(() {
                        wselected = duration;
                        watersec = wselected.inSeconds;
                      });
                    }),
              )
            ]),
          );
        });
  }

  void _bshowTimePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: CupertinoColors.white,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                      child: Text("DONE"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              ),
              Expanded(
                child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    initialTimerDuration: bselected,
                    onTimerDurationChanged: (Duration duration) {
                      setState(() {
                        bselected = duration;
                        betweensec = bselected.inSeconds;
                      });
                    }),
              )
            ]),
          );
        });
  }

  void _ashowTimePicker(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            color: CupertinoColors.white,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CupertinoButton(
                      child: Text("DONE"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              ),
              Expanded(
                child: CupertinoTimerPicker(
                    mode: CupertinoTimerPickerMode.hms,
                    initialTimerDuration: aselected,
                    onTimerDurationChanged: (Duration duration) {
                      setState(() {
                        aselected = duration;
                        aftersec = aselected.inSeconds;
                      });
                    }),
              )
            ]),
          );
        });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first;
  }

  void wonStartPressed() {
    wtimer = Timer.periodic(const Duration(seconds: 1), (wtimer) {
      wonTick(wtimer);
    });
    setState(() {
      _wisRunning = true;
    });
  }

  void bonStartPressed() {
    btimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      bonTick(timer);
    });
    setState(() {
      _bisRunning = true;
    });
  }

  void aonStartPressed() {
    atimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      aonTick(timer);
    });
    setState(() {
      _aisRunning = true;
    });
  }

  void wonTick(Timer timer) {
    if (watersec == 0) {
      setState(() {
        _wisRunning = false;
        watersec = water;
      });
      timer.cancel();
    } else {
      setState(() {
        watersec = watersec - 1;
      });
    }
  }

  void bonTick(Timer timer) {
    if (betweensec == 0) {
      setState(() {
        _bisRunning = false;
        betweensec = between;
      });
      timer.cancel();
    } else {
      setState(() {
        betweensec = betweensec - 1;
      });
    }
  }

  void aonTick(Timer timer) {
    if (aftersec == 0) {
      setState(() {
        _aisRunning = false;
        aftersec = after;
      });
      timer.cancel();
    } else {
      setState(() {
        aftersec = aftersec - 1;
      });
    }
  }

  void wresetTimer() {
    wtimer.cancel();
    setState(() {
      _wisRunning = false;
      watersec = water;
    });
  }

  void bresetTimer() {
    btimer.cancel();
    setState(() {
      _bisRunning = false;
      betweensec = between;
    });
  }

  void aresetTimer() {
    atimer.cancel();
    setState(() {
      _aisRunning = false;
      aftersec = after;
    });
  }

  void wonPausePressed() {
    wtimer.cancel();
    setState(() {
      _wisRunning = false;
    });
  }

  void bonPausePressed() {
    btimer.cancel();
    setState(() {
      _bisRunning = false;
    });
  }

  void aonPausePressed() {
    atimer.cancel();
    setState(() {
      _aisRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(15)),
                  border: Border.all(
                      color: Color.fromARGB(255, 12, 161, 70), width: 4)),
              padding: EdgeInsets.all(10.0),
              child: Row(children: [
                Text(
                  "수분",
                  style: TextStyle(
                      color: Color.fromARGB(255, 12, 161, 70),
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                VerticalDivider(
                  width: 10,
                  thickness: 5,
                  color: Color.fromARGB(255, 12, 161, 70),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  format(watersec),
                  style: TextStyle(
                      color: Color.fromARGB(255, 12, 161, 70),
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(children: [
                    IconButton(
                      iconSize: 25,
                      color: Color.fromARGB(255, 12, 161, 70),
                      onPressed:
                          _wisRunning ? wonPausePressed : wonStartPressed,
                      icon: Icon(
                        _wisRunning
                            ? Icons.pause_circle_outlined
                            : Icons.play_circle_outlined,
                      ),
                    ),
                    //여기에 시간설정 기능추가 새로운 container,row로
                    Container(
                      child: Row(children: [
                        IconButton(
                          iconSize: 25,
                          onPressed: wresetTimer,
                          icon: Icon(
                            Icons.restore,
                            color: Color.fromARGB(255, 12, 161, 70),
                          ),
                        ),
                        IconButton(
                            onPressed:
                                //팝업 띄우기
                                () {
                              _wshowTimePicker(context);
                            },
                            iconSize: 25,
                            icon: Icon(
                              Icons.watch_later_outlined,
                              color: Color.fromARGB(255, 12, 161, 70),
                            ))
                      ]),
                    ),
                  ]),
                )
              ]),
            )
          ]),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(const Radius.circular(15)),
                  border: Border.all(
                      color: Color.fromARGB(255, 12, 161, 70), width: 4)),
              padding: EdgeInsets.all(10.0),
              child: Row(children: [
                Text(
                  "공복",
                  style: TextStyle(
                      color: Color.fromARGB(255, 12, 161, 70),
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                VerticalDivider(
                  width: 10,
                  thickness: 5,
                  color: Color.fromARGB(255, 12, 161, 70),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  format(betweensec),
                  style: TextStyle(
                      color: Color.fromARGB(255, 12, 161, 70),
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  child: Column(children: [
                    IconButton(
                      iconSize: 25,
                      color: Color.fromARGB(255, 12, 161, 70),
                      onPressed:
                          _bisRunning ? bonPausePressed : bonStartPressed,
                      icon: Icon(
                        _bisRunning
                            ? Icons.pause_circle_outlined
                            : Icons.play_circle_outlined,
                      ),
                    ),
                    Container(
                      child: Row(children: [
                        IconButton(
                          iconSize: 25,
                          onPressed: bresetTimer,
                          icon: Icon(
                            Icons.restore,
                            color: Color.fromARGB(255, 12, 161, 70),
                          ),
                        ),
                        IconButton(
                            onPressed:
                                //팝업 띄우기
                                () {
                              _bshowTimePicker(context);
                            },
                            iconSize: 25,
                            icon: Icon(
                              Icons.watch_later_outlined,
                              color: Color.fromARGB(255, 12, 161, 70),
                            ))
                      ]),
                    )
                  ]),
                )
              ]),
            )
          ]),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(const Radius.circular(15)),
                border: Border.all(
                    color: Color.fromARGB(255, 12, 161, 70), width: 4),
              ),
              padding: EdgeInsets.all(10.0),
              child: Row(children: [
                Text(
                  "단식",
                  style: TextStyle(
                      color: Color.fromARGB(255, 12, 161, 70),
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  format(aftersec),
                  style: TextStyle(
                      color: Color.fromARGB(255, 12, 161, 70),
                      fontSize: 40,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  width: 7,
                ),
                Container(
                  child: Column(children: [
                    IconButton(
                      iconSize: 25,
                      color: Color.fromARGB(255, 12, 161, 70),
                      onPressed:
                          _aisRunning ? aonPausePressed : aonStartPressed,
                      icon: Icon(
                        _aisRunning
                            ? Icons.pause_circle_outlined
                            : Icons.play_circle_outlined,
                      ),
                    ),
                    Container(
                      child: Row(children: [
                        IconButton(
                          iconSize: 25,
                          onPressed: aresetTimer,
                          icon: Icon(
                            Icons.restore,
                            color: Color.fromARGB(255, 12, 161, 70),
                          ),
                        ),
                        IconButton(
                            onPressed:
                                //팝업 띄우기
                                () {
                              _ashowTimePicker(context);
                            },
                            iconSize: 25,
                            icon: Icon(
                              Icons.watch_later_outlined,
                              color: Color.fromARGB(255, 12, 161, 70),
                            ))
                      ]),
                    )
                  ]),
                )
              ]),
            )
          ]),
        )
      ]),
    );
  }
}
