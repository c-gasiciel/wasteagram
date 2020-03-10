import 'package:flutter/material.dart';
import 'package:location/location.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  LocationData locationData; 

  @override
  void initState(){
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async{
    var locationService = Location();
    locationData = await locationService.getLocation();
    setState( () {});
  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Wasteagram'))
      ),
      body: displayLoc(locationData)
    );
  }
}


Widget displayLoc(LocationData locData){
  if(locData == null){
    return Center(child: CircularProgressIndicator());
  } else{
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Row(
            children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('(${locData.latitude},'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(' ${locData.longitude})'),
              ),
            )
          ]),
        ]),
    );
  }
}