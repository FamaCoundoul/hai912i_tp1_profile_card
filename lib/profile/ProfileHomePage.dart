
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileHomepage extends StatelessWidget {
  const ProfileHomepage({Key? key}): super(key:key);
  static const Color couleur= Colors.white;
  static const String nom_pers="Fama COUNDOUL";
  static const String email="fama@lirmm.fr";
  static const String twitter="XXXXXXXXXXX";
  static const Color primaryColor= Colors.pinkAccent;
  static const String tel="XXXXXXXXXXX";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Home Page",
               style: TextStyle(color: couleur),
        ),
        centerTitle: false,
        backgroundColor: Colors.blue,
        elevation: 8,
      ),
      body: Container(
        color: couleur,
        alignment: Alignment.center,
        child:SingleChildScrollView(
          child:  Stack(
            alignment: Alignment.center,
            children: [
              _getCard(context),
              Positioned(
                  top: 0,
                  child: _getAvatar())
            ],

          )
          ,
        ),
      ),
    );
  }





  Container _getCard(BuildContext context){
    return Container(
      width: MediaQuery.of(context).size.width > 400?400:MediaQuery.of(context).size.width*0.9,
      margin: const EdgeInsets.only(top: 80.0),
      child: Card(
          color: primaryColor,
          elevation: 12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 70,),
                Text(
                  nom_pers,
                  style: const TextStyle(
                    color: couleur,
                    fontSize: 24,
                    fontWeight:  FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                _buildDetailRow(Icons.email, email),
                _buildDetailRow(FontAwesomeIcons.twitter, twitter),
                _buildDetailRow(Icons.phone , tel)
              ],
            ),

          )
      )
    );
  } // fin methode _getCard()


  Container _getAvatar(){
    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow:[
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5)
          )
        ],

      ),
      child: CircleAvatar(
        radius: 70,
          backgroundColor: primaryColor,
          child: CircleAvatar(
            radius: 65,
            backgroundImage:NetworkImage("https://png.pngtree.com/thumb_back/fh260/background/20240522/pngtree-abstract-cloudy-background-beautiful-natural-streaks-of-sky-and-clouds-red-image_15684333.jpg") ,
            onBackgroundImageError: (exception,stackTrace){
              debugPrint("Image failed to load: $exception");
            },
          ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical:  4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: couleur.withOpacity(0.8), size: 18),
            const SizedBox(width: 8,),
            Text(
              text,
              style: const TextStyle(
                color: couleur,
                fontSize: 19,
                fontWeight: FontWeight.bold
              ),

            )
          ],
        ) ,
    );
  }

}