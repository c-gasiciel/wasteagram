import 'package:flutter/material.dart';

class ChooseImageScreen extends StatefulWidget {
  static const routeName = 'newScreen';
  @override
  _ChooseImageScreenState createState() => _ChooseImageScreenState();
}

class _ChooseImageScreenState extends State<ChooseImageScreen> {
  final title = 'Wasteagram'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center( 
          child: Text(title)
        )),
      body: Placeholder()
    );
  }
}