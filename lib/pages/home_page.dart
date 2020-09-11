import 'package:flutter/cupertino.dart';

/**
 * @author: jianleepb
 * @github: https://github.com/jianleepb
 */
import 'package:flutter/material.dart';
import 'package:tiktok_flutter_app/pages/person_page.dart';
import 'package:tiktok_flutter_app/pages/recommend_page.dart';
import 'package:tiktok_flutter_app/res/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 3,
      child: getBody(),
    );
  }

  Widget getBody() {
    var _size = MediaQuery.of(context).size;
    return Container(
      color: black,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Container(
              width: _size.width,
              height: 80,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.live_tv,
                    color: white.withOpacity(0.5),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: 40, right: 40, top: 15, bottom: 15),
                        child: Center(
                          child: TabBar(
                            indicatorColor: Colors.white, //选中下划线的颜色
                            indicatorSize: TabBarIndicatorSize.label, //选中下划线的长度
                            tabs: [
                              Tab(text: '同城'),
                              Tab(text: '关注'),
                              Tab(text: '推荐'),
                            ],
                          ),
                        )),
                  ),
                  Icon(
                    Icons.search,
                    size: 25,
                    color: white.withOpacity(0.5),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
          ),
          TabBarView(
            children: [
              PersonPage(),
              PersonPage(),
              RecommendPage(),
            ],
          )
        ],
      ),
    );
  }
}
