/**
 * @author: jianleepb
 * @github: https://github.com/jianleepb
 */
import 'package:flutter/material.dart';
import 'package:tiktok_flutter_app/res/colors.dart';
import 'package:tiktok_flutter_app/widget/music_icon.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: leftPale(_size)),
          Positioned(bottom: 0, right: 0, child: rightPale(_size))
        ],
      ),
    );
  }

  Widget rightPale(_size) {
    return Container(
      width: _size.width * 0.2,
      height: _size.height * 0.5,
      padding: EdgeInsets.only(bottom: 10),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _attentionIcon(
                'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3196884682,1526664447&fm=26&gp=0.jpg'),
            _getIcons(0, '4544'),
            _getIcons(1, '2042'),
            _getIcons(2, '665'),
            SizedBox(
              height: 10,
            ),
            MusicIcon()
          ],
        ),
      ),
    );
  }



  Widget leftPale(_size) {
    return Container(
      width: _size.width * 0.70,
      height: _size.height * 0.25,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '@世间满樱花',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            '沉寂了一夏，终于迎来了秋风，内心极度渴望的东西，才有机会去触及。#马拉松 #跑步 #自律 @抖音小助手',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                Icons.music_note,
                size: 15,
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Tales of the Electric Romeo @世间满樱花的创作',
                  maxLines: 1,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  var icons = [Icons.favorite, Icons.comment, Icons.reply];

  //点赞、消息、分享
  Widget _getIcons(int index, String num) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 7,
          ),
          Icon(icons[index], color: white, size: 30.0),
          SizedBox(
            height: 2,
          ),
          Text(
            num,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          SizedBox(
            height: 7,
          )
        ],
      ),
    );
  }

  //关注头像
  Widget _attentionIcon(img) {
    return Container(
      width: 46,
      height: 56,
      child: Stack(
        children: <Widget>[
          Container(
            width: 46,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(color: white),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover)),
          ),
          Positioned(
              bottom: 3,
              left: 16,
              child: Container(
                width: 18,
                height: 18,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primary),
                child: Center(
                    child: Icon(
                  Icons.add,
                  color: white,
                  size: 14,
                )),
              ))
        ],
      ),
    );
  }
}
