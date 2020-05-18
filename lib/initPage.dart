import 'package:bagh_e_zahra/home.dart';
import 'package:flutter/material.dart';
import 'package:bagh_e_zahra/utilities/styles.dart';
import 'package:flutter/services.dart';

class InitPage extends StatefulWidget {
  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 10.0,
      width: isActive ? 26.0 : 20.0,
      decoration: BoxDecoration(border: Border.all(color: Colors.green,width: 2.0 ),
        color: isActive ? Colors.green[100] : Colors.green[700],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark,
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4, 0.7, 0.9],
                  colors: [
                    Colors.green[200],
                    Colors.green[300],
                    Colors.green[400],
                    Colors.green[500],
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: FlatButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ),
                            );
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: PageView(
                        physics: ClampingScrollPhysics(),
                        controller: _pageController,
                        onPageChanged: (int page) {
                          setState(() {
                            _currentPage = page;
                          });
                        },
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("images/mosque_1.png"))),
                              ),
                              Text(
                                "data",
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("images/quran.png"))),
                              ),
                              Text(
                                "data",
                                textAlign: TextAlign.start,
                              )
                            ],
                          ),
                          Column(mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("images/jamkaran.png"))),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                    _currentPage != _numPages - 1
                        ? Expanded(
                            child: Align(
                              alignment: FractionalOffset.bottomRight,
                              child: FlatButton(
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                },
                                child: Container(
                                  // color: Colors.red,
                                  // alignment: Alignment.bottomRight,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text(
                                        'Next',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                        size: 28.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Text(''),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[200], Colors.green[500]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                  // stops: [0.5, 0.5]
                ),
                // color: Colors.blue,
              ),
              height: 50.0,
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Home()));
                },
                child: Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : Text(""),
    );
  }
}
