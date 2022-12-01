import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设定'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Text("设置组件"),
          ElevatedButton(
            onPressed: () {
              Get.toNamed("/show");
            },
            // ignore: prefer_const_constructors
            child: Text("跳转"),
          )
        ],
      ),
    );
  }
}
