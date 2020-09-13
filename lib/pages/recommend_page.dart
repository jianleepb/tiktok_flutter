/**
 * @author: jianleepb
 * @github: https://github.com/jianleepb
 */
import 'package:flutter/material.dart';
import 'package:tiktok_flutter_app/data/data_json.dart';
import 'package:tiktok_flutter_app/res/colors.dart';
import 'package:tiktok_flutter_app/widget/music_icon.dart';
import 'package:tiktok_flutter_app/widget/videoplay_item.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class VideoItems extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;

  const VideoItems(
      {Key key,
      this.videoUrl,
      this.name,
      this.caption,
      this.songName,
      this.profileImg,
      this.likes,
      this.comments,
      this.shares,
      this.albumImg})
      : super(key: key);

  @override
  _VideoItemsState createState() => _VideoItemsState();
}

class _VideoItemsState extends State<VideoItems> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: RotatedBox(
        quarterTurns: -1,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(color: black),
                child: VideoPlayerItem(
                  videoUrl: widget.videoUrl,
                ),
              ),
              Positioned(bottom: 0, left: 0, child: leftPale(_size)),
              Positioned(bottom: 0, right: 0, child: rightPale(_size))
            ],
          ),
        ),
      ),
    );
  }

  Widget rightPale(_size) {
    return Container(
      width: _size.width * 0.2,
      height: _size.height * 0.5,
      padding: EdgeInsets.only(left:10,bottom: 10),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _attentionIcon(widget.profileImg),
            _getIcons(0, widget.likes),
            _getIcons(1, widget.comments),
            _getIcons(2, widget.shares),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 38,
              width: 38,
              child: MusicIcon(widget.albumImg),
            )
          ],
        ),
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
            '@${widget.name}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            widget.caption,
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
                  widget.songName,
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

  //关注头像
  Widget _attentionIcon(img) {
    return Container(
      width: 50,
      height: 50,
      child: Stack(
        children: <Widget>[
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
                border: Border.all(color: white),
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.cover)),
          ),
          Positioned(
              bottom: 0,
              left: 17,
              child: Container(
                width: 16,
                height: 16,
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

class _RecommendPageState extends State<RecommendPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: RotatedBox(
        quarterTurns: 1,
        child: TabBarView(
          controller: _tabController,
          children: List.generate(items.length, (index) {
            return VideoItems(
              videoUrl: items[index]['videoUrl'],
              name: items[index]['name'],
              caption: items[index]['caption'],
              songName: items[index]['songName'],
              profileImg: items[index]['profileImg'],
              likes: items[index]['likes'],
              comments: items[index]['comments'],
              shares: items[index]['shares'],
              albumImg: items[index]['albumImg'],
            );
          }),
        ),
      ),
    );
  }
}
