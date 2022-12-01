import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_57/sqlite/sqlite_helper.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late TextEditingController _nameCtrl;
  late TextEditingController _pswdCtrl;
  late TextEditingController _stateMsgCtrl;

  late SqliteHelper _sqlite;

  late Map _args;

  @override
  void initState() {
    super.initState();
    _sqlite = SqliteHelper();

    _nameCtrl = TextEditingController();
    _pswdCtrl = TextEditingController();
    _stateMsgCtrl = TextEditingController();

    _args = Get.parameters;

    _setData();
  }

  _setData() {
    _nameCtrl.text = _args['name'];
    _pswdCtrl.text = _args['pswd'];
    _stateMsgCtrl.text = _args['stateMsg'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 65),
          child: Text('编辑用户信息'),
        ),
      ),
      body: Center(
        child: Container(
          color: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: ListView(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      '名称 : ',
                      textScaleFactor: 1.5,
                    ),
                    SizedBox(
                      width: 300,
                      height: 35,
                      child: CupertinoTextField(
                        controller: _nameCtrl,
                        cursorHeight: 23,
                        onChanged: (value) {},
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      '密码 : ',
                      textScaleFactor: 1.5,
                    ),
                    SizedBox(
                      width: 300,
                      height: 35,
                      child: CupertinoTextField(
                        controller: _pswdCtrl,
                        cursorHeight: 23,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      '状态消息 : ',
                      textScaleFactor: 1.5,
                    ),
                    SizedBox(
                      width: 258,
                      height: 35,
                      child: CupertinoTextField(
                        controller: _stateMsgCtrl,
                        cursorHeight: 23,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      '头像 : ',
                      textScaleFactor: 1.5,
                    ),
                    SizedBox(
                      width: 300,
                      height: 35,
                      // 图片选择器
                      child: CupertinoTextField(
                        cursorHeight: 23,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                TextButton(
                  onPressed: () {
                    print('提交修改');
                  },
                  child: const Text(
                    '提交修改',
                    textScaleFactor: 1.5,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
