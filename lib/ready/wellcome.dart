import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_57/sqlite/sqlite_helper.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  final SqliteHelper _sqlite = SqliteHelper();
  @override
  void initState() {
    super.initState();

    _sqlite.open();
  }

  // 转发位置
  dispatch() async {
    var list = await _sqlite.queryAll();
    // ignore: avoid_print
    print(list);

    if (list.isEmpty) {
      // 跳转到登录页面
      Get.toNamed("login");
    } else {
      // 增加逻辑判断，查询本地的登录记录
      Get.toNamed("pages");
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      const Duration(seconds: 2),
      (timer) {
        dispatch();
        timer.cancel();
      },
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "欢迎界面",
              textScaleFactor: 2,
            ),
          ),
          // 这里定时任务，查询本地有没有登录记录，没有就去注册页面
          ElevatedButton(
            onPressed: () {
              // Navigator.pushNamed(context, 'register');
              Get.toNamed("register");
            },
            child: const SizedBox(
              child: Text("跳转到首页"),
            ),
          )
        ],
      ),
    );
  }
}
