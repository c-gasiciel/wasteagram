import 'package:flutter/material.dart';
import 'components/post_form.dart';
import 'choose_image_screen.dart';
import 'list_screen.dart';

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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushNamed(ListScreen.routeName)),
        title: Center( 
          child: Text(title)
        )),
      body: PostForm()
    );
  }
}

