// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:practice_ui/models/catalog.dart';
import 'package:practice_ui/widget/drawer.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import '../widget/item_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeJson = jsonDecode(catalogJson);
    var productsData = decodeJson['products'];

    CatalogModel.item =
        List.from(productsData).map<Item>((i) => Item.fromMap(i)).toList();

    setState(() {});

    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.grey[100],
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text(
            "Collection of the Day",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.item != null && CatalogModel.item.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.item.length,
                  itemBuilder: (context, index) =>
                      ItemWidget(item: CatalogModel.item[index]),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.map, title: 'Discovery'),
            TabItem(icon: Icons.add, title: 'Add'),
            TabItem(icon: Icons.message, title: 'Message'),
            TabItem(icon: Icons.people, title: 'Profile'),
          ],
          onTap: (int i) => print('click index=$i'),
        ));
  }
}
