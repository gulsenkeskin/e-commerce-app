import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHRINE'),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('search button');
              },
              icon: const Icon(
                Icons.search,
                //semantic label ekran okuyucu kullanan kişilere bu düğmenin ne yaptığını daha iyi açıklar.
                semanticLabel: 'search',
              )),
          IconButton(
            icon: const Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: GridView.count(
        //Flutter'daki çapraz eksen , kaydırma yapmayan eksen anlamına gelir. Kaydırma yönüne ana eksen denir . Bu nedenle, GridView'in varsayılan olarak yaptığı gibi dikey kaydırmanız varsa, çapraz eksen yataydır.
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        //childAspectRatio:Alan bir en-boy oranı (en fazla yükseklik) göre öğelerin boyutunu tanımlar.
        childAspectRatio: 8.0 / 9.0,
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset('assets/diamond.png'),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Title'),
                      const SizedBox(height: 8.0),
                      Text('Secondary Text'),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      //unu yapmak, klavyenin görünümünün ana sayfanın veya widget'larının boyutunu değiştirmemesini sağlar.
      resizeToAvoidBottomInset: false,
    );
  }
}
