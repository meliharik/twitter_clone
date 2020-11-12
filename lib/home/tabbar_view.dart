import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:twitter/home_view.dart';
import 'package:twitter/search_view.dart';

class TwitterTabbarView extends StatefulWidget {
  @override
  _TwitterTabbarViewState createState() => _TwitterTabbarViewState();
}

class _TwitterTabbarViewState extends State<TwitterTabbarView> {
  bool isHeaderClose = false;
  String _randomurl = "https://picsum.photos/200";
  ScrollController scrollController;
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

    scrollController.addListener((){

      if(scrollController.offset <= 0){
        isHeaderClose = false;
      }else if(scrollController.offset >= scrollController.position.maxScrollExtent){
        isHeaderClose = true;
      } else{
        isHeaderClose = scrollController.offset > lastOffset ? true : false;
      }


      setState(() {
        lastOffset = scrollController.offset;
      });
      print(scrollController.offset);
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: _fabButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _bottomAppbar,
        body: Column(
          children: <Widget>[
            _containerAppbar,
            _divider,
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  HomeView(scrollController),
                  SearchView(scrollController),
                  Text("hay gayz"),
                  Text("hay gayz"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget get _divider => Divider(
    color: Colors.grey,
    height: 0,
  );

  Widget get _bottomAppbar => BottomAppBar(
    shape: CircularNotchedRectangle(),
    notchMargin: 8,
    child: _tabBarItems,
  );

  Widget get _fabButton => FloatingActionButton(
    onPressed: (){},
    child: Icon(CupertinoIcons.pencil),
  );

  Widget get _containerAppbar => AnimatedContainer(
    duration: Duration(milliseconds: 200),
    height: isHeaderClose ? 0 : 75,
    child: _appBar,
  );

  Widget get _appBar => AppBar(
    elevation: 0,
    centerTitle: false,
    title: _appBarItems,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: IconButton(
          icon: Icon(Icons.add_alert, color: CupertinoColors.activeBlue, size: 30,),
          tooltip: 'Open notifications',
          onPressed: (){},
        ),
      ),
    ] ,
  );

  Widget get _appBarItems => Wrap(
    crossAxisAlignment: WrapCrossAlignment.center,
    spacing: 10,
    children: <Widget>[
      CircleAvatar(backgroundImage: NetworkImage(_randomurl)),
      Text("Home",style: titleTextStyle,),

    ],
  );

  Widget get _tabBarItems => TabBar(
    tabs: <Widget>[
      Tab(icon: Icon(Icons.home)),
      Tab(icon: Icon(Icons.search)),
      Tab(icon: Icon(Icons.notifications_none)),
      Tab(icon: Icon(Icons.message)),
    ],
  );


}

final titleTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    color: Colors.black,
    letterSpacing: 1.1
);
