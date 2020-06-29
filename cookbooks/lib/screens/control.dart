import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  bool ligado = false;
  bool firstTime = true;
  bool toggling = false;

  bool conn = true;

  void toggle() {
    String url = 'http://192.168.0.15/${ligado ? 'off' : 'on'}';
    setState(() {
      toggling = true;
    });
    http.get(url).then((response) {
      setState(() {
        ligado = !ligado;
        toggling = false;
      });
    });
  }

  _checkConn(timout) {
    http.get('http://192.168.0.15/status').timeout(timout).then((response) {
      setState(() {
        conn = true;
        ligado = response.body == '1' ? false : true;
      });
    }).catchError((err) => setState(() => conn = false));
  }

  @override
  void initState() {
    super.initState();
    final Duration d = Duration(seconds: 3);
    Timer.periodic(d, (timer) => _checkConn(d));
  }

  @override
  Widget build(BuildContext context) {
    if (firstTime) {
      firstTime = false;
      Map args = ModalRoute.of(context).settings.arguments;
      ligado = args['status'];
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          SpinKitRipple(
            color: conn ? Colors.green : Colors.red,
            size: 30.0,
          ),
          SizedBox(width: 20),
        ],
        backgroundColor: Colors.grey[900],
        title: Text('Smart Switch'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black, Colors.blueGrey[900]],
          ),
        ),
        child: Center(
          child: toggling
              ? SpinKitRipple(
                  color: Colors.white,
                  size: 90.0,
                )
              : FlatButton.icon(
                  label: Text(
                    ligado ? 'Ligado' : 'Desligado',
                    style: TextStyle(
                      color: ligado ? Colors.yellow[700] : Colors.grey,
                      fontSize: 26,
                    ),
                  ),
                  onPressed: toggle,
                  icon: Icon(
                    Icons.power,
                    size: 70,
                    color: ligado ? Colors.yellow[700] : Colors.grey,
                  ),
                ),
        ),
      ),
    );
  }
}
