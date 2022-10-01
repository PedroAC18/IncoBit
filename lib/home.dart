import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: new Icon(Icons.account_balance_wallet), label: "Carteira"),
          BottomNavigationBarItem(
              icon: new Icon(Icons.explore), label: "Notícias"),
          BottomNavigationBarItem(
              icon: new Icon(Icons.person), label: "Perfil"),
        ],
        backgroundColor: Colors.white.withOpacity(0.8),
      ),
      body: conteudo(),
    );
  }
}

Widget conteudo() {
  return Container(
    child: Column(
      children: [
        Container(
          height: 230,
          color: Colors.yellow,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "IncoBit",
              style: GoogleFonts.varelaRound(fontSize: 60, color: Colors.black),
            ),
          ),
        ),
        Transform(
          transform: Matrix4.translationValues(0, -45, 0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
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
        listaMoedas(CryptoFontIcons.BTC, "BTC", "USD XXX", Colors.green),
        listaMoedas(CryptoFontIcons.ETH, "ETH", "USD XXX", Colors.red),
        listaMoedas(CryptoFontIcons.XRP, "XRP", "USD XXX", Colors.purple),
        listaMoedas(CryptoFontIcons.DASH, "DASH", "USD XXX", Colors.blue),
      ],
    ),
  );
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