import 'package:flutter/material.dart';
import 'package:work_57/bottom_pages/mail_list/friends.dart';
import 'package:work_57/bottom_pages/mail_list/group.dart';

class MailListPage extends StatefulWidget {
  const MailListPage({super.key});

  @override
  State<MailListPage> createState() => _MailListPageState();
}

class _MailListPageState extends State<MailListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('通讯录'),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              onTap: (value) {},
              tabs: const [
                Text(
                  "好友",
                  textScaleFactor: 1.2,
                ),
                Text(
                  "群聊",
                  textScaleFactor: 1.2,
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            FriendsPage(),
            GroupPage(),
          ],
        ),
      ),
    );
  }
}
