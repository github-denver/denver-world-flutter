import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // TextField의 현재 값을 얻는 데 필요합니다.
  final myController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // addListener로 상태를 모니터링할 수 있습니다.
    myController.addListener(_printLastestValue);

    print('addListener로 상태를 모니터링할 수 있습니다.');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    // 화면이 종료될 때는 반드시 위젯 트리에서 컨트롤러를 해제해야 합니다.
    myController.dispose();

    print('화면이 종료될 때는 반드시 위젯 트리에서 컨트롤러를 해제해야 합니다.');
  }

  _printLastestValue() {
    // 컨트롤러의 text 속성으로 연결된 TextField에 입력된 값을 얻습니다.
    print('두 번째 text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Input 연습')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                // 텍스트 변경을 감지하는 이벤트입니다.
                print('첫 번째 text field: $text');
              },
            ),
            TextField(
              controller: myController, // 컨트롤러를 지정합니다.
            )
          ],
        ),
      ),
    );
  }
}
