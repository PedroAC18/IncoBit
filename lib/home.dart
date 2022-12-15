import 'dart:io';

import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navegacao_telas_app/profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class Moeda {
  String name = "", logo, price, rank;
  Moeda(this.name, this.price, this.rank, this.logo);

  Moeda.fromJson(Map<String, dynamic> json):
        name = json['name'],
        rank = json['rank'],
        price = json['priceUsd'],
        logo = json['symbol'];
}

recuperaMoeda() async{
  try {
    var response = await http.get(Uri.parse("http://api.coincap.io/v2/assets"));
    var moedasJson = Map<String, dynamic>.from(json.decode(response.body));
    var moedas = <Moeda>[];
    for (var moeda in moedasJson.values.first) {
      moedas.add(Moeda.fromJson(moeda));
    }

    return moedas;
  }catch(err){
    print("ERRO $err");
  }
  return null;
}



class _HomeState extends State<Home> {
  int selectedIndex = 0;

  List<Moeda> _moedas = <Moeda>[];

  @override
  void initState() {
    super.initState();
    recuperaMoeda().then((value) {
      setState(() {
        for(var moeda in value) {
          _moedas.add(moeda);
        }
        print(_moedas);
      });
    });
    print(_moedas);
  }


  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      home(),
      Text("Coming Soon"),
      Text("Coming Soon"),
      profile()
    ];
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.1),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.lightBlue),
            BottomNavigationBarItem(
                icon: new Icon(Icons.account_balance_wallet),
                label: "Carteira"),
            BottomNavigationBarItem(
                icon: new Icon(Icons.explore), label: "Notícias"),
            BottomNavigationBarItem(
                icon: new Icon(Icons.person), label: "Perfil"),
          ]),
      body: widgets.elementAt(selectedIndex),
    );
  }

  Widget home() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.elliptical(200, 40),
                  bottomRight: Radius.elliptical(200, 40)),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "IncoBit",
                style:
                GoogleFonts.varelaRound(fontSize: 60, color: Colors.white),
              ),
            ),
          ),
          Transform(
            transform: Matrix4.translationValues(0, -45, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    children: [
                      opcoes(CryptoFontIcons.BTC, "Comprar"),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: VerticalDivider(
                          thickness: 2,
                        ),
                      ),
                      opcoes(Icons.money, "Vender")
                    ],
                  ),
                ),
              ),
            ),
          ),
          listaMoedas(CryptoFontIcons.BTC, _moedas.length == 0 ? _moedas[0].name  : "--", _moedas[0].price.substring(0, 7) ?? "--", Colors.green),
          listaMoedas(CryptoFontIcons.ETH, _moedas[1].name ?? "--", _moedas[1].price.substring(0, 7) ?? "--", Colors.red),
          listaMoedas(CryptoFontIcons.XRP, _moedas[2].name ?? "--", _moedas[2].price.substring(0, 7) ?? "--", Colors.purple),
          listaMoedas(CryptoFontIcons.DASH, _moedas[3].name ?? "--", _moedas[3].price.substring(0, 7) ?? "--", Colors.blue),
        ],
      ),
    );
  }
}

Widget listaMoedas(IconData data, String titulo, String desc, Color fundo) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(50, 20, 30, 2),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: ListTile(
        tileColor: Colors.white,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(shape: BoxShape.circle, color: fundo),
          child: Icon(data),
        ),
        title: Text(titulo),
        subtitle: Text(desc),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.stacked_line_chart),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.info_outline_rounded)
          ],
        ),
      ),
    ),
  );
}

Widget opcoes(IconData data, String titulo) {
  return Expanded(child: Column(children: [Icon(data), Text(titulo)]));
}
