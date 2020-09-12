/**
 * @author: jianleepb
 * @github: https://github.com/jianleepb
 */
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child:Text('Hello TikTok',style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),)
      ),
    );
  }
}
