import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';
import '../model/user_model.dart';
void main(List<String> args) {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
 Widget baslikAlani=Container(
   padding: EdgeInsets.fromLTRB(22, 22, 32, 22),
   child: Row(
   children: [
  Expanded(child:    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.all(10),
        child: Text( "MERHABA CEYLİN KAYA",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child:    Text('BİLGİSAYAR MÜHENDİSLİĞİ'),
      ),
    ],
  ),
  ),
   ],
 ),
     );
    Column _buttonOlusturmaTaslagi(Color btnTaslakRengi,IconData btnTaslakIkon,String btnTalakEtiket)
{
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        btnTaslakIkon,
        color: btnTaslakRengi,
      ),
      Container(

margin: EdgeInsets.all(5),
        child: Text(
          btnTalakEtiket,
         style: TextStyle(
           fontSize: 15.0,
           color: Colors.blue,
         ),

      ),
      ),
    ],
  );
}
 Color renkTutucu=Theme.of(context).primaryColor;

  Widget buttonBolumu= Container(
  child:Row(
    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
    children: [

    _buttonOlusturmaTaslagi(renkTutucu,Icons.home_work_rounded,"ADRES"),
    _buttonOlusturmaTaslagi(renkTutucu,Icons.add_home_work_rounded,"İKİNCE ADRES"),


  ],
  ) ,
);

Widget metinAlani=

Container(
padding: EdgeInsets.all(30),

child:

Text("DUYURU :                                                                                   "

    "DUYURU BULUNMAMAKTADIR.",

    style: TextStyle(
      fontWeight: FontWeight.w900,

    ),
),


);
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text("Anasayfa"),
      ),
      body: ListView(
        children: [
          Image.asset(
              "indir.jpg",
            width:600,
            height: 240,
            fit: BoxFit.cover,


          ),
            baslikAlani,
            buttonBolumu,
            metinAlani,

        ],
      )
    );
  }
}

