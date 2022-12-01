// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_57/models/user.dart';
import 'package:work_57/sqlite/sqlite_helper.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _nameControl;
  late TextEditingController _pawdControl;

  String _name = '';
  String _pswd = '';

  SqliteHelper sqlite = SqliteHelper();

  _register() async {
    if (_name == '' || _pswd == '') {
      Get.snackbar(
        '🙂',
        "你用户名和密码不能为空啊",
      );
      return;
    }
    var user = User(
      name: _name,
      pswd: _pswd,
      stateMsg: '',
      portrait: '',
    );
    // 存入本地
    sqlite.insert(user);

    var list = await sqlite.queryAll();
    for (var item in list) {
      // ignore: avoid_print
      print("${item.toString()} ------");
    }

    // 后台注册
    var url = Uri.http(
      "10.0.2.2",
      "/api/add",
    );
    var res = await http.post(
      url,
      body: {
        'name': _name,
        'pswd': _pswd,
      },
    );
    if (res.statusCode == 200) {
      Get.snackbar(
        "注册消息",
        "注册成功",
      );
      Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          Get.toNamed('/login');
          timer.cancel();
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _nameControl = TextEditingController();
    _pawdControl = TextEditingController();

    // 创建数据库
    sqlite.open();
  }

  @override
  void dispose() {
    super.dispose();
    _nameControl.dispose();
    _pawdControl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              const Text(
                "注册账号",
                textScaleFactor: 2,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _nameControl,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text("输入名称"),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _nameControl.clear();
                        setState(() {
                          _name = '';
                        });
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _pawdControl,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    _pswd = value;
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text("输入密码"),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _pawdControl.clear();
                        setState(() {
                          _pswd = '';
                        });
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: ElevatedButton(
                      onPressed: () {
                        _register();
                      },
                      child: const Text("注册"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 115),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed("login");
                      },
                      child: const Text("去登录"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
