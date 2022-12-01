import 'package:flutter/cupertino.dart';
// 用provider管理状态 就类似于 redux和mobx

class CounterModel extends ChangeNotifier {
  // 成员变量，也就是状态
  int _count;
  // 成员get方法,用于外部获取
  int get count => _count;
  // 成员构造
  CounterModel(this._count);

  // 成员的修改状态的函数
  add() {
    _count++;
    // 监听开启监听通知
    notifyListeners();
  }
}
