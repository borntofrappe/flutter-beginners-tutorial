import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'isDayTime': result['isDayTime'],
                          'time': result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    label: Text(
                        'Change location',
                        style: TextStyle(
                            fontSize: 16.0,
                            letterSpacing: 1.0,
                            color: Colors.grey[200]
                        )
                    ),
                    icon: Icon(
                      Icons.add_location_outlined,
                      color: Colors.grey[100],
                      size: 28.0
                    ),
                ),
                SizedBox(height: 24.0),
                Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 32.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[100]
                    )
                ),
                SizedBox(height: 8.0),
                Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 48.0,
                        letterSpacing: 2.0,
                        color: Colors.grey[100]
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}