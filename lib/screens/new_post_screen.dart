import 'package:flutter/material.dart';
import 'components/post_form.dart';

class NewPostScreen extends StatefulWidget {
  static const routeName = 'newPost';
  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final title = 'Wasteagram'; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center( 
          child: Text(title)
        )),
      body: PostForm()
    );
  }
}

double padding(BuildContext context, double num){
  return MediaQuery.of(context).size.width * num;
}