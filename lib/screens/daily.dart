import 'package:flutter/material.dart';
import 'navbar.dart';

class DailyReport extends StatelessWidget {
  const DailyReport({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("GÜNLÜK RAPOR"),
      ),
      body: const Center(),
    );
  }
}