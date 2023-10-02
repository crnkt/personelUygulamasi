import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: Text('BİRİNCİ ÖGE'),
            ),
            ListTile(
              title: Text('İKİNCİ ÖGE'),
            ),
            ListTile(
              title: Text('ÜÇÜNCÜ ÖGE'),
            ),
          ],
        ),
      ),
    );
  }
}
