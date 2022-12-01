import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class UserModel with ChangeNotifier, DiagnosticableTreeMixin {
  String _name = '';
  String _pswd = '123456';
  String _stateMsg = '默认状态消息';
  String _portrait = '';

  String get name => _name;
  String get pswd => _pswd;
  String get stateMsg => _stateMsg;
  String get portrait => _portrait;

  set name(name) => _name = name;
  set pswd(pswd) => _pswd = pswd;
  set stateMsg(stateMsg) => _stateMsg = stateMsg;
  set portrait(portrait) => _portrait = portrait;

  setData() {}

  Future<String> userData(String name) async {
    if (name == '') return '';
    var url = Uri.http(
      '10.0.2.2',
      '/api/find/$name',
    );
    var r = await http.get(url);
    if (r.statusCode != 200) return '';
    var res = convert.jsonDecode(r.body) as Map<String, dynamic>;
    var jsonRes = res["data"][0];

    _name = jsonRes['name'];
    _pswd = jsonRes['pswd'];
    _stateMsg = jsonRes['stateMsg'];
    _portrait = jsonRes['portrait'];

    // 通知
    notifyListeners();
    return _pswd;
  }
}
