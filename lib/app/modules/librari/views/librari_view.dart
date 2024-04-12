// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../controllers/librari_controller.dart'; // Импортируем контроллер

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
                'assets/images/avatar.png', // Путь к изображению
                fit: BoxFit.cover,
                width: 40,
                height: 40,
              ),
              onPressed: () {
                // Действие при нажатии на фото
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
                    _showSortOptions(context);
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
                    crossAxisCount: 3, // Размер сетки 3 на 3
                    crossAxisSpacing: 2.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount:
                      controller.games.length, // используем controller.games
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
                      child: GridTile(
                        child: Container(
                          width: 150, // Ширина контейнера
                          height: 250, // Высота контейнера
                          child: GestureDetector(
                            onTap: () {
                              // Обработчик нажатия на игру
                              // Показываем информацию о выбранной игре в виде bottom sheet
                              _showGameDetails(
                                  context, controller.games[index]);
                            },
                            child: Image.asset(
                              controller.games[index].imagePath,
                              fit: BoxFit
                                  .cover, // Изображение заполняет контейнер
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

  void _showGameDetails(BuildContext context, Game game) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 33, 34, 39), // Серый цвет фона
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
                              offset: Offset(0, 3), // changes position of shadow
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

  void _showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 33, 34, 39), // Серый цвет фона
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ), // Закругление верхних углов
          ),
          padding: EdgeInsets.only(top: 20), // Отступ сверху
          height: 200,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Name',
                  style: TextStyle(color: Colors.white), // Белый цвет текста
                ),
                onTap: () {
                  controller.sortByName();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'PlayTime',
                  style: TextStyle(color: Colors.white), // Белый цвет текста
                ),
                onTap: () {
                  controller.sortByPlayTime();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Recent',
                  style: TextStyle(color: Colors.white), // Белый цвет текста
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
}
