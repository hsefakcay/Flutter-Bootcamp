import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/renkler.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    var d = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appBarTitleText("Pizza"),
        backgroundColor: anaRenk,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 24,
        fixedColor: anaRenk,
        backgroundColor: yaziRenkAcik,
        items: <BottomNavigationBarItem>[
          bottomNavigationBarItem("Restaurant", Icon(Icons.restaurant)),
          bottomNavigationBarItem("Resarch", Icon(Icons.search_sharp)),
          bottomNavigationBarItem("Shopping", Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  d!.pizzaBaslik,
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: anaRenk,
                  ),
                ),
                const Image(
                  image: AssetImage("assets/images/pizza.png"),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                pizzaTypeTextButton(d!.peynirYazi),
                pizzaTypeTextButton(d.sucukYazi),
                pizzaTypeTextButton(d.zeytinYazi),
                pizzaTypeTextButton(d.biberYazi),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(d.teslimatSuresi, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      d.teslimatBaslik,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: anaRenk),
                    ),
                  ),
                  Text(
                    d.pizzaAciklama,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center, //yazı hizalama
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  d.fiyat,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: anaRenk),
                ),
                SizedBox(
                  width: ekranGenisligi / 2,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: anaRenk,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))),
                    onPressed: () {},
                    child: Text(d.buttonYazi, style: TextStyle(fontSize: 18, color: yaziRenkAcik)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }

  Text appBarTitleText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontFamily: "Pacifico", fontSize: 24),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem(String text, Icon icon) {
    return BottomNavigationBarItem(
      icon: icon,
      label: text,
    );
  }

  TextButton pizzaTypeTextButton(String text) {
    return TextButton(
        style: TextButton.styleFrom(backgroundColor: anaRenk),
        onPressed: () {},
        child: Text(text, style: TextStyle(fontSize: 16, color: yaziRenkAcik)));
  }
}
