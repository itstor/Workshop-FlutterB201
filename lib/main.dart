import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_page/add_page.dart';
import 'package:todo_app/screens/detail_page/detail_page.dart';
import 'package:todo_app/screens/edit_page/edit_page.dart';
import 'package:todo_app/screens/main_page/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        MainPage.routeName: (context) => MainPage(),
        EditPage.routeName: (context) => EditPage(),
        DetailPage.routeName: (context) => DetailPage(),
        AddPage.routeName: (context) => AddPage(),
      },
      initialRoute: MainPage.routeName,
    );
  }
}
