import 'package:get/get.dart';
import 'package:work_57/ready/login.dart';
import 'package:work_57/pages.dart';
import 'package:work_57/ready/wellcome.dart';
import 'package:work_57/bottom_pages/msg/user_msg.dart';
import 'package:work_57/for_user/edit_user.dart';
import 'package:work_57/ready/register.dart';
import 'package:work_57/test/show.dart';

/* final route = {
  '/': (context) => WellcomePage(),
  'pages': (context) => BottomBar(),
  'home': (context) => HomePage(),
  'message': (context) => MessagePage(),
  'personal': (context) => PersonalPage(),
  'user-msg': (context) => UserMsgPage(),
}; */

final route = [
  GetPage(name: "/", page: () => const WellcomePage()),
  GetPage(name: "/login", page: () => const LoginPage()),
  GetPage(name: "/register", page: () => const RegisterPage()),
  GetPage(name: "/pages", page: () => const BottomBar()),
  GetPage(name: "/user-msg", page: () => const UserMsgPage()),
  GetPage(name: "/show", page: () => const ShowPage()),
  GetPage(name: "/edit-user", page: () => const EditUserPage()),
];
