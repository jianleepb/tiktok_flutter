/**
 * @author: jianleepb
 * @github: https://github.com/jianleepb
 */
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;

  const VideoPlayerItem({Key key, this.videoUrl, this.name, this.caption, this.songName, this.profileImg, this.likes, this.comments, this.shares, this.albumImg}) : super(key: key);
  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  VideoPlayerController _videoController;
  bool isShowPlaying = false;

  @override
  void dispose() {
    // TODO: implement dispose
    print('--------dispose---------');
    super.dispose();
    _videoController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((value) {
        _videoController.play();
        setState(() {
          isShowPlaying = false;
        });
        _videoController.play();
      })
      ..setLooping(true);
  }

  Widget isPlaying() {
    return _videoController.value.isPlaying && !isShowPlaying
        ? Container()
        : Icon(
            Icons.play_arrow,
            size: 80,
            color: Colors.white.withOpacity(0.5),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        child: InkWell(
          onTap: () {
            setState(() {
              _videoController.value.isPlaying
                  ? _videoController.pause()
                  : _videoController.play();
            });
          },
          child: Stack(
            children: [
              VideoPlayer(_videoController),
              Center(
                child: Container(
                  decoration: BoxDecoration(),
                  child: isPlaying(),
                ),
              )
            ],
          ),
        ));
  }
}
