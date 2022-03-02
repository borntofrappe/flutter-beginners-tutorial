import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
	@override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int hearts = 0;

	@override
    Widget build(BuildContext context) {
		return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Mascot Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
              backgroundImage: AssetImage('assets/bingdwendwen.jpg'),
              radius: 56.0,
            )),
            Divider(height: 56.0, color: Colors.grey[500]),
            Text(
              'Name',
              style: TextStyle(
                color: Color.fromRGBO(245, 245, 245, 1),
                letterSpacing: 2.0,
                fontSize: 18.8
              )
            ),
            SizedBox(height: 8.0),
            Text(
              'Bing Dwen Dwen',
              style: TextStyle(
                color: Colors.amber[500],
                letterSpacing: 2.0,
                fontSize: 26.8,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 16.0),
            Text(
              'Event',
              style: TextStyle(
                color: Colors.grey[100],
                letterSpacing: 2.0,
                fontSize: 18.8
              )
            ),
            SizedBox(height: 8.0),
            Text(
              '2022 Winter Olympics',
              style: TextStyle(
                color: Colors.amber[500],
                letterSpacing: 2.0,
                fontSize: 26.0,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 32.0),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.map,
                    color: Colors.amber,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'Beijing, China',
                    style: TextStyle(
                      color: Colors.grey[300],
                      letterSpacing: 2.0,
                      fontSize: 22.0,
                    )
                  )
                ]
            ),
            Expanded(child: SizedBox()),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                    color: Colors.amber,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    '$hearts',
                    style: TextStyle(
                      color: Colors.grey[300],
                      letterSpacing: 2.0,
                      fontSize: 22.0,
                    )
                  )
                ]
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[400],
        onPressed: () {
          setState(() {
            hearts += 1;
          });
        },
        child: Icon(
          Icons.add,
          size: 28.0,
          color: Colors.grey[850]
        ),
      )
    );
	}
}
