import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

final dummyItems = [
  'assets/acnh.png',
  'assets/genshin_impact.png',
  'assets/half_life_alyx.png',
];

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  dynamic _pages = [Page1(), Page2(), Page3()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('복잡한 UI', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              print('onPressed');
            },
          )
        ],
      ),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            print('index: $_index');

            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(title: Text('홈'), icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              title: Text('이용 서비스'), icon: Icon(Icons.assignment)),
          BottomNavigationBarItem(
              title: Text('내 정보'), icon: Icon(Icons.account_circle)),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildTop(),
        _buildMiddle(),
        _buildBottom(),
      ],
    );
  }
}

Widget _buildTop() {
  return GestureDetector(
    onTap: () {
      print('클릭!');
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.restaurant_menu, size: 40),
                  Text('식당')
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.local_cafe, size: 40),
                  Text('카페')
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.directions_bus, size: 40),
                  Text('버스')
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.directions_subway, size: 40),
                  Text('지하철')
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.hotel, size: 40),
                  Text('숙박')
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.monetization_on, size: 40),
                  Text('은행')
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.store, size: 40),
                  Text('편의점')
                ],
              ),
              Opacity(
                opacity: 0.0,
                child: Column(
                  children: <Widget>[
                    Icon(Icons.local_taxi, size: 40),
                    Text('택시')
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildMiddle() {
  return CarouselSlider(
    height: 150,
    autoPlay: true,
    items: dummyItems.map((url) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(url, fit: BoxFit.cover),
            ),
          );
        },
      );
    }).toList(),
  );
}

Widget _buildBottom() {
  final items = List.generate(10, (i) {
    return ListTile(
      leading: Icon(Icons.notifications_none),
      title: Text('$i. [이벤트] 이것은 공지사항입니다.'),
    );
  });

  return ListView(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: items,
  );
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      '이용 서비스',
      style: TextStyle(fontSize: 40),
    ));
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      '내 정보',
      style: TextStyle(fontSize: 40),
    ));
  }
}
