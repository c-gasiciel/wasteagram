import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChooseImageScreen extends StatefulWidget {
  static const routeName = 'addNewImage';
  @override
  _ChooseImageScreenState createState() => _ChooseImageScreenState();
}

class _ChooseImageScreenState extends State<ChooseImageScreen> {
  final title = 'Wasteagram'; 
  File image; 

  void useCamera() async{
  image = await ImagePicker.pickImage(source: ImageSource.camera);
  setState ( () {} );
  }

  void getImage() async{
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState( () {}) ;
  }


  @override
  Widget build(BuildContext context) {
    final database = ModalRoute.of(context).settings.arguments;
    

    return Scaffold(
      appBar: AppBar(
        title: Center( 
          child: Text(title)
        )),
      body: chooseImage(context, image, database)
    );
  }

  Widget chooseImage(BuildContext context, File image, String database){
  if(image == null){
    return Center(
      child: Column(
        children: [
          RaisedButton(
            child: Text('Take a Photo'),
            onPressed: () {
              useCamera();
            }),
          RaisedButton(
            child: Text('Choose a Photo'),
            onPressed: () {
              getImage();
            }),
        ],
      ));
  }
  else{
    return Center( 
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.file(image),
          SizedBox(height: 40),
          RaisedButton( 
            child: Text('Use This Photo'),
            onPressed: () {

            },
          )]
      )
    );
  }
}
}



