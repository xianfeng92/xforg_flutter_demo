import 'package:flutter/material.dart';

class TabBarPageSecond extends StatefulWidget {

  @override
  _TabBarPageSecondState createState() => _TabBarPageSecondState();
}

class _TabBarPageSecondState extends State<TabBarPageSecond> with AutomaticKeepAliveClientMixin {

  final _suggestions = <String>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(String pair){
    return new ListTile(
      title: new Text(
        pair,
        style: _biggerFont,
      ),
    );
  }

  generateWordPairs(){
    return [
      "燕子去了，有再来的时候",
      "杨柳枯了，有再青的时候",
      "桃花谢了，有再开的时候",
      "但是，聪明的，你告诉我",
      "我们的日子为什么一去不复返呢？",
      "是有人偷了他们罢",
      "那是谁？又藏在何处呢？",
      "是他们自己逃走了罢——如今又到了哪里呢？",
      "我不知道他们给了我多少日子",
      "但我的手确乎是渐渐空虚了",
      "在默默里算着，八千多日子已经从我手中溜去",
      "像针尖上一滴水滴在大海里",
      "我的日子滴在时间的流里，没有声音，也没有影子",
      "我不禁头涔涔而泪潸潸了",
      "去的尽管去了，来的尽管来着",
      "去来的中间，又怎样地匆匆呢？",
      "你聪明的，告诉我，我们的日子为什么一去不复返呢？"
    ];
  }

  Widget _buildSuggestions(){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context,i){
          if (i.isOdd) return new Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs());
          }
          return _buildRow(_suggestions[index]);
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _buildSuggestions();
  }
}
