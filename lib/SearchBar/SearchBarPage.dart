import 'package:flutter/material.dart';
import 'asset.dart';

class SearchBarPage extends StatefulWidget {
  @override
  _SearchBarPageState createState() => _SearchBarPageState();
}

class _SearchBarPageState extends State<SearchBarPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("SearchBar Demo"),
        actions: <Widget>[
          IconButton(icon:Icon(Icons.search),
              onPressed:() => showSearch(context: context, delegate: SearchBarDelegate())),
        ],
      ),
    );
  }
}


class SearchBarDelegate extends SearchDelegate<String>{

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [IconButton(icon: Icon(Icons.clear),onPressed: () =>  query = "")];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),onPressed: () => close(context,null));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return new Center(
      child: new Container(
        width: 100,
        height: 100,
        child: new Card(
          color: Colors.blue,
          child: new Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestionList = query.isEmpty
        ? recentSuggest
        : searchList.where((input) => input.startsWith(query)).toList();
    return new ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index) => ListTile(
          onTap: (){
            query = suggestionList[index];
            showResults(context);
          },
          title: RichText(text: TextSpan(
            text: suggestionList[index].substring(0,query.length),
            style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(color: Colors.grey)
              )
            ]
          )),
        ));
  }
}

