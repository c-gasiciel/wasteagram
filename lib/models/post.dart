//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';


//Represents a post in Wasteagram
class Post{
  //DateTime date;
  String date;
  String imageURL;
  int quantity;
  String latitude; 
  String longitude;

  Post({this.date, this.imageURL, this.quantity, this.latitude, this.longitude});

  //String dateToString(){
  //   var formatter = new DateFormat('EEEE MMMMd, y');
  //  return formatter.format(date);
  //}

  //  : super (key: key);

  //@override 
  //Widget build(BuildContext context){
  //  return Column(
   //   mainAxisAlignment: MainAxisAlignment.center,
   //   children: [
   //     Text('$date'),
   //     Text(imageURL),
   //     Text('Items: $quantity'),
    //    Text('($latitude, $longitude')
    //  ],
    //);
  //}
}