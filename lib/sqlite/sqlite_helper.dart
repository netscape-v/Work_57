import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:work_57/models/user.dart';

class SqliteHelper {
  // 数据库句柄
  late Database _database;
  // 新数据库
  late String path;
  // 建立连接
  Future<void> open() async {
    path = join(await getDatabasesPath(), "local.db");
    _database = await openDatabase(
      path,
      version: 1,
      // 如果 local.db 存在本地，数据就会一直保留，不会被删除
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE user (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            pswd TEXT,
            stateMsg TEXT,
            portrait TEXT
            )''',
        );
      },
    );
    // ignore: avoid_print
    print("连接sqlite...");
  }

  // 删除库
  deleteDB() async {
    await deleteDatabase(path);
  }

  // 带事物的添加
  inserTtransaction(User user) async {
    await _database.transaction((txn) async {
      var batch = txn.batch();
      txn.insert(
        'user',
        user.toMap(),
        // 相同的数据后面的覆盖前面
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      await batch.commit();
    });
  }

  // 普通添加数据
  Future<void> insert(User user) async {
    await _database.insert(
      'user',
      user.toMap(),
      // 相同的数据后面的覆盖前面
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 查全部
  Future<List> queryAll() async {
    var list1 = await _database.query("user");
    return list1.toList();
  }

  // 根据条件
  queryByName(name) async {
    List list2 = await _database.query(
      "user",
      where: "name=?",
      whereArgs: [name],
    );
    return list2;
  }

  // 根据name更新用户信息
  updateUserByName(User user, String name) async {
    int count = await _database.update(
      "user",
      user.toMap(),
      where: "name=?",
      whereArgs: [user.name],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return count;
  }

  // 删除全部
  deleteAllUser() async {
    int count2 = await _database.delete("user");
    return count2;
  }

  // 根据条件删除
  deleteUserByName(String name) async {
    int count = await _database.delete(
      "user",
      where: "name=?",
      whereArgs: [name],
    );
    return count;
  }
}
