import 'package:flutter/material.dart';
import 'dart:convert';
import 'Model/TopClan.dart';
import 'package:clashroyale_flutter/Model/TopClan.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'login_page.dart';

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
      home: new LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TopClan> topClans = [];
  List<dynamic> topclans = [];
  String url = "https://api.royaleapi.com/top/clans/";
  static const Map<String, String> requestHeaders = {
    "auth" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mjk0NCwiaWRlbiI6IjQzOTYzNTk4NDQzNTM4MDI0NSIsIm1kIjp7InVzZXJuYW1lIjoiIiwiZGlzY3JpbWluYXRvciI6IiIsImtleVZlcnNpb24iOjB9LCJ0cyI6MTU2NTU2NTY1NDQ2MX0.6y7JZuoQwKf9_244oWOLcSlh3WbgW9TBYYQl4oyRiso"
  };

  Future<String> getTopClans() async {
    final response = await http.get(
        Uri.encodeFull(url),
        headers: requestHeaders
    );
    print(json.decode(response.body));
    setState(() {
      if(response.statusCode == 200) {
        topclans = json.decode(response.body);
        for(int i = 0; i < 50; i++){
          topClans.add(TopClan.fromJson(topclans[i]));

        }
      }
      else{
        return null;
      }
    });
    return "Success";
  }

  @override
  void initState() {
    this.getTopClans();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new ListView.builder(
          itemCount: topClans == null ? 0 : topClans.length,
          itemBuilder: (context, index) {
            return new Card(
              child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                      children: <Widget>[
                        new Row(children: <Widget>[
                          new IconButton(
                              icon: Icon(Icons.bookmark_border),
                              onPressed: () {

                              },
                              alignment: Alignment.center,
                              iconSize: 50,

                          ),
                        ],),
                        new Column(children: <Widget>[
                          new Text(topClans[index].name),
                          new Text(topClans[index].rank.toString()),
                        ],),

                      ])
              ),
            );
          }),

    );

  }

}
