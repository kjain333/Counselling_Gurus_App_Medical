
import 'package:counselling_gurus/Pages/Student/Fragments/Dashboard.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/Disclaimer.dart';
import 'package:counselling_gurus/components/oval_right_clipper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wiredash/wiredash.dart';
import 'Fragments/HomePage.dart';
import 'package:flutter/material.dart';
import 'Fragments/MorePage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //For bottom nav
  int _selectedPage = 0;
  var _pageOptions = [
    HomePage(),
    Dashboard(),
  ];
  var _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    Divider _buildDivider() {
      return Divider(
        color: divider,
      );
    }
    _launchURL(url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
    Widget _buildRow(IconData icon, String title,int index, {bool showBadge = false}) {
      final TextStyle tStyle = GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w200);
      return GestureDetector(
        onTap: (){
          if(index==2)
            showFeedback(context);
          else if(index==1)
            Share.share(
                'https://play.google.com/store/apps/details?id=com.counsellinggurus.counselling_gurus_medical',//heading[index-1]
                subject: 'Counselling Gurus JOSAA Counselling App');
          else if(index==3)
            _launchURL("https://play.google.com/store/apps/details?id=com.counsellinggurus.counselling_gurus_medical");
          else if(index==4)
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Disclaimer()));
          else if(index==5)
            _launchURL("https://counsellinggurus.in/");
          else
            Toast.show("Feature Coming Soon!",context,gravity: Toast.BOTTOM,duration: Toast.LENGTH_LONG);

        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(children: [
            Icon(
              icon,
              color: active,
            ),
            SizedBox(width: 10.0),
            Text(
              title,
              style: tStyle,
            ),
          ]),
        ),
      );
    }
    buildDrawer(){
      return ClipPath(
        clipper: OvalRightBorderClipper(),
        child: Drawer(
          child: Container(
            padding: const EdgeInsets.only(left: 16.0, right: 40),
            decoration: BoxDecoration(
                color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
            width: 300,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 90,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [Colors.orange, Colors.deepOrange])),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("assets/images/app_logo.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("@counsellinggurus",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 16),),
                    ),
                    SizedBox(height: 5.0),
                    SizedBox(height: 70.0),
                    Center(
                      child: Column(
                        children: <Widget>[
                          _buildRow(Icons.share, "Share App",1),
                          _buildDivider(),
                          _buildRow(Icons.message, "Feedback",2, showBadge: true),
                          _buildDivider(),
                          _buildRow(Icons.star, "Rate Us",3,showBadge: true),
                          _buildDivider(),
                          _buildRow(Icons.info_outline,"Disclaimer",4),
                          _buildDivider(),
                          _buildRow(Icons.explore,"Explore More",5),
                          _buildDivider(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }



    void showfeedback(context) {
      Wiredash.of(context).show();
    }


    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.message),
          onPressed: (){
            _launchURL("https://t.me/joinchat/AAAAAEqb4HIHyUFDstk5Sg");
          },
        ),
        appBar: AppBar(
          title: Text(
            'COUNSELLING GURUS',
            style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.w300, color: Colors.white, fontSize: 18),
          ),
        ),
        drawer: buildDrawer(),
        body: PageView(
          children: _pageOptions,
          onPageChanged: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
          controller: _pageController,
        ),
        bottomNavigationBar: TitledBottomNavigationBar(
            reverse: true,
            currentIndex:
                _selectedPage, // Use this to update the Bar giving a position
            onTap: (index) {
              setState(() {
                _selectedPage = index;
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              });
            },
            items: [
              TitledNavigationBarItem(title: Text('Home',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 16),), icon: Icons.home),
              TitledNavigationBarItem(title: Text('Dashboard',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 16),), icon: Icons.dashboard),
//              TitledNavigationBarItem(
//                  title: Text('Chat'), icon: Icons.question_answer),
            ])
        //      bottomNavigationBar: BottomNavigationBar(
        //          selectedItemColor: Colors.orangeAccent,
        //          unselectedItemColor: Colors.black26,
        //          currentIndex: _selectedPage,
        //          onTap: (int index) {
        //            setState(() {
        //              _selectedPage = index;
        //              _pageController.animateToPage(_selectedPage,
        //                  duration: Duration(microseconds: 200), curve: Curves.linear);
        //            });
        //          },
        //          items: [
        //            BottomNavigationBarItem(
        //                icon: Icon(Icons.person), title: Text("Profile")),
        //            BottomNavigationBarItem(
        //                icon: Icon(Icons.home), title: Text("Home")),
        //            BottomNavigationBarItem(
        //                icon: Icon(Icons.call), title: Text("News")),
        //            BottomNavigationBarItem(
        //                icon: Icon(Icons.more), title: Text("More")),
        //          ]),
        );
  }
}
