import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> worldTimes = [
    WorldTime(location: 'Paris', flag: 'france.png', url: 'Europe/Paris'),
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Moscow', flag: 'russia.png', url: 'Europe/Moscow'),
  ];

  void updateTime(index) async {
    WorldTime worldTime = worldTimes[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      'isDayTime': worldTime.isDayTime,
      'time': worldTime.time,
      'location': worldTime.location,
      'flag': worldTime.flag,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        title: Text('Change location'),
        centerTitle: true,
        elevation: 0.0
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 8),
        child: ListView.builder(
          itemCount: worldTimes.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(worldTimes[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${worldTimes[index].flag}'),
                )
              )
            );
          },
        )
      ),
    );
  }
}