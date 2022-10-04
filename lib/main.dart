// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:work_57/backup/unknow.dart';
import 'package:work_57/router.dart';

void main(List<String> args) => runApp(RootWidgit());

class RootWidgit extends StatefulWidget {
  const RootWidgit({super.key});

  @override
  State<RootWidgit> createState() => _RootWidgitState();
}

class _RootWidgitState extends State<RootWidgit> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => UnknowPage(),
      ),
      // 初始化页面和 home 不可同时配置
      // home: BottomBar(),
      routes: route,
    );
  }
}
