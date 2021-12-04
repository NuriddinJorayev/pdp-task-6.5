import 'package:flutter/material.dart';
import 'package:pdp_task_6_5/models/user.dart';
import 'package:pdp_task_6_5/service/rest_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String s = "api";
        var user = User(1, "nuriddin", "1500\$", "21", 1);

  _Api_get() {
    Rest_APi.get(Rest_APi.apiGet, Rest_APi.EmptyParam())
        .then((value) => set_state(value));
  }
  
  _Api_getId(String id) {
    Rest_APi.getWithId(Rest_APi.apiGetId, id, Rest_APi.EmptyParam())
        .then((value) => set_state(value));
  }
  
  _Api_post() {
    Rest_APi.Post(Rest_APi.apiPost, Rest_APi.PostParam(user))
        .then((value) => set_state(value));
  }
  _Api_put(String id) {
    Rest_APi.Put(Rest_APi.apiPut, id, Rest_APi.PutParam(user))
        .then((value) => set_state(value));
  }
  _Api_delete(String id) {
    Rest_APi.Del(Rest_APi.apiDelete, id, Rest_APi.EmptyParam())
        .then((value) => set_state(value));
  }

  void set_state(String ss) {
    setState(() {
      s = ss;
      print(ss);
    });
  }

  void _incrementCounter() {

    setState(() {
      _Api_post();
      _counter++;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Api_post();
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          margin: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  s,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
