import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';



//Source: https://flutter.dev/docs/cookbook/plugins/picture-using-camera
class TakePhoto extends StatefulWidget {
  final CameraDescription camera;

  const TakePhoto ({Key key, @required this.camera}) : super (key: key);

  @override
  _TakePhotoState createState() => _TakePhotoState();
}

class _TakePhotoState extends State<TakePhoto> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState(){
    super.initState();
    _controller = CameraController( 
      widget.camera,
      ResolutionPreset.medium
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final title = 'Wasteagram';

    return Scaffold(
      appBar: AppBar(title: Text (title)),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
      floatingActionButtonLocation: FloatingActionButton( 
        child: Icon(Icons.camera_alt),
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final path = join( 
              (await getTemporaryDirectory()).path,
              '${DateTime.now()}.png',
            );

            await _controller.takePicture(path);

            Navigator.pushNamed(ChooseImageScreen.routeName, arguments: )
          }
        },
      ),
    );
  }
}