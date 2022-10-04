// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人'),
        automaticallyImplyLeading: false,
      ),
      body: Text("个人组件"),
    );
  }
}
