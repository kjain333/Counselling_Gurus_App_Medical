import 'dart:math';
import 'package:counselling_gurus/Pages/Student/HomePageSources/BranchName.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/CollegePredictor.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/NewCollegesList.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/Progress.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/UploadFile.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/FAQ.dart';
import 'package:counselling_gurus/Pages/Student/HomePageSources/Mistakes.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
double width;
Set<int> a= {};
Set<int> b= {};

List<Color> background1 = [Colors.indigoAccent,Colors.deepOrangeAccent,Colors.greenAccent,Colors.deepPurpleAccent,Colors.blueAccent,Colors.red,Colors.brown,Colors.black,Colors.blueGrey,Colors.lightBlueAccent,Colors.orangeAccent,Colors.lightGreenAccent,Colors.purpleAccent,Colors.greenAccent,Colors.pinkAccent,Colors.amberAccent,Colors.grey,Colors.blueAccent];
List<Color> background=[Colors.lightBlueAccent,Colors.orangeAccent,Colors.lightGreenAccent,Colors.purpleAccent,Colors.greenAccent,Colors.pinkAccent,Colors.amberAccent,Colors.grey,Colors.blueAccent,Colors.indigoAccent,Colors.deepOrangeAccent,Colors.greenAccent,Colors.deepPurpleAccent,Colors.blueAccent,Colors.red,Colors.brown,Colors.black,Colors.blueGrey];
List<String> cardHeadings = [
  "College Predictor",
  "Get your Rank",
  "Colleges",
  "Streams",
  "Frequently Asked Questions",
  "Document Verification",
  "Preparations Notes",
  "Mistakes",
  "Post Queries",
  "Last Year Stats",
  "Progress and Deadlines",
];
//   "Mock Counselling",
//  "Aptitude Test",
// "Document Verification",

List<String> buttonHeadings = [
  "Get Your College",
  "Get Your Rank",
  "Know About Your College",
  "Explore Streams",
  "Know More",
  "Verify",
  "Notes",
  "Mistakes",
  "Post",
  "Stats",
  "View Progress",
];
List<IconData> icon = [
  Icons.school,
  Icons.score,
  Icons.home,
  Icons.library_books,
  Icons.question_answer,
  Icons.receipt,
  Icons.note,
  Icons.clear,
  Icons.launch,
  Icons.graphic_eq,
  Icons.timeline,
];
//   Icons.note_add,
//   Icons.supervisor_account,
//  Icons.edit,
final Color primary = Colors.white;
final Color active = Colors.grey.shade800;
final Color divider = Colors.grey.shade600;
var rank ='';
final paragraph =
    ["Predict and know the best colleges you can get at your rank.Results are based on previous years' data, student preferences,NIRF rankings and other parameters like placements,college infrastructure and other facilities.",
      "Get your rank calculated based on your percentile with utmost accuracy.These ranks are calculated with the help of complex formula similar to the one used by NTA to calculate AIRs and category ranks of lakhs of students.",
    "Get quick access to desired information about thousands of colleges across India.Different facts provided about various factors like placements, campus size,student strength,routes and distances are authentic and verified.",
    "Get each and every detail about every medical stream that intrigues you.We have a collection of all streams that are offered in colleges across India.",
    "Tired of googling every single small question that comes to your mind? Then you are at a right place! Get answers to all the common(and uncommon :p)questions asked by aspirants and also get it answered if you have one!",
    " Afraid and confused about the actual counselling process? Don't worry! We provide full document verification before the actual Counselling process so that lack of documents doesn't stop you from getting your dream college or branch",
    "Don't know if you are still prepared for the upcoming exams. Relax our mentors have specially design handwritten notes to help you with last minute revision and get an extra edge over others.",
    "Wait Wait Wait! Don't just scroll over this we have examined over thousand brains combined with our experience found the top mistakes which student commit during the counselling procedure. Do have a look at this.",
    "Still have some unanswered queries? We hope not but our mentors are there to help you further post whatever query you have and we will try to help as soon as possible",
    "Not satisfied with what all you have already. Get detailed past year counselling analysis, where you stand after each counselling round and possibilities of improving in further upcoming rounds",
    "Afraid of missing out on important deadlines. Don't worry we manage it all here. Have a look at a personalised timeline designed just for you with all important details to help in the counselling procedure"];
