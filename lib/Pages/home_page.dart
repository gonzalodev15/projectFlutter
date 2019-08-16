


import 'dart:convert';
import 'package:clashroyale_flutter/Authentication/Auth.dart';
import 'package:clashroyale_flutter/Authentication/AuthProvider.dart';
import 'package:clashroyale_flutter/Model/Pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyHomePage extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Pokemon> pokemonList = [];
  List<dynamic> pokemons = [];
  String url = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=90";
  //static const Map<String, String> requestHeaders = {
    //"auth" : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Mjk0NCwiaWRlbiI6IjQzOTYzNTk4NDQzNTM4MDI0NSIsIm1kIjp7InVzZXJuYW1lIjoiQXJncmVzcyIsImRpc2NyaW1pbmF0b3IiOiI2NTkzIiwia2V5VmVyc2lvbiI6M30sInRzIjoxNTY1ODg1MDA5NTg3fQ.HnLt7wg5QLzbHlY-4hAx_sV93VxRN6SvvmMqN3qR1uM"
  //};

  Future<void> _signOut(BuildContext context) async {
    try {
      final BaseAuth auth = AuthProvider.of(context).auth;
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<String> getPokemons() async {
    final response = await http.get(
        Uri.encodeFull(url),
    );
    print(response.body);
    setState(() {
      if(response.statusCode == 200) {
        var data =json.decode(response.body);
        pokemons = data['results'];
        print(pokemons.length);
        for(int i = 0; i < 90; i++){
          print(pokemons[i]);
          pokemonList.add(pokemonFromJson(json.encode(pokemons[i])));
        }
      }
      else{
        return null;
      }
    });
    return "Success";
  }


  @override
  // ignore: must_call_super
  void initState() {
    this.getPokemons();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
          title: Text("Holis"),
        actions: <Widget>[
          FlatButton(
          child: Text('Logout', style: TextStyle(fontSize: 17.0, color: Colors.white)),
          onPressed: (){
            _signOut(context);
          },
          )],//Text(widget.title),
      ),
      body: new ListView.builder(
          itemCount: pokemonList == null ? 0 : pokemonList.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Container(
                  padding: new EdgeInsets.all(32.0),
                  child: new Column(
                      children: <Widget>[

                        new Column(children: <Widget>[
                          new Text(pokemonList[index].name),
                        ],),

                      ])
              ),
            );
          }),

    );

  }

}