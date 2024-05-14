import 'package:go_router/go_router.dart';
import 'package:schoolapplication/pages/Add_student_record.dart';
import 'package:schoolapplication/pages/View_Student_Record.dart';
import 'package:schoolapplication/pages/login_page.dart';
import 'package:schoolapplication/pages/splash.dart';

GoRouter goRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'splash',
    builder: (context, state) {
      return const SplashPage();
    },
  ),
  GoRoute(
    path: '/login',
    name: 'login',
    builder: (context, state) {
      return const LoginPage();
    },
  ),
  GoRoute(
    path: '/addstudent',
    name: 'addstudent',
    builder: (context, state) {
      return const StudentRecord();
    },
  ),
  GoRoute(
    path: '/viewrecord',
    name: 'viewrecord',
    builder: (context, state) {
      return const StudentRecordDetail();
    },
  ),
]);
