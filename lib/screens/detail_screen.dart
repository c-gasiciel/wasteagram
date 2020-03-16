import 'package:flutter/material.dart';


class DetailScreen extends StatelessWidget {
  static const routeName = 'detailScreen';
  final title = 'Wasteagram';

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(title)),
        body: displayDetails(context)
    );
  }
}


Widget displayDetails(BuildContext context){
  return Center(
    child: Column(children: [
      Text('Date Posted'),
      displayImg(context),
      Text('Items: ##'),
      Text('(latitude, longitude)')
    ],
    ));
}


Widget displayImg(BuildContext context){
  return Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(
        padding(context, 0.1),
        padding(context, 0.1),
        padding(context, 0.1),
        padding(context, 0.1)
        ),
      child: Placeholder())
      );
}

double padding(BuildContext context, double num){
  return MediaQuery.of(context).size.width * num;
}




