import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: Home()
      )
  );
}

class Home extends StatelessWidget {   @override
  Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(
          title: Text('HW'),
          centerTitle: true,
          backgroundColor: Colors.green[500],
        ),
        body: Row(
          children: <Widget> [
            Expanded(
              child: Text(
                  'Hello world',
                  style: TextStyle(
                      fontSize: 16.0
                  )
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add_to_queue_rounded),
                  label: Text('Click me')
              )
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                  'Padding',
                  style: TextStyle(
                      fontSize: 20.0,
                      backgroundColor: Colors.green[100]
                  )
              )
            )
          ]
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.android),
          backgroundColor: Colors.green[500],
        )
    );
  }
}
