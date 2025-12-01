import 'package:flutter/material.dart';
import 'package:hai912i_tp1_profile_card/profile/ProfileHomePage.dart';

void main() {
  runApp(const MyApp()); //point d'entrée
}
//le widget racine de notre application
class MyApp extends StatelessWidget {
   const MyApp({Key? key}): super(key: key);
   @override
  Widget build(BuildContext context) {

     return MaterialApp(
       title:'My First Flutter App' ,
       theme: ThemeData(),//donnees relatives au theme choisi
       home: const ProfileHomepage(),//le widget de la page d'accueil
     );
  }
}



