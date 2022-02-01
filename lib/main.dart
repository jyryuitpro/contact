import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

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
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      // print(contacts[0].displayName);
      // var newPerson = Contact();
      // newPerson.givenName = '잡스';
      // newPerson.familyName = '스티브';
      // ContactsService.addContact(newPerson);
      setState(() {
        name = contacts;
      });
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
      // openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    // getPermission();
  }

  int total = 3;

  // var name = '연락처앱';
  // var name = ['류지영', '홍길동', '피자집'];
  List<Contact> name = [];
  List<int> like = [0, 0, 0];

  addName(inputData) {
    setState(() {
      // name.add(inputData);
      print(inputData);
      var newPerson = Contact();
      newPerson.givenName = inputData;
      ContactsService.addContact(newPerson);
    });
  }

  //1.부모에 수정함수만들기
  addOne() {
    setState(() {
      total++;
    });
  }

  //BuildContext context: 부모위젯의 정보를 담고있는 변수일 뿐
  @override
  Widget build(BuildContext context) {
    print(context.findAncestorWidgetOfExactType<MaterialApp>());
    return Scaffold(
      appBar: AppBar(
        title: Text(total.toString()),
        actions: [
          IconButton(
            onPressed: () {
              getPermission();
            },
            icon: Icon(Icons.contacts),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/logo.png'),
            title: Text(name[index].givenName ?? '이름이없는놈'),
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
              return DialogUI(addOne: addOne, addName: addName);
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
  final addName;

  //inputData.text (출력)
  var inputData = TextEditingController();

  // var inputData2 = '';
  // var inputData3 = {};

  // const DialogUI({Key? key, this.state}) : super(key: key);
  DialogUI({Key? key, this.addOne, this.addName}) : super(key: key);

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
                addOne();
                addName(inputData.text);
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
