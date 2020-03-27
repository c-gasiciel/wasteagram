import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/post.dart';


class DetailScreen extends StatelessWidget {
  static const routeName = 'detailScreen';
  final title = 'Wasteagram';

  @override 
  Widget build(BuildContext context){
    final Post args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(title))),
        body: displayDetails(context, args)
    );
  }
}


Widget displayDetails(BuildContext context, Post args){
  return Center(
    child: Column(children: [
      Expanded(
          flex: 2,
          child: Text(args.dateToString(),
            style: TextStyle(fontSize: 20))
          ),
      Expanded(
          flex: 6,
          child: displayImg(context, args.imageURL)),
      Expanded(
          flex: 1,
          child: Text('Items: ${args.quantity}',
            style: TextStyle(fontSize: 16))),
      Expanded(
          flex: 1,
          child: Text('(${args.latitude}, ${args.longitude})',
            style: TextStyle(fontSize: 16))),
    ]
  ));
}

Widget displayImg(BuildContext context, String path){
  return Container(
      child: Image.network(path)
      );
}

double padding(BuildContext context, double num){
  return MediaQuery.of(context).size.width * num;
}




