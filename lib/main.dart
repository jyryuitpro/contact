import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;

  // var name = '연락처앱';
  var name = ['류지영', '홍길동', '피자집'];
  var like = [0, 0, 0];

  //BuildContext context: 부모위젯의 정보를 담고있는 변수일 뿐
  @override
  Widget build(BuildContext context) {
    print(context.findAncestorWidgetOfExactType<MaterialApp>());
    return Scaffold(
      appBar: AppBar(
        title: Text('연락처앱'),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/logo.png'),
            title: Text(name[index]),
          );
        },
      ),
      //Builder: 족보생성기
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Text(a.toString()),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Text('안녕'),
                  );
                },
              );
            },
          );
        }
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
