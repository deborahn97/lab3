import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:drop_shadow_image/drop_shadow_image.dart';

import '/model/config.dart';
import '/model/prod.dart';

class ProductDetails extends StatefulWidget {
  final Prod prod;
  const ProductDetails({Key? key, required this.prod}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    late double scrHeight, scrWidth, resWidth;

    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;

    if (scrWidth <= 600) {
      resWidth = scrWidth;
    } else {
      resWidth = scrWidth * 0.75;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("DoughyGoodness Home Bakery"),
      ),
      body: Center(
        child: SizedBox(
          width: resWidth * 2,
          height: scrHeight,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      widget.prod.name!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: resWidth * 0.065,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                        shadows: const [
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black45,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: scrHeight * 0.025),
                  SimpleShadow(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      /*child: Image.network(
                        Config.server +
                            'dg_homebakery/images/products/' +
                            widget.prod.id!.toString() +
                            '.jpg',
                        height: scrHeight / 3,
                        fit: BoxFit.cover,
                      ),*/
                      child: DropShadowImage(
                        image: Image.network(
                          Config.server +
                              'dg_homebakery/images/products/' +
                              widget.prod.id!.toString() +
                              '.jpg',
                          height: scrHeight / 3,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: 5,
                        blurRadius: 5,
                        offset: const Offset(3, 3),
                        scale: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: scrHeight * 0.05),
                  Row(
                    children: [
                      const Icon(Icons.description_rounded),
                      SizedBox(width: resWidth * 0.02),
                      Flexible(
                        child: Text(
                          widget.prod.description!,
                          style: TextStyle(
                            fontSize: resWidth * 0.045,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: scrHeight * 0.025),
                  Row(
                    children: [
                      const Icon(Icons.sell_rounded),
                      SizedBox(width: resWidth * 0.02),
                      Flexible(
                        child: Text(
                          "RM " + widget.prod.price!,
                          style: TextStyle(
                            fontSize: resWidth * 0.045,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: scrHeight * 0.025),
                  Row(
                    children: [
                      const Icon(Icons.post_add_rounded),
                      SizedBox(width: resWidth * 0.02),
                      Flexible(
                        child: Text(
                          "Posted on: " +
                              DateFormat('d MMM yyyy hh:mm a')
                                  .format(widget.prod.dateCreated!),
                          style: TextStyle(
                            fontSize: resWidth * 0.045,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
