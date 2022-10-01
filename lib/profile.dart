import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget profile() {
  return new Scaffold(body:
    Column(
      children: [
        Container(
          height: 230,
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(200, 40),
                bottomRight: Radius.elliptical(200, 40)
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "Perfil",
              style: GoogleFonts.varelaRound(fontSize: 60, color: Colors.white),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.translationValues(0, -70, 0),
          child: Stack(
            children: [
              Container(
                height: 190,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person, size: 160),
              ),
            ],),
        ),
        listTile(Icons.mail, "julio@gmail.com"),
        listTile(Icons.password, "********"),
        listTile(Icons.phone, "(31) 99999-9999"),
        listTile(Icons.person, "Julio Antunes"),
        listTile(Icons.location_city, "Belo Horizonte, Minas Gerais"),
      ],
    ),
  );
}
Widget listTile(IconData icon, String title) {
  return Padding(
      padding: const EdgeInsets.fromLTRB(50,0,50,30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          tileColor: Colors.white,
          leading:
          Icon(
            icon,
            color: Colors.teal,),
          title: Text(title),
          trailing:
            Icon(
              Icons.edit,
              color: Colors.yellow,
            ),
        ),
      )
  );
}