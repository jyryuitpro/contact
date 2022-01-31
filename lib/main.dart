import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.star),
          title: Text('AppBar'),
          actions: [
            Icon(Icons.star),
            Icon(Icons.star)
          ],
        ),
        body: SizedBox(
          child: IconButton(
            icon: Icon(Icons.star),
            onPressed: () {

            },
          ),
        ),
        // bottomNavigationBar: BottomAppBar(),
      ),
    );
  }
}
