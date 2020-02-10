import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: Text("I am poor")),
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Image(
            image: NetworkImage(
                'https://clipartart.com/images/christmas-coal-clipart-9.png'),
          ),
        ),
      ),
    ),
  );
}
