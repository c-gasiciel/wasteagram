import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;


class ListScreen extends StatefulWidget {
  static const routeName = '/';
  
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  Widget build(BuildContext context) {
    return listScaffold(context);
  }
}


Widget listScaffold(BuildContext context){
  return Scaffold( 
    appBar: AppBar(
      title: titleRow()),
    body: generateScreen(context),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {}
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
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


Widget generateScreen(BuildContext context){
  return StreamBuilder(
    stream: Firestore.instance.collection('wasteagram_details').snapshots(),
    builder: (content, snapshot){
      if(snapshot.hasData){
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index){
            var post = snapshot.data.documents[index];
            return ListTile( 
              title: Center(
                child: Text(post['date'].toString())), 
              trailing: Text(post['quantity'].toString())
            );
          }
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    }
    );

}