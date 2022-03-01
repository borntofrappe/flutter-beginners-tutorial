import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
        centerTitle: true,
        backgroundColor: Colors.green[500],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(flex: 1, child: Text('It works!')),
              Expanded(
                flex: 2,
                child: TextButton.icon(
                    icon: Icon(Icons.mail),
                    label: Text('Mail me'),
                    onPressed: () {}),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Padding'),
              ),
            ],
          ),
          Image.asset('assets/rose.jpeg'),
          Text(
            'A red rose',
            style: TextStyle(
                fontSize: 28.0, letterSpacing: 2.0, fontFamily: 'Hubballi'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('Click'),
        backgroundColor: Colors.green[500],
      ),
    );
  }
}
