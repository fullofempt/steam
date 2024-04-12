// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:steam/app/models/gameModel.dart';
import 'package:steam/app/modules/librari/controllers/librari_controller.dart';

void showGameDetails(
    BuildContext context, LibrariController controller, Game game) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 33, 34, 39),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      game.imagePath,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      colorBlendMode: BlendMode.darken,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(game.imagePath),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.4),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(game.imagePath),
                                fit: BoxFit.contain,
                                scale: 25,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  game.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  'PLAY TIME: ${game.playTime}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                Text(
                                  'LAST PLAYED: ${game.lastPlayed}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  _buildExpandableButton('My Game Content'),
                  const SizedBox(height: 10.0),
                  _buildExpandableButton('Game Info and Links'),
                  const SizedBox(height: 8.0),
                  _buildExpandableButton('Remote Download'),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildExpandableButton(String title) {
  return ElevatedButton(
    onPressed: () {
      print('$title pressed');
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 33, 34, 39),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      minimumSize: Size(double.infinity, 50),
    ),
    child: Text(
      title,
      style: TextStyle(color: Colors.white),
    ),
  );
}

void showSortOptions(BuildContext context, LibrariController controller) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 33, 34, 39),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        padding: EdgeInsets.only(top: 20),
        height: 200,
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Name',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                controller.sortByName();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'PlayTime',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                controller.sortByPlayTime();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                'Recent',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                controller.sortByRecent();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
