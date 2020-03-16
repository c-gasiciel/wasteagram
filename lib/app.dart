import 'package:flutter/material.dart';
import 'screens/choose_image_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/list_screen.dart';
import 'screens/new_post_screen.dart';

class WasteagramApp extends StatelessWidget{
  static final routes = {
       ListScreen.routeName : (context) => ListScreen(),
       DetailScreen.routeName: (context) => DetailScreen(),
       NewPostScreen.routeName: (context) => NewPostScreen(),
       ChooseImageScreen.routeName: (context) => ChooseImageScreen()
  };

  @override 
  Widget build(BuildContext context){
    return MaterialApp( 
      title: 'Wasteagram',
      theme: ThemeData(primarySwatch: Colors.green),
      routes: routes
    );
  }
}