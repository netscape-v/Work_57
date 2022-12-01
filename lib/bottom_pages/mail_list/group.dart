import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final _groupList = [
    {
      "name": "闲聊群",
      "msg": "今晚去哪里嗨",
      "portrait": "images/tomcat.jpg",
    },
    {
      "name": "吹牛逼群",
      "msg": "哪里有好吃的",
      "portrait": "images/tomcat.jpg",
    },
  ];
  Widget _getGroupList(context, index) => ListTile(
        title: Text(_groupList[index]["name"].toString()),
        subtitle: Text(_groupList[index]["msg"].toString()),
        onTap: () {},
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            _groupList[index]["portrait"].toString(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _groupList.length,
      itemBuilder: _getGroupList,
    );
  }
}
