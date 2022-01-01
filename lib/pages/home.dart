import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/products_repository.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<Card> _buildGridCards(BuildContext context){
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                //resmin bulunduğu alana göre genişlemesi için
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  //Etiketleri ana eksenin sonuna (altına) taşıyın ve ortalanacak şekilde değiştirir
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: theme.textTheme.headline6,
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();

  }


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
        children: _buildGridCards(context)
      ),
      //unu yapmak, klavyenin görünümünün ana sayfanın veya widget'larının boyutunu değiştirmemesini sağlar.
      resizeToAvoidBottomInset: false,
    );
  }
}
