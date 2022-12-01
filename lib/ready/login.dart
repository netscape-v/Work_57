import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:work_57/models/user.dart';
import 'package:work_57/sqlite/sqlite_helper.dart';
import 'package:provider/provider.dart';
import 'package:work_57/state_share/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _nameControl;
  late TextEditingController _pswdControl;

  String _name = '';
  String _pswd = '';

  // 校验的密码
  String _password = '';

  // 本地记录
  late List _list;

  final SqliteHelper _sqlite = SqliteHelper();

  // 本地记录
  _localRecord() async {
    Timer.periodic(
      const Duration(microseconds: 500),
      (timer) async {
        // 查询本地的登录信息
        _list = await _sqlite.queryAll();
        // ignore: avoid_print
        print('$_list + 本地记录');
        timer.cancel();
      },
    );
  }

  // 清空本地记录
  _clearLocal() {
    Get.snackbar('', '本地记录已清空');
    _sqlite.deleteAllUser();
  }

  // 登陆操作
  _login() async {
    if (_name == '' || _pswd == '') {
      Get.snackbar(
        '🙂',
        "你用户名和密码不能为空啊",
      );
      return;
    }
    // 登录业务, 查数据库操作
    String value = await context.read<UserModel>().userData(_name);
    setState(() => _password = value);
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (_password == _pswd) {
        User user = User(
          name: _name,
          pswd: _pswd,
          stateMsg: '',
          portrait: '',
        );
        if (_list.isNotEmpty) {
          _sqlite.updateUserByName(user, _name);
        } else {
          _sqlite.insert(user);
        }
        Get.snackbar(
          '😀',
          '登录🆗',
        );
        Timer.periodic(
          const Duration(seconds: 2),
          (timer) {
            // 跳转到首页
            Get.toNamed("/pages");
            timer.cancel();
          },
        );
      } else {
        Get.snackbar(
          '😞 😓',
          'sorry 你的密码不对!',
        );
      }

      timer.cancel();
    });
  }

  final String _portrait = "http://rjw3orhbo.hn-bkt.clouddn.com/hasiki.jpg";

  // 查询头像地址
  _findPortrait() async {
    // ignore: unused_local_variable
    Uri url = Uri.http("");
    // 后台获取
    // await http.get(url);
  }

  // isShow 头像还是标题
  final bool _isShow = true;

  // 数据列表
  List<PopupMenuEntry> _getList() {
    var list = <PopupMenuEntry>[];
    for (var item in _list) {
      list.add(
        PopupMenuItem(
          onTap: () {
            setState(
              () {
                _name = item["name"];
                _pswd = item["pswd"];
              },
            );
            // 把选中的文本设置为输入框的内容
            _nameControl.text = _name;
            _pswdControl.text = _pswd;
          },
          child: Text(item["name"]),
        ),
      );
    }
    return list;
  }

  @override
  void initState() {
    super.initState();

    _nameControl = TextEditingController();
    _pswdControl = TextEditingController();
    _sqlite.open();
    _localRecord();
  }

  @override
  void dispose() {
    super.dispose();
    _nameControl.dispose();
    _pswdControl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              _isShow
                  ? const Text(
                      "登录",
                      textScaleFactor: 2,
                    )
                  : Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(width: 5, color: Colors.pink),
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: NetworkImage(_portrait),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                child: TextField(
                  controller: _nameControl,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    if (_list.isNotEmpty) {
                      showMenu(
                        context: context,
                        position:
                            const RelativeRect.fromLTRB(80, 160, 100, 250),
                        items: _getList(),
                      );
                    }
                    setState(() {
                      _name = value;
                    });
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text("输入名字"),
                    hintMaxLines: 3,
                    suffixIcon: IconButton(
                      onPressed: () {
                        _findPortrait();
                        _nameControl.clear();
                        _name = '';
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
                  controller: _pswdControl,
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    _pswd = value;
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text("输入密码"),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _pswdControl.clear();
                        _pswd = '';
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: ElevatedButton(
                      onPressed: () {
                        _login();
                      },
                      child: const Text("登录"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _clearLocal();
                    },
                    child: const Text("清空本地"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed("register");
                      },
                      child: const Text("注册"),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 70),
                    child: TextButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: const Text("退出app"),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
