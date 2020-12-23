import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String name = "usuario";
  double prograssValue = 0.0;
  bool swithValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hola David"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(name, style: TextStyle(fontSize: 30)),
            LinearProgressIndicator(
              value: prograssValue,
            ),
            Switch(
              value: swithValue,
              onChanged: (value) {
                setState(() {
                  this.swithValue = value;
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          changesName();
        },
      ),
    );
  }

  void changesName() {
    print(name);
    setState(() {
      if (name == "usuario") {
        name = "Chavez";
      } else {
        name = "usuario";
      }
      prograssValue += 0.01;
    });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (value) {
      changesName();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