// Afraid and confused about the actual counselling process? Don't worry! We will get all your problems sorted with this one of its kind 'Mock Counselling'.You will be guided about everything that is important for JoSAA and NEET counselling,from choice filling to locking, freezing and floating,you will understand them all at once!
      // Not able to concentrate on studies?
      // Not able to sit for long study hours?
      // Now not a reason to worry! Get your personality test done!From your mental acumen to physical ability,We will examine everything about you and suggest some steps to improve without any help from others!

      // final backparagraph = []


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
var rankdata = [
    {
      "opening": 720,
      "closing": 701,
      "rank": " 1 to 25"
    },
    {
      "opening": 700,
      "closing": 686,
      "rank": "26 - 100"
    },
    {
      "opening": 685,
      "closing": 671,
      "rank": "101 - 400"
    },
    {
      "opening": 670,
      "closing": 656,
      "rank": "401 - 1200"
    },
    {
      "opening": 655,
      "closing": 641,
      "rank": "1201 - 2200"
    },
    {
      "opening": 640,
      "closing": 626,
      "rank": "2201 - 4000"
    },
    {
      "opening": 625,
      "closing": 611,
      "rank": "4001 - 7000"
    },
    {
      "opening": 601,
      "closing": 600,
      "rank": "7001 - 9000"
    },
    {
      "opening": 599,
      "closing": 590,
      "rank": "9001 - 12500"
    },
    {
      "opening": 589,
      "closing": 580,
      "rank": "12501 - 17500"
    },
    {
      "opening": 579,
      "closing": 570,
      "rank": "17501 - 20000"
    },
    {
      "opening": 569,
      "closing": 560,
      "rank": "20001 - 25000"
    },
    {
      "opening": 559,
      "closing": 550,
      "rank": "25001 - 32000"
    },
    {
      "opening": 549,
      "closing": 540,
      "rank": "32001 - 40000"
    }
    ];
class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController marks;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  List<GlobalKey<ScaffoldState>> keys = new List(11);
  void getRank(marks){
    rank='';
    marks = int.parse(marks);
    if(marks>720)
      marks=720;
    for(int i=0;i<rankdata.length;i++)
      {
        if(marks<=rankdata[i]['opening']&&marks>=rankdata[i]['closing'])
          {
            rank = rankdata[i]['rank'];
            break;
          }
      }
    if(rank=='')
      rank='50000-100000';
    setState(() {
    });
    showMyrank(context);
  }
  //final GlobalKey<ScaffoldState> _containerkey = GlobalKey<ScaffoldState>();
  @override
  void initState(){
    super.initState();
    marks = new TextEditingController();
    for(int i=0;i<11;i++)
    {
        keys[i]= new GlobalKey<ScaffoldState>();
    }
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    a.clear();
    b.clear();
    return Scaffold(
      key: _key,
     // drawer: buildDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 30,
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return gridCard(index);
            }, childCount: 11),
          )
        ],
      ),
    );
  }

