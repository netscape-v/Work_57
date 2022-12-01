import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_57/ready/unknow.dart';
import 'package:work_57/router.dart';
import 'package:work_57/state_share/counter.dart';
import 'package:work_57/state_share/user.dart';

void main(List<String> args) => runApp(
      // 单个状态机
      /* ChangeNotifierProvider(
        create: (context) => CounterModel(1),
        child: const RootWidgit(),
      ), */

      // 多状态机 ,CounterModel 是状态机器
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => CounterModel(1),
          ),
          ChangeNotifierProvider(
            create: (context) => UserModel(),
          ),
        ],
        child: const RootWidgit(),
      ),
    );

class RootWidgit extends StatefulWidget {
  const RootWidgit({super.key});

  @override
  State<RootWidgit> createState() => _RootWidgitState();
}

class _RootWidgitState extends State<RootWidgit> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const UnknowPage(),
      ),
      // 初始化页面和 home 不可同时配置
      // home: BottomBar(),
      // routes: route,
      defaultTransition: Transition.leftToRight,
      getPages: route,
    );
  }
}
