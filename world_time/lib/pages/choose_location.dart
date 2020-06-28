import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTimeService> locations = [
    WorldTimeService(url: 'America/Sao_Paulo', location: 'São Paulo', flag: 'brazil.png'),
    WorldTimeService(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTimeService(
        url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTimeService(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTimeService(
        url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTimeService(
        url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTimeService(
        url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTimeService(
        url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTimeService(
        url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose a location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            onTap: () {},
            title: Text(locations[index].location),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${locations[index].flag}'),
            ),
          ),
        ),
      ),
    );
  }
}
