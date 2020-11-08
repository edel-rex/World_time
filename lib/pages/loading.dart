import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async{
    WorldTime instant = WorldTime(location: 'India',flag: 'India.png',url: 'Asia/Kolkata');
    await instant.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instant.location,
      'flag': instant.flag,
      'time':instant.time,
      'daytime':instant.daytime,
    });
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitFadingCircle(
            color: Colors.blue[900],
            size: 50.0,
          ),
      ),
    );
  }
}
