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
      makeTextElement(2, args.dateToString(), 20),
      Expanded(
          flex: 6,
          child: displayImg(context, args.imageURL)),
      makeTextElement(1, 'Items: ${args.quantity}', 16),
      makeTextElement(1, '(${args.latitude}, ${args.longitude})', 16)
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


Widget makeTextElement(int flexFactor, String text, double fontSize){
  return Expanded(
    flex: flexFactor,
    child: Text(text,
        style: TextStyle(fontSize: fontSize))
  );
}




