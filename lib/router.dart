// ignore_for_file: prefer_const_constructors

import 'package:work_57/backup/wellcome.dart';
import 'package:work_57/bottom_pages/home.dart';
import 'package:work_57/bottom_pages/message.dart';
import 'package:work_57/bottom_pages/personal.dart';
import 'package:work_57/pages.dart';

final route = {
  '/': (context) => WellcomePage(),
  'pages': (context) => BottomBar(),
  'home': (context) => HomePage(),
  'message': (context) => MessagePage(),
  'personal': (context) => PersonalPage(),
};
