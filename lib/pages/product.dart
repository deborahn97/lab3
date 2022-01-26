import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'product_details.dart';
import '/model/prod.dart';
import 'package:simple_shadow/simple_shadow.dart';
import '/model/config.dart';

class Product extends StatefulWidget {
  final String category;
  const Product({Key? key, required this.category}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List productList = [];
  String results = "Results Found: ";
  int productNum = 0;
  late ScrollController _scrollController;
  int scrollCount = 6;

  @override
  void initState() {
    super.initState();
    _loadProducts();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    late double scrHeight, scrWidth, resWidth;
    late int gridCount;

    scrHeight = MediaQuery.of(context).size.height;
    scrWidth = MediaQuery.of(context).size.width;

    if (scrWidth <= 600) {
      resWidth = scrWidth;
      gridCount = 2;
    } else {
      resWidth = scrWidth * 0.75;
      gridCount = 3;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("DoughyGoodness Home Bakery"),
      ),
      body: productList.isEmpty
          ? Center(
              child: Text(
                        "No data found",
                        style: TextStyle(
                          fontSize: resWidth * 0.06,
                        ),
                      ),)
          : Center(
              child: SizedBox(
                width: resWidth * 2,
                height: scrHeight,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        widget.category.toString(),
                        style: TextStyle(
                          fontSize: resWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: scrHeight * 0.025),
                      Text(
                        results + productNum.toString(),
                        style: TextStyle(
                          fontSize: resWidth * 0.04,
                        ),
                      ),
                      SizedBox(height: scrHeight * 0.035),
                      Expanded(
                        child: GridView.count(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10,
                          crossAxisCount: gridCount,
                          controller: _scrollController,
                          children: List.generate(
                            scrollCount,
                            (index) {
                              return SingleChildScrollView(
                                child: Stack(
                                  children: [
                                    InkWell(
                                      onTap: (() => _productDetails(index)),
                                      child: SimpleShadow(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            Config.server +
                                                'dg_homebakery/images/products/' +
                                                productList[index]['id'] +
                                                '.jpg',
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return const Icon(
                                                  Icons.stop_circle_rounded);
                                            },
                                          ),
                                        ),
                                        opacity: 0.6,
                                        color: Colors.black,
                                        offset: const Offset(3, 3),
                                        sigma: 2,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          color: Colors.black54,
                                          margin: const EdgeInsets.all(10.0),
                                          padding: const EdgeInsets.all(7.0),
                                          child: Text(
                                            productList[index]['name'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: resWidth * 0.045,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  _loadProducts() {
    http.post(Uri.parse(Config.server + "/dg_homebakery/php/product.php"),
        body: {"category": widget.category.toString()}).then((response) {
      if (response.statusCode == 200) {
        var parsedJson = json.decode(response.body);
        setState(() {
          productList = parsedJson['product'];
          productNum = productList.length;

          if (scrollCount >= productList.length) {
            scrollCount = productList.length;
          }
        });
      } else {
        results = "No data found";
      }
    });
  }

  _productDetails(int index) async {
    Prod prod = Prod(
      id: productList[index]['id'],
      name: productList[index]['name'],
      description: productList[index]['description'],
      category: productList[index]['category'],
      price: productList[index]['price'],
      dateCreated: DateTime.tryParse(productList[index]['date_created']),
    );

    await Get.to(() => ProductDetails(prod: prod));
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        if (productNum > scrollCount) {
          scrollCount = scrollCount + 6;
          if (scrollCount > productNum) {
            scrollCount = productNum;
          }
        }
      });
    }
  }
}
