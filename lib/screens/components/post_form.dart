import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location/location.dart';
import '../../models/post.dart';

class PostForm extends StatefulWidget {
  File image; 
  PostForm({Key key, this.image}) : super (key: key);

  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final _formKey = GlobalKey<FormState>();
  final postFields = Post();
  LocationData locationData;
  
  @override
  void initState(){
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async{
    var locationService = Location();
    locationData = await locationService.getLocation();
  }

  Widget build(BuildContext context) {
    final database = ModalRoute.of(context).settings.arguments;
    
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            selectedPhoto(context, widget.image),
            formField(context, postFields, 'Number of Items'),
            //SizedBox(height: 10),
            RaisedButton(
              onPressed: () async{
                if(_formKey.currentState.validate()){
                  _formKey.currentState.save();
                  Firestore.instance.collection(database).add({
                      'date': DateTime.now(),
                      'image_url': 'https://vetmed.illinois.edu/wp-content/uploads/2017/12/pc-keller-hedgehog.jpg',
                      'latitude': '${locationData.latitude}',
                      'longitude': '${locationData.longitude}',
                      'quantity': postFields.quantity
                  });
                  //Return to previous page after saving
                  Navigator.of(context).pop();
                }
              },
              child: Icon(
                Icons.cloud_upload,
                semanticLabel: 'Button to publish this post'),
            )
        ],),
      )
    );
  }
}

Widget selectedPhoto(BuildContext context, File image){
  return Container(
    child: Padding(
      padding: EdgeInsets.fromLTRB(
        padding(context, 0.1),
        padding(context, 0.05),
        padding(context, 0.1),
        padding(context, 0.05)
        ),
      child: Image.file(image)
      )
  );
}

double padding(BuildContext context, double num){
  return MediaQuery.of(context).size.width * num;
}

Widget formField(BuildContext context, Post entry, String label){
  return Padding(
    padding:  EdgeInsets.all(padding(context, 0.05)),
    child: TextFormField( 
      autofocus: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder()),
      keyboardType: TextInputType.number,
      onSaved: (value) {
        storeVal(entry, label, value);
      },
      validator: (value){
        if(value.isEmpty){
          return 'This field cannot be empty.';
        }
      },
    ),
  );
}

void storeVal(Post entry, String field, String val){
  if(field == 'Number of Items'){
    entry.quantity = int.parse(val);
  }
}



