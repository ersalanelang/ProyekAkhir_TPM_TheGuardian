import 'package:flutter/material.dart';
import 'package:proyekakhir_123190163_3/helper/shared_preference.dart';
import 'package:proyekakhir_123190163_3/view/login_page.dart';

import 'dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: Color(0xff1c1c1c),
      ),
      body: const LoginPage(),
    );
  }
}
