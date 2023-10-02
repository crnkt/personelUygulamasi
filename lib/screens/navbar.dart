import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:human_resources/page/profile_page.dart';
import 'package:human_resources/screens/daily.dart';
import 'package:human_resources/screens/home.dart';

import 'login-screen.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Ceylin Kaya"),
            accountEmail: const Text("ceylinK@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://play-lh.googleusercontent.com/I-Yd5tJnxw7Ks8FUhUiFr8I4kohd9phv5sRFHG_-nSX9AAD6Rcy570NBZVFJBKpepmc',
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: NetworkImage(
                    "https://blog.depositphotos.com/wp-content/uploads/2017/07/Soothing-nature-backgrounds-2.jpg.webp",
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Anasayfa"),
            // ignore: avoid_returning_null_for_void
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text("Kullanıcılar"),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ExpansionTile(
            leading: const Icon(Icons.document_scanner_rounded),
            title: const Text('Raporlar'),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.document_scanner_outlined),
                  title: const Text('Günlük Rapor'),
                  // ignore: avoid_returning_null_for_void
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DailyReport()));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.document_scanner_outlined),
                  title: const Text('Haftalık Rapor'),
                  // ignore: avoid_returning_null_for_void
                  onTap: () => null,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.document_scanner_outlined),
                  title: const Text('Aylık Rapor'),
                  // ignore: avoid_returning_null_for_void
                  onTap: () => null,
                ),
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.question_answer),
            title: const Text('Talepler'),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.question_answer_outlined),
                  title: const Text('İzin Talepleri'),
                  // ignore: avoid_returning_null_for_void
                  onTap: () => null,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: ListTile(
                  leading: const Icon(Icons.request_page_outlined),
                  title: const Text('Avans Talepleri'),
                  // ignore: avoid_returning_null_for_void
                  onTap: () => null,
                ),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.track_changes),
            title: const Text("Mesai Takip"),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text("Duyuru Ekle"),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profil"),
            // ignore: avoid_returning_null_for_void
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Exit"),
            // ignore: avoid_returning_null_for_void
            onTap: () => logout(context),
          ),
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
