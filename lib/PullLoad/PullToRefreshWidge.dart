import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class PullToRefreshPage extends StatefulWidget {
  @override
  _PullToRefreshPageState createState() => _PullToRefreshPageState();
}

class _PullToRefreshPageState extends State<PullToRefreshPage> {

  List<String> images;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images = new List();
    fetchTen();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("pull to loading image"),
      ),
      body: RefreshIndicator(
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index){
                return new Container(
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                    height: 200,
                    width: 200,
                  ),
                );
              },
            itemCount: images.length,
          ),
          onRefresh: () async{
            await new Future.delayed(const Duration(seconds: 1));
            images.clear();
            fetchTen();
          }
      ),
    );
  }

  fetch() async{
    final response = await http.get('http://dog.ceo/api/breeds/image/random');
    if(response.statusCode == 200){
      setState(() {
        images.add(json.decode(response.body)['message']);
      });
    }else{
      throw Exception('Failed to load images');
    }
  }

  fetchTen(){
    for(int i = 0; i <= 10; i++){
      print('fetch');
      fetch();
    }
  }
}
