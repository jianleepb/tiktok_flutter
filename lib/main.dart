import 'package:flutter/material.dart';
import 'package:tiktok_flutter_app/pages/tabs.dart';

void main() => runApp(RootApp());

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>tabs()
      },
    );
  }
}
