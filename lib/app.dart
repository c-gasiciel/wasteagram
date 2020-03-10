import 'package:flutter/material.dart';
import 'package:wasteagram/screens/detail_screen.dart';

class WasteagramApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp( 
      title: 'Wasteagram',
      theme: ThemeData(primarySwatch: Colors.green),
      home: DetailScreen()
    );
  }
}