/*  buildDrawer(){
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
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.power_settings_new,
                        color: active,
                      ),
                      onPressed: () {},
                    ),
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
                  SizedBox(height: 5.0),
                  Text(
                    "erika costell",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "@erika07",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.schedule, "Schedule Meeting",1),
                  _buildDivider(),
                  _buildRow(Icons.person_pin, "Edit profile",2),
                  _buildDivider(),
                  _buildRow(Icons.message, "Feedback",3, showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.notifications, "Change Password",4,
                      showBadge: true),
                  _buildDivider(),
                  _buildRow(Icons.person, "Mentor",5),
                  _buildDivider(),
                  _buildRow(Icons.email,"Contact us",6),
                  _buildDivider(),
                  _buildRow(Icons.info_outline,"Terms and Conditions",7),
                  _buildDivider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title,int index, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return GestureDetector(
      onTap: (){
        if(index==1)
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ScheduleMeeting()));
        else if(index==2)
        Navigator.push(context,MaterialPageRoute(builder: (context)=>EditProfile()));
        else if(index==3)
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedbackPage()));
        else if(index==4)
          Navigator.push(context,MaterialPageRoute(builder: (context)=>ChangePassword()));
        else if(index==5)
          Navigator.push(context,MaterialPageRoute(builder: (context)=>TopMentors()));
        else if(index==6)
          Navigator.push(context,MaterialPageRoute(builder: (context)=>ContactUs()));
        else if(index==7)
          Navigator.push(context, MaterialPageRoute(builder: (context)=>TermsAndConditions()));
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
*/


  Widget gridCard(index) {
    if(index==6||index==8||index==2||index==9)
      {
        return Container();
      }
    int random;
    random = Random().nextInt(16);
    if(a.contains(random)&&a.length<=10)
    {
      while(a.contains(random))
      {
        random=Random().nextInt(16);
      }
    }
    a.add(random);
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: FlipCard(
            direction: FlipDirection.VERTICAL,
            front: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                //side: BorderSide(width: 1, color: Colors.black),
              ),
              color: background[random],
              elevation: 10,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomClipperPath(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //  height: keys[index].currentContext.size.height,
                    //  height: 220+paragraph[index%2].length/55*13*410.5/MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: background1[random],
                      ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          icon[index],
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Center(
                            child: Text(
                              cardHeadings[index],
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                          subtitle: Text(
                            paragraph[index],
                            //'Here we will put some lines of predefined text',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                  //  height: 220+paragraph[index%2].length/55*13*410.5/MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.transparent,
                    ),
                    //color: colorList[random]),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          icon[index],
                          size: 40,
                          color: Colors.white,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          title: Center(
                            child: Text(
                              cardHeadings[index],
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                          subtitle: Text(
                            paragraph[index],
                            //'Here we will put some lines of predefined text',
                            style: GoogleFonts.aBeeZee(
                                fontWeight: FontWeight.w300,
                                fontSize: 13,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
            back: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                //side: BorderSide(width: 1, color: Colors.black),
              ),
              color: background[random],
              elevation: 10,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomClipperPath(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                   //   height: keys[index].currentContext.size.height,
                    //  height: 220+paragraph[index%2].length/55*13*410.5/MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: background1[random],
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Icon(
                            icon[index],
                            size: 40,
                            color: Colors.transparent,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListTile(
                            title: Center(
                              child: Text(
                                cardHeadings[index],
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.transparent),
                              ),
                            ),
                            subtitle: Text(
                              paragraph[index],
                              //'Here we will put some lines of predefined text',
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13,
                                  color: Colors.transparent),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                    ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                   // height: keys[index].currentContext.size.height,
                    //height: 220+paragraph[index%2].length/55*13*410.5/MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color:Colors.transparent,
                    ),
                    //color: colorList[Random().nextInt(8)]),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "More Details",
                          style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        ListTile(
                          title: Center(
                            child: RaisedButton(
                              //elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                color: Colors.white,
                                child: Text(
                                  buttonHeadings[index],
                                  style: GoogleFonts.aBeeZee(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                onPressed: () {
                               //   print(keys[index].currentContext.size.height.toString());
                                  if (index == 0)
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                            CollegePredictor()));
                                  else if (index == 2)
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => CollegesList()));
                                  else if (index == 3)
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => BranchName()));
                                  else if (index==5)
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadFile()));
                                  else if (index==7)
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllMistakes()));
                                  else if(index==8)
                                    {
                                      _launchURL("https://forms.gle/8Z7Vu8FDkQLnEAGT7");
                                    }
                                  else if (index==9)
                                    _launchURL('https://josaa.nic.in/Result/Result/OpeningClosingRankArchieve.aspx');
                                  else if (index==10)
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Progress()));
                                  else if (index==4)
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQ()));
                                  else if (index == 1)
                                    showRankPredictor();
                                }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],),
            )));
  }
  showRankPredictor(){
    showDialog(context: context,child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        child: Container(
          width: MediaQuery.of(context).size.width-60,
          color: Colors.white,
          child: Wrap(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text('Welcome to Rank Prediction',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w900,fontSize: 20),),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Text('Anxious about how you performed? Don\'t worry! Our rank prediction software provides you with most accurate results',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 16),),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Enter Your Marks',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                  Padding(
                    padding: EdgeInsets.only(left: 40,right: 40,top: 5),
                    child: TextField(
                      controller: marks,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                          hintText: 'NEET Marks',
                          focusedBorder: OutlineInputBorder(
                            borderRadius: (
                                BorderRadius.circular(15)
                            ),
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: (
                                BorderRadius.circular(15)
                            ),
                            borderSide: BorderSide(
                                color: Colors.grey
                            ),
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Text('Choose your Category',style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                  // RadioGroup(),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.blue,
                    onPressed: (){
                      if(marks.text=='')
                        Toast.show("Please enter marks for accurate results",context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                      else
                      {
                        getRank(marks.text);
                      }

                      //Assign Rank Here
                    },
                    child: Text('Get Your Rank',style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w900,fontSize: 15,color: Colors.white),),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ],
          )
        ),
        padding: EdgeInsets.only(left: 30,right: 30,top: 80,bottom: 30),
      )
    ));
  }
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class CustomClipperPath extends CustomClipper<Path>{

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0,0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(size.width/2, size.height, size.width/2, 0);
    path.close();
    return path;
  }
}

Widget QueryPage(context){
  showDialog(context: context,builder: (_){
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height/4,
            ),
            Center(
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width-100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/giphy.gif'),
                      fit: BoxFit.fill,
                    )
                ),
              ),
            ),
            Center(
              child: Container(
                width:  MediaQuery.of(context).size.width-100,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                        height: 10
                    ),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("Post Your Query Here and our mentor will contact you over email",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400,fontSize: 16),)
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintStyle: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w200),
                          hintText: "Enter your Query",
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black45)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.black45)
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                            width: 20
                        ),
                        RaisedButton(
                          color: Colors.black45,
                          textColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('Cancel'),
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text('Submit'),
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(
                            width: 20
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  });

}
showMyrank(context){
  showDialog(context: context,child: Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(
      child: Container(
        height: 100,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: 60,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text('Your Rank: '+rank,style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),),
            ),
            color: Colors.orangeAccent,
          ),
        ),
      ),
    ),
  ));
}