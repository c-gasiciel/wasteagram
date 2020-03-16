import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:path/path.dart' as Path;
import 'new_post_screen.dart';
import 'detail_screen.dart';
import '../models/post.dart';


class ListScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  Widget build(BuildContext context) {
    return listScaffold(context,);
  }
}


Widget listScaffold(BuildContext context){
  final database = 'wasteagram_details';
  return Scaffold( 
    appBar: AppBar(
      title: titleRow(database)),
    body: generateScreen(context, database),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () { pushNewPost(context); }
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
  );
}



Widget titleRow(String database){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text('Wasteagram - '),
    addItems(database)
  ]);
}


Widget addItems(String database){
  return StreamBuilder(
    stream: Firestore.instance.collection(database).snapshots(),
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


Widget generateScreen(BuildContext context, String database){
  return StreamBuilder(
    stream: Firestore.instance.collection(database).snapshots(),
    builder: (content, snapshot){
      if(snapshot.hasData){
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (context, index){
            var post = snapshot.data.documents[index];
            Post args = Post(
              date: post['date'], 
              imageURL: post['image_url'], 
              quantity: post['quantity'], 
              latitude: post['latitude'], 
              longitude: post['longitude']);

            return GestureDetector(
              onTap: () { pushDetailScreen(context, args); },
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


void pushDetailScreen(BuildContext context, Post args){
  Navigator.of(context).pushNamed(DetailScreen.routeName, arguments: args);
}