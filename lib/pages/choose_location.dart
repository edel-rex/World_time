import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'India',flag: 'India.png',url: 'Asia/Kolkata'),
    WorldTime(url: 'America/Los_Angeles',location: 'Los Angeles',flag: 'usa.png'),
    WorldTime(url: 'America/New_York',location: 'New York',flag: 'usa.png'),
    WorldTime(url: 'Australia/Melbourne',location: 'Melbourne',flag: 'australia.png'),
    WorldTime(url: 'Europe/Berlin',location: 'Berlin',flag: 'german.png'),
    WorldTime(url: 'Asia/Seoul',location: 'Seoul',flag: 'south korea.png'),
    WorldTime(url: 'Asia/Singapore',location: 'Singapore',flag: 'singapore.png'),
    WorldTime(url: 'Europe/Zurich',location: 'Zurich',flag: 'switzerland.png')
  ];

  void updateTime(index) async{
    WorldTime instant = locations[index];
    await instant.getTime();

    //navigate to home screen
    Navigator.pop(context,{
      'location': instant.location,
      'flag': instant.flag,
      'time':instant.time,
      'daytime':instant.daytime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('Assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
