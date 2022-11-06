import 'package:flutter/material.dart';
import 'package:learn_flutter_timer/presentation/journey/timer/timer_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: SafeArea(
          child: TimerScreen(),
        ),
      );
}
