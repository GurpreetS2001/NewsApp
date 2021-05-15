import 'package:flutter/material.dart';
import 'package:newsapp/home.dart';
import 'package:newsapp/loading.dart';

void main() {
  runApp(MaterialApp(
    title: 'News App',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context)=>Loading(),
      '/home': (context)=>Home(),
    },
  ));
}

