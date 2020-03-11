import 'package:flutter/material.dart';
import 'screens/detail_screen.dart';
import 'screens/list_screen.dart';

class WasteagramApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp( 
      title: 'Wasteagram',
      theme: ThemeData(primarySwatch: Colors.green),
      home: ListScreen()
    );
  }
}