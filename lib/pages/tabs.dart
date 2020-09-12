import 'package:flutter/cupertino.dart';

/**
 * @author: jianleepb
 * @github: https://github.com/jianleepb
 */
import 'package:flutter/material.dart';
import 'package:tiktok_flutter_app/pages/person_page.dart';
import 'package:tiktok_flutter_app/res/colors.dart';
import 'package:tiktok_flutter_app/widget/add_icon.dart';

import 'home_page.dart';

class tabs extends StatefulWidget {
  @override
  _tabsState createState() => _tabsState();
}

class _tabsState extends State<tabs> {
  int _currentIndex = 0;//当切换到tab2隐藏下划线
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 5,
      child: Scaffold(body: getBody(), bottomNavigationBar: getFooter(_size)),
    );
  }

  Widget getBody() {
    return Container(
      decoration: BoxDecoration(color: black),
      child: TabBarView(
        children: [
          HomePage(),
          PersonPage(),
          PersonPage(),
          PersonPage(),
          PersonPage(),
        ],
      ),
    );
  }

  Widget getFooter(Size size) {
    return Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(color: appBgColor,
          border: Border(
              top:BorderSide(width: 1,color: Colors.white.withOpacity(0.25))
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 6, bottom: 8),
          child: Row(
            children: [
              Expanded(
                child: TabBar(
                  isScrollable: false,
                  onTap: (index) {
                    setState(() {
                      this._currentIndex = index;
                    });
                  },
                  indicatorColor:_currentIndex==2? appBgColor:Colors.white, //选中下划线的颜色
                  indicatorSize: TabBarIndicatorSize.label, //选中下划线的长度
                  tabs: [
                    getTab('首页'),
                    getTab('朋友'),
                    AddIcon(),
                    getTab('消息'),
                    getTab('我')
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget getTab(String msg) {
    return Tab(
      text: msg,
    );
  }
}
