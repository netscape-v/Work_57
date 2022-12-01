// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  // 用户消息列表,消息结构, 后台消息推送
  final _msgList = [
    {
      "id": "a1233",
      "name": "张三",
      "msg": "今晚出去嗨",
      "portrait": "images/tomcat.jpg",
    },
    {
      "id": "a1244",
      "name": "李四",
      "msg": "好的！好的！",
      "portrait": "images/meimei.jpg",
    },
  ];

  // 消息列表
  List<Widget> _getListData2() {
    var list = _msgList.map(
      (msg) => ListTile(
        title: Text(msg['name'].toString()),
        subtitle: Text(msg['msg'].toString()),
        onTap: () {},
        leading: CircleAvatar(
          backgroundImage: AssetImage(msg['portrait'].toString()),
        ),
      ),
    );
    return list.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // 用户相关
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                print("点击了头像");
                Scaffold.of(context).openDrawer();
              },
              child: CircleAvatar(
                backgroundImage: AssetImage("images/hasiki.jpg"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '用户名',
                    textScaleFactor: 0.8,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '状态_消息',
                    textScaleFactor: 0.55,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // 消息列表
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 30,
            width: 370,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey,
            ),
            child: Center(
              child: Text("聊天信息"),
            ),
          ),
          Column(
            children: _getListData2(),
          ),
        ],
      ),
    );
  }
}
