import 'dart:convert';
import 'dart:developer';

import 'package:app/model/menu_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScrollPage extends StatefulWidget {
  const ScrollPage({super.key});

  @override
  State<ScrollPage> createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  MenuModel? menu;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    assert(mounted == true);
    getMenuData();
  }

  getMenuData() async {
    var response =
        await http.get(Uri.parse("https://myqa.fleksa.com/pyapi/61/menu"));
    log(response.body);
    setState(() {
      menu = MenuModel.fromJson(response.body);
      isLoading = false;
    });
  }

  //TODO:  Cart List List of map = product id , quantity

  // TODO: Cart pop up.

  // TODO: Add item in cart

  // TODO: delete item in cart

  // TODO: update pop up

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              //:  Text(menu!.categories![0].nameJson!.english!)
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      for (int index = 0;
                          index < menu!.categories!.length;
                          index++)
                        // CustomCategory(category: menu!.categories![index], add, delete )
                        CustomCategory(category: menu!.categories![index])
                    ],
                  ),
                )

          //CustomCategory()

          ),
    );
  }
}

class CustomCategory extends StatelessWidget {
  final Category category;
  CustomCategory({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          color: Color(0xffFEFCE8),
          child: Center(
            child: Text(
              category.nameJson!.english!,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        // for (var product in category.products!) CustomCard(product: product, add, delete )
        for (var product in category.products!) CustomCard(product: product)
      ],
    );
  }
}

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  var num = 0;
  @override
  Widget build(BuildContext context) {
    return num > 0
        ? Container(
            height: 50,
            width: 99,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.yellow),
            child: Row(
              children: [
                InkWell(
                  onTap: (() {
                    setState(() {
                      num--;
                      if (num < 0) {
                        num = 0;
                      }
                    });
                  }),
                  child: Container(
                    height: 50,
                    width: 30,
                    child: Center(
                      child: TextSize(text: "-"),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 30,
                  child: Center(
                    child: TextSize(text: num.toString()),
                  ),
                ),
                InkWell(
                  onTap: (() {
                    setState(() {
                      num++;
                    });
                  }),
                  child: Container(
                    height: 50,
                    width: 30,
                    child: Center(
                      child: TextSize(text: "+"),
                    ),
                  ),
                ),
              ],
            ),
          )
        : InkWell(
            onTap: (() {
              setState(() {
                num++;
              });
            }),
            child: Container(
              height: 50,
              width: 99,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(child: TextSize(text: "ADD")),
            ),
          );
  }
}

class TextSize extends StatelessWidget {
  var text;
  TextSize({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Part product;
  CustomCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              // color: Colors.grey
              ),
          margin: const EdgeInsets.only(top: 5, bottom: 5, right: 20, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Divider(
              //   color: Colors.black,
              // ),
              //category.nameJson!.english!,
              SizedBox(
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSize(
                      text: product.nameJson!.english!,
                    ),
                    if (product.descriptionJson!.english != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5),
                        child: Text(
                          product.descriptionJson!.english!,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    TextSize(text: "€" + product.price.toString()),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    // margin: EdgeInsets.only(left: ),
                    child: Button(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
