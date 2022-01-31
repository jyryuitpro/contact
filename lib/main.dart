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
  var total = 3;

  // var name = '연락처앱';
  var name = ['류지영', '홍길동', '피자집'];
  var like = [0, 0, 0];

  //1.부모에 수정함수만들기
  addOne(inputData) {
    setState(() {
      total++;
      name.add(inputData);
      print(name);
    });
  }

  //BuildContext context: 부모위젯의 정보를 담고있는 변수일 뿐
  @override
  Widget build(BuildContext context) {
    print(context.findAncestorWidgetOfExactType<MaterialApp>());
    return Scaffold(
      appBar: AppBar(
        title: Text(total.toString()),
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/logo.png'),
            title: Text(name[index]),
          );
        },
      ),
      //Builder: 족보생성기
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              //1.보내고
              // return DialogUI(state: a);
              return DialogUI(addOne: addOne);
            },
          );
        },
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  //2.등록하고
  // final state;
  final addOne;

  //inputData.text (출력)
  var inputData = TextEditingController();

  // var inputData2 = '';
  // var inputData3 = {};

  // const DialogUI({Key? key, this.state}) : super(key: key);
  DialogUI({Key? key, this.addOne}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: inputData,
            ),
            // TextField(
            //   onChanged: (value) {
            //     inputData2 = value;
            //   },
            // ),
            // TextField(
            //   onChanged: (value) {
            //
            //   },
            // ),
            TextButton(
              //3.씁니다
              // child: Text(state.toString()),
              child: Text('완료'),
              onPressed: () {
                addOne(inputData.text);
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
