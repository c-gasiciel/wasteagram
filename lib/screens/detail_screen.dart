import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('( ,'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(' )'),
        )
      ])  
    );
  }
}