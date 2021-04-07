
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
class ChooseLoction extends StatefulWidget {
  @override
  _ChooseLoctionState createState() => _ChooseLoctionState();
}

class _ChooseLoctionState extends State<ChooseLoction> {
  List<worldTime> location =[
    worldTime(url:'Europe/London',location:'London',flag:'uk.png'),
    worldTime(url:'Europe/Berlin',location:'Berlin',flag:'greece.png'),
    worldTime(url:'Africa/cairo',location:'cairo',flag:'egypt.png'),
    worldTime(url:'Africa/nairobi',location:'nairobi',flag:'pk.png'),
    worldTime(url:'America/chicago',location:'chicago',flag:'mk.png'),

    worldTime(url:'America/New_York',location:'New_York',flag:'mk.png'),
    worldTime(url:'Asia/seoul',location:'new york',flag:'south_koria.png'),
    worldTime(url:'Asia/jakarta',location:'jakarta',flag:'usa.png'),



  ];

void UpdateTime(index) async{
  worldTime instance =location[index];
  await instance.getTime();
  //navigate to home screen
  Navigator.pop(context,{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDaytime':instance.isDaytime,

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
  itemCount: location.length,
  itemBuilder: (context,index){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
      child:Card(


      child: ListTile(
        onTap: (){
          UpdateTime(index);
        },
        title: Text(location[index].location),
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/${location[index].flag}'),
        ),
      ),
      ),
    );
  }
),
      );

  }
}
