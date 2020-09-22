import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipedetector/swipedetector.dart';
import '../../../Resources/Colors.dart' as color;
var colors = [color.orange5,color.pink9];
var dataString = [[
  "Do the registration very carefully as there is no chance for correction in the counselling registration.",
"Check the college status and fee structure carefully before filling the any choice because sometimes student fill the deemed university with good rank and then they get electric shock",
"consider review in addition to ranks, because sometimes you get totally different situation. Medical ranks are not officially declared in a right manner so different websites create mess with rank.",
"Always ask the counsellor or senior before proceeding with choice feeling.",
"Wait until the last situation because mop up are the jackpots",
"Check your documents carefully before check their validity match your documents like certificates of caste or income with prescribed performa.",
"Being less technically sound creates a big problem",
"Unable to make e payments also create issue for some student as counselling fees for all India 10k which is huge amount so make payment carefully",
"Always stay away from agent they might put you in a big trouble",
"Sticking to only one course sometimes leads you to a college where pursuing that course didn’t give any benefit except regret."
],[
"Directly appearing for counseling without any pre research",
"Didn’t have updated documents",
"Being less technically sound",
"Not being updated",
"Inability to make online or E – payments",
"Less knowledge about colleges that what is best suited for the rank",
"Less knowledge about the courses available",
"Unable to decide",
"Pre deciding that whether they will get the college or not",
"Didn’t exploring all suitable ways of getting admission",
"Sticking to one course",
"Sticking to one college",
"Loss of patience",
"Getting panic",
"Skipping different counseling",
"Fragile mindset"
]];
var string= ["Before College admissions","During Counselling"];
class AllMistakes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text("Common Mistakes",style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold),),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("Here are basic categories of mistakes which student commit. To proceed further please select any category from below",style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w200),),
            ),
            SizedBox(
              height: 20,
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: string.length,
                    itemBuilder: (context,index){
                    return Container(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 30,right: 30),
                        title: Center(
                          child: Text(string[index], style: GoogleFonts.aBeeZee(fontSize: 18,fontWeight: FontWeight.w300)),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Mistakes(dataString[index])));
                        },
                      ),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.grey),top: (index==0)?BorderSide(color: Colors.grey):BorderSide(color: Colors.transparent)),

                      ),
                    );
                })
              ],
            )
          ],
        ),
      ),
    );
  }

}
class Mistakes extends StatefulWidget{
  Mistakes(this.a);
  List<String> a;
  _Mistakes createState() => _Mistakes(a);
}
class _Mistakes extends State<Mistakes>{
  _Mistakes(this.a);
  List<String> a;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Text("Here are some common mistakes committed by students. Make sure you are not one of them",style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
            ),
          ),
          SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return Mylist(index,context);
            }, childCount: a.length),
          )
        ],
      ),
    );
  }
  Widget Mylist(int index,BuildContext context){
    if(index%2==0)
    {
      return Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: <Widget>[
            Container(
                width: 300.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
            ),
            ClipPath(
              clipper: CustomClipperPath(),
              child: Container(
                  width: 300.0,
                  color: colors[0],
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
              ),
            ),
            Container(
                width: 300.0,
                child: GestureDetector(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  onTap: (){
                    setState(() {
                      return null;
                    });
                  },

                )
            )
          ],
        ),
      );
    }
    else{
      return Padding(
        padding: EdgeInsets.only(bottom: 20,left: MediaQuery.of(context).size.width-300.0),
        child: Stack(
          children: <Widget>[
            Container(
                width: 300.0,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
            ),
            ClipPath(
              clipper: CustomClipperPath1(),
              child: Container(
                  width: 300.0,
                  color: colors[1],
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )
              ),
            ),
            Container(
                width: 300.0,
                child: GestureDetector(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("Mistake "+(index+1).toString()+ ","+a[index],style: GoogleFonts.aBeeZee(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w300),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  onTap: (){
                    setState(() {
                      return null;
                    });
                  },

                )
            )
          ],
        ),
      );
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
    path.lineTo(size.width-20, 0.0);
    path.lineTo(size.width, size.height/2);
    path.lineTo(size.width-20, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }
}
class CustomClipperPath1 extends CustomClipper<Path>{

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(size.width,0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(20.0, size.height);
    path.lineTo(0.0, size.height/2);
    path.lineTo(20.0, 0.0);
    path.close();
    return path;
  }
}
