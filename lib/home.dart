import 'package:bagh_e_zahra/temp.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:bagh_e_zahra/sideMenu.dart';
import 'package:bagh_e_zahra/tabScreens/homeTab.dart';
import 'tabScreens/page1.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _page = 4;
  GlobalKey _bottomNavigationKey = GlobalKey();

  List<Widget> _pages;
  Widget _page1;
  Widget _page2;
  Widget _page3;
  Widget _page4;
  Widget _page5;

  int _currentIndex;
  Widget _currentPage;

  @override
  void initState() {
    super.initState();

    _page1 = Page1();
    _page2 = Page2();
    _page3 = Page3();
    _page4 = Page4();
    _page5 = Page5();

    _pages = [_page1, _page2, _page3, _page4, _page5];

    _currentIndex = 2;
    _currentPage = _page3;
  }

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new Drawer(
        child: SideMenu(),
      ),
      appBar: AppBar(
        title: Text("BAGH-E-ZAHRA"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.green[600], Colors.green[200]],
            // stops: [0.5, 0.8],
          )),
        ),
        // elevation: 12,
      ),
      body: _currentPage,


      // body: Temp(),

      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        key: _bottomNavigationKey,
        backgroundColor: Colors.green[100],
        items: <Widget>[
          Icon(
            Icons.photo_library,
            size: 30,
            color: Colors.green[600],
            semanticLabel: "firstIcon",
          ),
          Icon(
            Icons.chat,
            size: 30,
            color: Colors.green[600],
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.green[600],
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.green[600],
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.green[600],
          ),
        ],
        color: Colors.green[200],
        animationCurve: Curves.easeOutQuint,
        animationDuration: Duration(milliseconds: 1000),
        // color: Colors.red,flutter clean
        onTap: (index) {
          changeTab(index);
        },
      ),
    );
  }
}



