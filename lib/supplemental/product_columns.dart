import 'package:flutter/material.dart';

import '../models/product.dart';
import 'product_card.dart';

class TwoProductCardColumn extends StatelessWidget {
  const TwoProductCardColumn({
    required this.bottom,
    this.top,
    Key? key,
  }) : super(key: key);

  final Product bottom;
  final Product? top;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          const spacerHeight = 44.0;

          double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
          double heightOfImages = heightOfCards - ProductCard.kTextBoxHeight;
          // TODO: Change imageAspectRatio calculation (104)
          double imageAspectRatio = constraints.biggest.width / heightOfImages;

          // TODO: Replace Column with a ListView (104)
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 28.0),
                child: top != null
                    ? ProductCard(
                  imageAspectRatio: imageAspectRatio,
                  product: top!,
                )
                    : SizedBox(
                  height: heightOfCards,
                ),
              ),
              const SizedBox(height: spacerHeight),
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 28.0),
                child: ProductCard(
                  imageAspectRatio: imageAspectRatio,
                  product: bottom,
                ),
              ),
            ],
          );
        });
  }
}

class OneProductCardColumn extends StatelessWidget {
  const OneProductCardColumn({required this.product, Key? key})
      : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        ProductCard(
          product: product,
        ),
        const SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}