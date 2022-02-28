import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupTime() async {
    await Future.delayed(Duration(seconds: 3));

    try {
      WorldTime worldTime = WorldTime(location: 'Paris', flag: 'france.png', url: 'Europe/Paris');
      await worldTime.getTime();

      Navigator.pushNamed(context, '/home', arguments: {
        'isDayTime': worldTime.isDayTime,
        'time': worldTime.time,
        'location': worldTime.location,
        'flag': worldTime.flag,
      });
    }
    catch(error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();

    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.grey[100],
          size: 48.0,
        )
      ),
    );
  }
}