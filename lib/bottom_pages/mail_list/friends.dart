import 'package:flutter/material.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({super.key});

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  var listTile = [
    {
      "name": "张三",
      "state_msg": "今晚去哪里吃饭",
      "portrait": "images/meimei.jpg",
    },
    {
      "name": "李四",
      "state_msg": "哪里有好吃的",
      "portrait": "images/meimei.jpg",
    },
  ];

  Widget _getListTile(context, index) {
    return ListTile(
      title: Text(listTile[index]["name"].toString()),
      subtitle: Text(listTile[index]["state_msg"].toString()),
      leading: CircleAvatar(
        backgroundImage: AssetImage(listTile[index]["portrait"].toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listTile.length,
      itemBuilder: _getListTile,
    );
  }
}
