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
      Text(args.dateToString()),
        displayImg(context, args.imageURL),
        Text('Items: ${args.quantity}'),
        Text('(${args.latitude}, ${args.longitude})')
    ],
  ));
}

Widget displayImg(BuildContext context, String path){
  return Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(
        padding(context, 0.1),
        padding(context, 0.1),
        padding(context, 0.1),
        padding(context, 0.1)
        ),
      child: Image.network(path)
      )
  );
}

double padding(BuildContext context, double num){
  return MediaQuery.of(context).size.width * num;
}




