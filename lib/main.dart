import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/controllers/controller.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx Example :D',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  final AnimalsController animalsController = Get.put(AnimalsController());

  List<String> animals = [
    '🐸 Rana',
    '🦁 León',
    '🐶 Perro',
    '🐈 Gato',
    '🦛 Hipopótamo',
    '🐻 Oso',
    '🐼 Panda',
    '🐀 Ratón',
    '🦊 Zorro',
    '🐨 Koala',
    '🐷 Cerdito',
    '🐙 Pulpo',
    '🐬 Delfín'
  ]; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<AnimalsController>(
        init: animalsController,
        builder: (AnimalsController animalsCtrl) {
          return ListView.builder(
            itemCount: animalsCtrl.list.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(animalsCtrl.list[index], style: Theme.of(context).textTheme.headline6,),
                trailing: IconButton(
                  onPressed: () => animalsCtrl.remove(index),
                  icon: Icon(Icons.close)
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          child: Text('AÑADIR ANIMAL', style: TextStyle(
            color: Colors.white,
            fontSize: 22
          )),
          onPressed: () {
            var rand = new Random();
            animalsController.add(animals[rand.nextInt(animals.length)]);
          },
        )
      ),
    );
  }
}