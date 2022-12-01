// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class UserMsgPage extends StatefulWidget {
  const UserMsgPage({super.key});

  @override
  State<UserMsgPage> createState() => _UserMsgPageState();
}

List<Widget> _list = [];
showMsg() {
  for (var i = 0; i < 10; i++) {
    _list.add(
      ListTile(
        title: Text("msg: $i"),
      ),
    );
  }
}

late IOWebSocketChannel channel;

class _UserMsgPageState extends State<UserMsgPage> {
  @override
  void initState() {
    super.initState();
    // 10.0.2.2  模拟连接PC ,必须要用这个ip,
    channel = IOWebSocketChannel.connect(
        Uri.parse('ws://10.0.2.2:8090?uid=xx1234&roomid=xx5678'));

    //初始化消息
    showMsg();

    // 接收消息
    receviveMsg();
  }

  @override
  void dispose() {
    super.dispose();
    channel.sink.close();
  }

  sendMsg() {
    print("发消息");
    const str = "";
    
    channel.sink.add(str);
  }

  receviveMsg() {
    channel.stream.listen(
      (msg) {
        print(msg.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // showMsg();
    return Scaffold(
      appBar: AppBar(
        title: Text("消息界面"),
      ),
      body: Container(
        height: 800,
        width: 500,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.red),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.red),
                  ),
                  child: ElevatedButton(
                    onPressed: sendMsg,
                    child: SizedBox(
                      child: Text("消息按钮"),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.red),
                  ),
                  child: ElevatedButton(
                    onPressed: sendMsg,
                    child: SizedBox(
                      child: Text("消息按钮"),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 600,
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.red),
              ),
              child: ListView(
                children: _list,
              ),
            )
          ],
        ),
      ),
    );
  }
}
