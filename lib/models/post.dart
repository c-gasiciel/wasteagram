import 'package:flutter/material.dart';

class Post extends StatelessWidget{
  DateTime date;
  String imageURL;
  int quantity;
  String latitude; 
  String longitude;

  Post({Key key, this.date, this.imageURL, this.quantity, this.latitude, this.longitude})
    : super (key: key);

  @override 
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$date'),
        Text(imageURL),
        Text('Items: $quantity'),
        Text('($latitude, $longitude')
      ],
    );
  }
}