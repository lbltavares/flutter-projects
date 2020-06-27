import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NinjaCard(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ninjaLevel++;
          });
        },
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.chat),
      ),
      appBar: AppBar(
        title: Text('Ninja ID Card'),
        leading: Icon(Icons.menu),
        actions: [
          Container(
            child: Icon(Icons.account_circle),
            padding: EdgeInsets.only(right: 20),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.grey[900], Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/chunli.png',
                    width: 200,
                  ),
                ),
                Divider(
                  height: 40.0,
                  color: Colors.grey[800],
                ),
                SizedBox(height: 30),
                Text(
                  'NAME',
                  style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
                ),
                SizedBox(height: 5),
                Text(
                  'Chun-Li',
                  style: TextStyle(
                    color: Colors.yellow,
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'LEVEL',
                  style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
                ),
                SizedBox(height: 5),
                Text(
                  '$ninjaLevel',
                  style: TextStyle(
                    color: Colors.yellow,
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.grey[400]),
                    SizedBox(width: 10),
                    Text(
                      'chun-li@ninja.com',
                      style: TextStyle(color: Colors.grey, letterSpacing: 2.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850],
        items: [
          BottomNavigationBarItem(
            title: Text('Favorite', style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.star_border, color: Colors.white),
          ),
          BottomNavigationBarItem(
            title: Text('Add Contact', style: TextStyle(color: Colors.white)),
            icon: Icon(Icons.add_call, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
