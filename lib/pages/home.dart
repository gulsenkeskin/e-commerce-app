

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('SHRINE'),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: (){
            print('Menu button');
          },
        ),
        actions: [
          IconButton(
              onPressed: (){
                print('search button');
              }, 
              icon: const Icon(
                Icons.search,
                //semantic label ekran okuyucu kullanan kişilere bu düğmenin ne yaptığını daha iyi açıklar.
                semanticLabel: 'search',
              )
          ),
          IconButton(
            icon: const Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),        ],
      ),
      body: Center(
        child: Text('You did it'),
      ),
      //unu yapmak, klavyenin görünümünün ana sayfanın veya widget'larının boyutunu değiştirmemesini sağlar.
      resizeToAvoidBottomInset: false,
    );
  }
}
