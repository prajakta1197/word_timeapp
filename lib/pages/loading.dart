


import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupworldtime()async{
    worldTime instance =worldTime(location: 'Berlin',flag:'germany.png',url:'Eorope/Berlin');
 await instance.getTime();
 Navigator .pushReplacementNamed(context, '/home',arguments: {
   'location':instance.location,
   'flag':instance.flag,
   'time':instance.time,
   'isDaytime':instance.isDaytime,
 });

  }
  @override
  void initState() {
    super.initState();
    setupworldtime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
    body: Center(
      child: :spinkitRotatingCircle(
        color:Colors.white,
      size:50.0,
    ),//spinkitRotatingCircle

    ),
    );
  }
}
