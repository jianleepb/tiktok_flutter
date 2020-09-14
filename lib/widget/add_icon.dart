/**
 * @author: jianleepb
 * @github: https://github.com/jianleepb
 */
import 'package:flutter/material.dart';
import 'package:tiktok_flutter_app/res/colors.dart';

class AddIcon extends StatefulWidget {
  @override
  _AddIconState createState() => _AddIconState();
}

class _AddIconState extends State<AddIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 25,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            child: Container(
              width: 37,
              height: 25,
              decoration: BoxDecoration(
                  color: secondary, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: 37,
              height: 25,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(8)),
            ),
          ),
          Positioned(
            right: 1.4,
            child: Container(
              width: 37,
              height: 25,
              decoration: BoxDecoration(
                  color: white, borderRadius: BorderRadius.circular(8)),
              child: Icon(
                Icons.add,
                color: Colors.black,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
