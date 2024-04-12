// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:steam/app/widget/widget.dart';
import '../controllers/librari_controller.dart'; 


class LibrariView extends GetView<LibrariController> {
  const LibrariView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 44, 51),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight + 10.0),
        child: AppBar(
          backgroundColor: const Color.fromARGB(255, 33, 34, 39),
          title: const Text(
            'LYBRARY',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 0),
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 49, 49, 72),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          suffixIcon: Icon(
                            Icons.search_sharp,
                            color: Colors.grey,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'SORT BY:',
                  style: TextStyle(color: Colors.grey),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showSortOptions(context, controller);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 25, 151, 254),
                    minimumSize: Size(330, 40),
                  ),
                  label: Obx(() => Text(
                        controller.sortOption.value,
                        style: TextStyle(color: Colors.white),
                      )),
                  icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount:
                      controller.games.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: GridTile(
                        child: Container(
                          width: 150,
                          height: 250,
                          child: GestureDetector(
                            onTap: () {
                              showGameDetails(
                                  context, controller, controller.games[index]);
                            },
                            child: Image.asset(
                              controller.games[index].imagePath,
                              fit: BoxFit
                                  .cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }
}
