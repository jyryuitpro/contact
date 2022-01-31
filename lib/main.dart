import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);
//
//   @override
//   _TestState createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }


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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('연락처앱'),
        ),
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            print(index);
            return ListTile(
              // leading: Image.asset('assets/logo.png'),
              leading: Text(like[index].toString()),
              title: Text(name[index]),
              trailing: ElevatedButton(
                child: Text('좋아요'),
                onPressed: () {
                  setState(() {
                    like[index]++;
                  });
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: () {
            print(a);
            setState(() {
              a++;
            });
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
