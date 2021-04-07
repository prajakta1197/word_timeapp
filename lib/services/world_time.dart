import 'dart:convert';
import 'package:intl.dart';

class worldTime{
  String location;
  //location name for the UI
String time;  //the time in that location
String flag;    //url to an flag icon
String url;   // location url for api endpoint
  bool isDaytime;  //true or false if daytime or not

  worldTime({this.location,this.flag,this.url});

 Future<void> getTime() async {
   try{
     //make the request
     Response response= await get('http://worldtimeapi.org/api/timezones/$url');
     Map data=jsonDecode(response.body);
     //print(data);

     //get properties from data
     String datetime =data['datetime'];
     String offset =data['utc_offset'].substring(1,3);
     // print(datetime);
     // print(offset);


     // create DateTime object
     DateTime now=DateTime.parse(datetime);
     now=now.add(Duration(hours: int.parse(offset)));

     //set the time properly
     isDaytime = now.hour< 6 && now.hour < 20 ? true: false;
     time =DateFormat.jm().format(now);
   }


   catch (e){

   print('caught error:$e');

   time='could not get time data';

}

