import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  SearchView(this.controller);

  final ScrollController controller;

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _textfield,
          ListView.builder(
            controller: widget.controller,
            itemCount: 10,
            itemBuilder: (context, index){
              return Container();
            },
          )
        ],
      )
    );
  }

  /*Widget get _listViewCard => Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(_randomurl2),
      ),
      title: Wrap(
        runSpacing: 5,
        children: <Widget>[
          _listCardTitle('Hello'),
          Text(dummyText),
          _placeHolderField,
          _footerButtonRow,
        ],
      ),
    ),
  );*/

  Widget get _textfield => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 75,
      color: Colors.grey.withOpacity(0.4),

    ),
  );
}
