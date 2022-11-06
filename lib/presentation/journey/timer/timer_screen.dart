import 'dart:async';

import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  Timer? countdownTimer;
  Duration initDuration = const Duration(minutes: 25);
  Duration myDuration = const Duration();

  @override
  void initState() {
    myDuration = initDuration;
    super.initState();
  }

  void startTimer() {
    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
  }

  void cancelTimer() => countdownTimer!.cancel();

  void stopTimer() {
    setState(() => cancelTimer());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        cancelTimer();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = initDuration);
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes);
    final seconds = strDigits(
      myDuration.inSeconds.remainder(60),
    );

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$minutes:$seconds',
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: resetTimer,
                        child: const Text('Reset'),
                      ),
                      ElevatedButton(
                        onPressed: startTimer,
                        child: const Text('Start'),
                      ),
                      ElevatedButton(
                        onPressed: stopTimer,
                        child: const Text('Stop'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
