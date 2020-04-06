import 'package:bugh_e_zahra/video_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:bugh_e_zahra/sideMenu.dart';
import 'package:bugh_e_zahra/homeTab.dart';

import 'package:bugh_e_zahra/models/channel_model.dart';
import 'package:bugh_e_zahra/models/video_model.dart';
import 'package:bugh_e_zahra/services/api_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Channel _channel;
  bool _isLoading = false;

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

    _initChannel();

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

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UC6Dy0rQ6zDnQuHQ1EeErGUA');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${_channel.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 140.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
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

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green[50], Colors.green[100]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 0.5]),
          color: Colors.blue,
        ),
        child: Text("Page-1"));
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green[50], Colors.green[100]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 0.5]),
          color: Colors.blue,
        ),
        child: Text("Page-2"));
  }
}

// class Page3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.height,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//             colors: [Colors.green[50], Colors.green[100]],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             stops: [0.5, 0.5]),
//         color: Colors.blue,
//       ),
//       child: ListView.builder(
//           itemCount: 10,
//           itemBuilder: (context, int index) {
//             return HomeVideoCard();
//           }),
//     );
//   }
// }

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green[50], Colors.green[100]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 0.5]),
          color: Colors.blue,
        ),
        child: Text("Page-4"));
  }
}

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green[50], Colors.green[100]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 0.5]),
          color: Colors.blue,
        ),
        child: Text("Page-5"));
  }
}