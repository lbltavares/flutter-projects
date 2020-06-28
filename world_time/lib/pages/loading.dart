import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  String time = 'loading';
  Animation _animation;
  AnimationController _controller;

  void setupWorldTime() async {
    WorldTimeService wt = WorldTimeService(
      location: 'Berlin',
      flag: 'germany.png',
      url: 'Europe/Berlin',
    );
    await wt.getTime();
    // Delay proposital para mostrar a animação:
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDayTime': wt.isDaytime,
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: SpinKitCubeGrid(
              color: Colors.white,
              size: 100,
            ),
          ),
        ),
      ),
    );
  }
}
