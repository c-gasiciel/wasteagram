import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:camera/camera.dart';
import 'app.dart';

//const String title = 'Wasteagram';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  //final cameras = await availableCameras();
  

  SystemChrome.setPreferredOrientations([ 
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);

  runApp(WasteagramApp());
}