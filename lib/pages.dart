// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_57/bottom_pages/mail_list.dart';
import 'package:work_57/bottom_pages/message_.dart';
import 'package:work_57/bottom_pages/settings_.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _buttonList = const [
    MessagePage(),
    MailListPage(),
    SettingsPage(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "消息"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "通讯录"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "设定"),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          // 按下返回键触发
          // ignore: avoid_print
          print("按下了返回键");
          return false;
        },
        child: IndexedStack(
          index: _currentIndex,
          children: _buttonList,
        ),
      ),
      drawer: Drawer(
        width: 200,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 180,
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.lightBlue[300],
                      ),
                      currentAccountPicture: Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        // 头像
                        child: GestureDetector(
                          onTap: () {
                            print('点击..');
                            Get.toNamed(
                              'edit-user',
                              parameters: {
                                'name': 'zs',
                                'pswd': '123',
                                'stateMsg': '我的蛋蛋疼',
                                'portrait': '这就是头像'
                              },
                            );
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              "images/hasiki.jpg",
                            ),
                          ),
                        ),
                      ),
                      // 从用户状态中获取
                      accountName: Text("ID:zs"),
                      accountEmail: Text("@123"),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: Text("待开发..."),
            ),
            Divider(),
            ListTile(
              title: Text("待开发..."),
            ),
            Divider(),
            ListTile(
              title: Text("切换账号"),
              onTap: () {
                Get.toNamed("login");
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
