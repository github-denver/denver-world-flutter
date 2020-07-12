import 'package:flutter/material.dart';

void main() => runApp(MyApp());

// 할 일 클래스
class Todo {
  bool isDone = false;
  String title;

  Todo(this.title);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '할 일 관리',
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
        home: TodoListPage());
  }
}

// TodoListPage 클래스
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // 할 일 목록을 저장할 목록
  final _items = <Todo>[];

  // 할 일 문자열 조작을 위한 컨트롤러
  dynamic _todoController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _todoController.dispose(); // 사용이 끝나면 해제
  }

  Widget _buildItemWidget(Todo todo) {
    return ListTile(
      onTap: () {
        return _toggleTodo(todo);
      },
      title: Text(
        todo.title,
        style: todo.isDone
            ? TextStyle(
                decoration: TextDecoration.lineThrough,
                fontStyle: FontStyle.italic)
            : null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () {
          _deleteTodo(todo);
        },
      ),
    );
  }

  // 할 일 추가 메서드
  void _addTodo(Todo todo) {
    setState(() {
      _items.add(todo);
      _todoController.text = ''; // 할 일 입력 필드를 비웁니다.
    });
  }

  // 할 일 삭제 메서드
  void _deleteTodo(Todo todo) {
    setState(() {
      _items.remove(todo);
    });
  }

  // 할 일 완료/미완료 메서드
  void _toggleTodo(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('남은 할 일'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _todoController,
                  ),
                ),
                RaisedButton(
                  child: Text('추가'),
                  onPressed: () {
                    _addTodo(Todo(_todoController.text));
                  },
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: _items.map((todo) => _buildItemWidget(todo)).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
