// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(
      Duration(seconds: 2),
      (timer) {
        Navigator.pushNamed(context, 'pages');
        timer.cancel();
      },
    );
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "欢迎界面",
              textScaleFactor: 2,
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, 'pages'),
            child: SizedBox(
              child: Text("跳转到首页"),
            ),
          )
        ],
      ),
    );
  }
}
