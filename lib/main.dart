import 'package:flutter/material.dart';
import 'package:flutter_app_ep3/views/home_ui.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUI(),
      theme: ThemeData(
        primaryColor: Colors.yellow
      ),

    ),
  );
}