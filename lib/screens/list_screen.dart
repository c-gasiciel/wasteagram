import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart' as Path;
import 'new_post_screen.dart';
import 'detail_screen.dart';


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
      onPressed: () { pushNewPost(context); }
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
  );
}



Widget titleRow(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Wasteagram - '),
    addItems()
  ]);
}


Widget addItems(){
  return StreamBuilder(
    stream: Firestore.instance.collection('wasteagram_details').snapshots(),
    builder: (content, snapshot){
      if(snapshot.hasData){
        var total = 0;
        var post = snapshot.data.documents;
        for (var idx = 0; idx < post.length; idx++){
            total += post[idx]['quantity'];
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('$total')),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text('0')),
        );
      }
    }
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
            return GestureDetector(
              onTap: () { pushDetailScreen(context); },
              child: makeListTile(post['date'].toString(), post['quantity'].toString())
            );
          }
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    }
  );
}


Widget makeListTile(String title, String quantity){
  return ListTile( 
    title: Center(
      child: Text(title)), 
    trailing: Text(quantity)
  );
}


void pushNewPost(BuildContext context){
  Navigator.of(context).pushNamed(NewPostScreen.routeName);
}


void pushDetailScreen(BuildContext context){
  Navigator.of(context).pushNamed(DetailScreen.routeName);
}