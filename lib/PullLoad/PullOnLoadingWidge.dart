
/**
 * 实现原理是，利用ScrollController监听像素是否到达底部，再注入新数据
 */
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PullOnLoadingPage extends StatefulWidget {
  @override
  _PullOnLoadingPageState createState() => _PullOnLoadingPageState();
}

class _PullOnLoadingPageState extends State<PullOnLoadingPage> {

  List<String> images;
  ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images = new List();
    fetchTen();
    _controller = new ScrollController();
    _controller.addListener((){
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        fetchTen();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('pull on load more'),
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index){
        return new Container(
          child: Image.network(
            images[index],
            fit: BoxFit.cover,
          )
        );
      },
      itemCount: images.length,
      controller: _controller,
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
      throw Exception('Failed to load more');
    }
  }

  fetchTen(){
    for(int i = 0; i < 10; i++){
      fetch();
      print('fetch');
    }
  }
}