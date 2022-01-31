import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var a = 1;

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            print(index);
            return ListTile(
              leading: Image.asset('assets/logo.png'),
              title: Text('류지영'),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: () {
            print(a);
            a++;
          },
        ),
      ),
    );
  }
}

class ShopItem extends StatelessWidget {
  const ShopItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text('안녕'),
    );
  }
}
