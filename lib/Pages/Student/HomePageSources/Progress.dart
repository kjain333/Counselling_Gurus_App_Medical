import 'dart:async';

import 'package:counselling_gurus/Pages/Student/PdfViewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
final icons=[Icons.check_circle,Icons.access_time,Icons.clear];
final color=[Colors.greenAccent,Colors.orangeAccent,Colors.redAccent];
final String paragraph = "Here we will have few lines describing each feature ";
final tasks = [
  "Round 1 of NEET UG 2020 Registration, choice filling, and payment",
  "Round 1 Choice filling/locking Date",
  "Last Date of Payment",
  "Choice Filling Process ends on",
  "Round 1 Seat allotment Date",
  "Round 1 Result",
  "Reporting at help centres",
  "Round 2 of NEET UG 2020 Registration, choice filling and payment",
  "Round 2 Choice filling/locking Date",
  "Last date for payment Round 2 Seat allotment processing",
  "Round 2 Allotment Result",
  "Reporting at help centres",
  "Transfer of vacant seats to the respective states",
  "Fresh registration",
  "Choice filling/locking Date",
  "Allotment Result",
  "Reporting at help Centres",
  "Thank You! All Tasks Completed"
];
int ctr;
List<int> indexes = new List(17);
final explain = tasks;
class Progress extends StatefulWidget{
  _Progress createState()=> _Progress();

}
bool state = false;
class _Progress extends State<Progress>{
  Future<void> createarr() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int flag=0;
    for(int i=0;i<17;i++)
    {
      indexes[i]=(sharedPreferences.get(i.toString())==null)?2:sharedPreferences.get(i.toString());
      if(flag==0&&indexes[i]==2)
      {
        ctr=i;
        flag=1;
      }
    }
    setState(() {
      state = true;
    });
  }
  Future<void> destroyarr() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    for(int i=0;i<17;i++)
    {
      sharedPreferences.setInt(i.toString(), indexes[i]);
    }
  }
  @override
  void initState(){
    state = false;
    super.initState();
    createarr();
  }
  @override
  void dispose(){
    destroyarr();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return (state==false)?Container(height: double.infinity,width: double.infinity,child: Center(
      child: Container(
        height: 50,
        width: 50,
        child: CircularProgressIndicator(),
      ),
    ),):Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.undo,color: Colors.white,),
        onPressed: (){
          setState(() {
            if(ctr==17)
              ctr--;
            else
            {
              indexes[ctr]=2;
              if(ctr!=0)
                ctr--;
            }

          });
        },
      ),
      body: Stack(
        children: <Widget>[

          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple.shade200,Colors.purple.shade400,Colors.purple.shade700],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
          ),
          Positioned(
            top: 100,
            left: 60,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 50,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white70,
              ),
            ),
          ),
          Positioned(
            top: 85,
            left:45,
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white10,
              ),
            ),
          ),
          Positioned(
            left: 87.5,
            top: 160,
            child: Container(
              width: 5,
              height: MediaQuery.of(context).size.height-290,
              color: Colors.white70,
            ),
          ),
          Positioned(
            left: 85,
            bottom: 121,
            child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white70,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 170,
            child: Container(
                width: MediaQuery.of(context).size.width-170,
                child: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width-270,
                      child: Text(explain[ctr],style: GoogleFonts.aBeeZee(fontSize: 15,color: Colors.white,),),
                    ),
                    Wrap(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.check,color: Colors.greenAccent,size: 18,),
                          onPressed: (){
                            setState(() {
                              if(ctr!=17)
                              {
                                indexes[ctr]=1;
                                ctr++;
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.clear,color: Colors.redAccent,size: 18,),
                          onPressed: (){
                            setState(() {
                              if(ctr!=17)
                              {
                                indexes[ctr]=3;
                                ctr++;
                              }
                            });
                          },
                        ),
                      ],
                    )
                  ],
                )
            ),
          ),
          Positioned(
            top: 250,
            left: 62.5,
            child: Container(
              height: MediaQuery.of(context).size.height-370,
              width: MediaQuery.of(context).size.width-100,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate:
                    SliverChildBuilderDelegate((BuildContext context, int index) {
                      return myCard(index,context);
                    }, childCount: tasks.length-1),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              left: MediaQuery.of(context).size.width/2-120,
              child: Center(

                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("FOR MBBS STUDENTS ONLY",style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),),
                  ),

                ),
          )
        ],
      ),
    );
  }

}
Widget myCard(int index,BuildContext context)
{
  return Container(
    width: MediaQuery.of(context).size.width-100,
    child: ListTile(
      leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(icons[indexes[index]-1],color: color[indexes[index]-1],),
      ),
      title: Text(tasks[index],style: GoogleFonts.aBeeZee(fontWeight: (ctr==index)?FontWeight.bold:FontWeight.w200,fontSize: (ctr==index)?18:15,color: Colors.white),),
    ),
  );
}