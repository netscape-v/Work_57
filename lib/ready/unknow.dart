// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class UnknowPage extends StatefulWidget {
  const UnknowPage({super.key});

  @override
  State<UnknowPage> createState() => _UnknowPageState();
}

class _UnknowPageState extends State<UnknowPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("未知界面"),
    );
  }
}
