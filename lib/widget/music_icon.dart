/**
 * @author: jianleepb
 * @github: https://github.com/jianleepb
 */
import 'package:flutter/material.dart';

class MusicIcon extends StatefulWidget {
  final String albumImg;

  MusicIcon(this.albumImg);

  @override
  _MusicIconState createState() => _MusicIconState();
}

class _MusicIconState extends State<MusicIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    animation = RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(_controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.forward(from: 0.0);
            }
          }),
        child: _musicIcon());
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: animation,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  Widget _musicIcon() {
    return Container(
        height: 38,
        width: 38,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  height: 38,
                  width: 38,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black54),
                ),
                Positioned(
                  top: 8,
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                        image: DecorationImage(
                            image: NetworkImage(
                                widget.albumImg))),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
