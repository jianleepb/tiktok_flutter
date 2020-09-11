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
      // color: black,
      width: _size.width,
      child: Stack(
        children: [
          Image.network('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1599853157332&di=99bc8d86fda3cce53196b187bcc8b402&imgtype=0&src=http%3A%2F%2Fstatic01.coloros.com%2Fbbs%2Fdata%2Fattachment%2Fforum%2F201706%2F28%2F202725sjsejjbh1dyzr9jl.jpg',fit: BoxFit.cover,),
          TabBarView(
            children: [
              PersonPage(),
              PersonPage(),
              RecommendPage(),
            ],
          ),
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

        ],
      ),
    );
  }
}
