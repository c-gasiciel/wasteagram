import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget {
  static const routeName = 'detailScreen';
  final title = 'Wasteagram';

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title)),
        body: displayDetails()
    );
  }
}


Widget displayDetails(){
  return Center(
    child: Column(children: [
      Text('Date Posted'),
      Placeholder(),
      Text('Items: ##'),
      Text('(latitude, longitude)')
    ],
    ));
}



