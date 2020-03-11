import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return listScaffold();
  }
}


Widget listScaffold(){
  return Scaffold( 
    appBar: AppBar(
      actions: [addItems()],
      title: titleRow()),
    body: Placeholder(),
  );
}


Widget titleRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Wasteagram'),
    addItems()
  ]);
}


Widget addItems(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text('#'),
  );
}