import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:http/http.dart' as http;
import '../model/config.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  List catList = [];
  String results = "Results Found: ";
  int catNum = 0;
  Random rand = Random();
  late ScrollController _scrollController;
  int scrollCount = 6;

  @override
  void initState() {
    super.initState();
    _loadCat();
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
      body: catList.isEmpty
          ? Center(
              child: Text(
                "No data found",
                style: TextStyle(
                  fontSize: resWidth * 0.06,
                ),
              ),
            )
          : Center(
              child: SizedBox(
                width: resWidth * 2,
                height: scrHeight,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: resWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: scrHeight * 0.025),
                      Text(
                        results + catNum.toString(),
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
                          children: List.generate(
                            catNum,
                            (index) {
                              return SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3.5),
                                      child: GestureDetector(
                                        onTap: (() => {
                                              _fetchCat(index),
                                            }),
                                        child: Stack(
                                          children: [
                                            SimpleShadow(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                child: Image.network(
                                                  Config.server +
                                                      'dg_homebakery/images/products/' +
                                                      (rand.nextInt(catList
                                                                  .length) +
                                                              1)
                                                          .toString() +
                                                      '.jpg',
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                    return const Icon(Icons
                                                        .stop_circle_rounded);
                                                  },
                                                ),
                                              ),
                                              opacity: 0.6,
                                              color: Colors.black,
                                              offset: const Offset(3, 3),
                                              sigma: 2,
                                            ),
                                            Positioned.fill(
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  color: Colors.black54,
                                                  margin: const EdgeInsets.all(
                                                      10.0),
                                                  padding:
                                                      const EdgeInsets.all(7.0),
                                                  child: Text(
                                                    catList[index]['category'],
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          resWidth * 0.045,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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

  _loadCat() {
    http
        .post(Uri.parse(Config.server + "/dg_homebakery/php/category.php"))
        .then((response) {
      if (response.statusCode == 200) {
        var parsedJson = json.decode(response.body);
        var catData = parsedJson['category'];

        if (catData != "no data") {
          setState(() {
            catList = catData;
            catNum = catList.length;
          });
        } else {
          setState(() {
            results = "No data found";
          });
        }
      } else {
        results = "No data found";
      }
    });
  }

  _fetchCat(int index) async {
    await Get.to(() => Product(category: catList[index]['category']));
  }

  _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        if (catNum > scrollCount) {
          scrollCount = scrollCount + 6;
          if (scrollCount > catNum) {
            scrollCount = catNum;
          }
        }
      });
    }
  }
}
