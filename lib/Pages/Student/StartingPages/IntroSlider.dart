
import 'package:counselling_gurus/models/intro_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Resources/Colors.dart' as color;
import '../MainPage.dart';
import 'SignUpPage.dart';

class IntroSlider extends StatefulWidget {
  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  final int _numPages = 4;
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
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : color.orange5,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(100, 92, 225, 230),
                Color.fromARGB(100, 56, 182, 255),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () =>
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height-180,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/first.png',
                                ),
                                height: MediaQuery.of(context).size.height-420,
                                width: MediaQuery.of(context).size.width-100,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Center(
                              child:  Text("An MNNIT Allahabad Startup",style: GoogleFonts.aBeeZee(color: Colors.indigo,fontSize: 28,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 10,),
                            Text("Designed and Developed under the Institute Innovation Council Supported by \"Design Innovation Centre\": An initiative of Ministry of Education, Govt. of India",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 18),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/hugo-customer-support.png',
                                ),
                                height: MediaQuery.of(context).size.height-420,
                                width: MediaQuery.of(context).size.width-100,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Center(
                              child:  Text("Expert's Support",style: GoogleFonts.aBeeZee(color: Colors.indigo,fontSize: 28,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 10,),
                            Text("Our Expert Mentors are always there for guidance that is needed by a student and parent in college admissions",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 18),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/hugo-waiting.png',
                                ),
                                height: MediaQuery.of(context).size.height-420,
                                width: MediaQuery.of(context).size.width-100,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Center(
                              child:  Text("Relaxxxx....",style: GoogleFonts.aBeeZee(color: Colors.indigo,fontSize: 28,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 10,),
                            Text("We are here to help you out with every minute detail that one should look for during college admissions",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 18),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/hugo-list-is-empty.png',
                                ),
                                height: MediaQuery.of(context).size.height-420,
                                width: MediaQuery.of(context).size.width-100,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Center(
                              child:  Text("Unique Features",style: GoogleFonts.aBeeZee(color: Colors.indigo,fontSize: 28,fontWeight: FontWeight.bold),),
                            ),
                            SizedBox(height: 10,),
                            Text("Rank Predictor, College Predictor, Document Verification, Past Analysis, Comparisons and many more.",style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w200,fontSize: 18),),
                          ],
                        ),
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
                                  size: 30.0,
                                ),
                              ],
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
      bottomSheet: _currentPage == _numPages - 1
          ?GestureDetector(
          onTap: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())),
             child: Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () =>
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage())),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Center(
                      child: Text(
                        'Get started',
                        style: TextStyle(
                          color: color.orange5,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
      )
          : Text(''),
    );
  }
}
