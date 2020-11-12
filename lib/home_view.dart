import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/tabbar_view.dart';

class HomeView extends StatefulWidget {
  HomeView(this.controller);

    final ScrollController controller;
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  String _randomurl2 = "https://picsum.photos/200/300";
  int defaulttabControl = 4;
  String dummyText = "Bu bir deneme yazısıdır. Bu bir deneme yazısıdır. Bu bir deneme yazısıdır. Bu bir deneme yazısıdır. Bu bir deneme yazısıdır. Bu bir deneme yazısıdır. ";
  bool isHeaderClose = false;
  double lastOffset = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //floatingActionButton: _fabButton,
      body: _listView,
    );
  }

  Widget get _listView => ListView.builder(
    controller: widget.controller,
    itemCount: 10,
    itemBuilder: (context, index){
      return _listViewCard;
    },
  );

  Widget get _listViewCard => Card(
    child: ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(_randomurl2),
      ),
      title: Wrap(
        runSpacing: 5,
        children: <Widget>[
          _listCardTitle('melihify'),
          Text(dummyText),
          _placeHolderField,
          _footerButtonRow,
        ],
      ),
    ),
  );


  Widget _listCardTitle(String text) => Text(
    text,
    style: titleTextStyle,
  );

  Widget get _placeHolderField => Container(
    height: 200,
    child: Placeholder(),
  );

  Widget get _footerButtonRow => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _iconLabelButton(Icons.comment, "793"),
      _iconLabelButton(Icons.refresh, "10341"),
      _iconLabelButton(CupertinoIcons.heart, "31990"),
      _iconLabelButton(Icons.share, ""),
    ],
  );

  Widget _iconLabel(IconData icon, String text) => Wrap(
    spacing: 5,
    children: <Widget>[
      Icon(icon, color: CupertinoColors.inactiveGray),
      Text(text),
    ],
  );

  Widget  _iconLabelButton(IconData icon, String text) => InkWell(
    child: _iconLabel(icon, text),
    onTap: (){},
  );
}


