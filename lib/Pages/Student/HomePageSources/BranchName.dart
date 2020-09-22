import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../PdfViewer.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

/*final string1 = ['Chemical\nEngineering','Chemistry','Engineering\nPhysics','Environment','Oil','Petroleum'];
final string2 = ['Mechanical','Mechatronics','Textile\nand\nChemistry','Textile\nEngineering','Textile\nTechnology'];
final string3 = ['Industrial\nEngineering','Industrial\nand\nProduction','Manufacturing','Metallurgy','Mining','Production'];
final string4 = ['Instrumentation','Leather\nTechnology','Man Made\nFibre','Marine','Naval\nand\nOcean','Plastic','Paint'];
final string5 = ['Agriculture','Food','Biochemical','Biomedical','Biotechnology'];
final string6 = ['Communication','Electrical','Electronics\nand\nCommunication','Electronics\nand\nInstrumentation','Electronics\nand\nTele\nCommunications'];
final string7 = ['Computer\nScience\nEngineering','Information\nTechnology','Robotics','Aeronautical','Aerospace','Automobile','Transport'];
final string8 = ['Ceramic','Civil','Construction','Structural\nEngineering'];*/
List<String> string = new List();
/*final string10 = ['Chemical Engineering','Chemistry','Engineering Physics','Environment','Oil','Petroleum'];
final string20 = ['Mechanical','Mechatronics','Textile and Chemistry','Textile Engineering','Textile Technology'];
final string30 = ['Industrial Engineering','Industrial and Production','Manufacturing','Metallurgy','Mining','Production'];
final string40 = ['Instrumentation','Leather Technology','Man Made Fibre','Marine','Naval and Ocean','Plastic','Paint'];
final string50 = ['Agriculture','Food','Biochemical','Biomedical','Biotechnology'];
final string60 = ['Communication','Electrical','Electronics and Communication','Electronics and Instrumentation','Electronics and Tele Communications'];
final string70 = ['Computer Science Engineering','Information Technology','Robotics','Aeronautical','Aerospace','Automobile','Transport'];
final string80 = ['Ceramic','Civil','Construction','Structural Engineering'];*/
var branchdata = [
    {
      "Branch Name": "Bachelor of\nDental\nSurgery",
      "PPT Link": "https://docs.google.com/presentation/d/1jweDBlYMnFTW4E7HaXq5IfeI23dk5_2rKr41eSG-doA/export/pdf"
    },
  {
    "Branch Name": "Homeopathy",
    "PPT Link": "https://docs.google.com/presentation/d/1I5iz3kzYUsyFk88WCJQnaqYRh_pkc7y7sjRta_84PLs/export/pdf"
  },
  {
    "Branch Name": "Bachelor of\nMedicine,\nSurgery",
    "PPT Link": "https://docs.google.com/presentation/d/1ujFV_Af8HFC7YzO2_IrhIeXDfWjO2pwvTMjwI8tX6TM/export/pdf"
  },
  {
    "Branch Name": "Veterinary",
    "PPT Link": "https://docs.google.com/presentation/d/1n4XF1TcPbYQ5wO0_N2r95i8Sm0zx3U8TOX7i42IS0eo/export/pdf"
  },
    ];
List<String> stringfinal = new List();
List<String> pptlinks = new List();
enum _BgProps{color1,color2}
class BranchName extends StatefulWidget{
  @override
  _BranchNameState createState() => _BranchNameState();
}

class _BranchNameState extends State<BranchName> {
  TextEditingController controller = new TextEditingController();
  ScrollController _controller;
  final key = new GlobalKey<AutoCompleteTextFieldState<String>>();
  @override
  void initState(){
    stringfinal.clear();
    pptlinks.clear();
    string.clear();
    for(int i=0;i<branchdata.length;i++)
      {
        print(branchdata[i]['PPT Link'].toString());
        string.add(branchdata[i]['Branch Name'].toString());
        pptlinks.add(branchdata[i]['PPT Link'].toString());
        stringfinal.add(branchdata[i]['Branch Name'].toString());
      }
    _controller  = ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_BgProps>()..add(_BgProps.color1,Color(0xffD38312).tweenTo(Colors.lightBlue.shade900))
      ..add(_BgProps.color2,Color(0xffA83279).tweenTo(Colors.blue.shade600));
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward,color: Colors.white,),
        onPressed: (){
          setState(() {
            _controller.animateTo(0, duration: Duration(seconds: 1), curve: Curves.bounceOut);
          });
        },
      ),
      body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              child: MirrorAnimation<MultiTweenValues<_BgProps>>(
                tween: tween,
                duration: 3.seconds,
                builder: (context,child,value){
                  return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              value.get(_BgProps.color1),
                              value.get(_BgProps.color2)
                            ]
                        )
                    ),
                  );
                },
              ),
            ),
            ListView.builder(
              controller: _controller,
              itemCount: string.length+1,
              itemBuilder: (BuildContext context,int index){
                if(index==0)
                  return Padding(
                      padding: EdgeInsets.all(30),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: AutoCompleteTextField<String>(
                          key: key,
                          controller: controller,
                          clearOnSubmit: false,
                          suggestions: stringfinal,
                          itemFilter: (item,query){
                            return item.toLowerCase().startsWith(query.toLowerCase());
                          },
                          itemSorter: (a,b){
                            return a.compareTo(b);
                          },
                          itemSubmitted: (stringitem){
                            setState(() {
                              controller.text=stringitem;
                              int i;
                              for(i=0;i<stringfinal.length;i++)
                              {
                                if(stringitem.compareTo(stringfinal[i])==0)
                                  break;
                              }
                              _controller.animateTo((60+i*150).toDouble(), duration: Duration(seconds: 1), curve: Curves.linear);
                            });
                          },
                          itemBuilder: (context,item){
                            return text(item);
                          },
                          style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w300,fontSize: 18),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            hoverColor: Colors.white,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Search Branch Name',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                          ),
                        ),
                      )
                  );
                else if(index%2==1)
                  return Padding(
                      padding: EdgeInsets.only(right: 200),
                      child: GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewer1(pptlinks[index-1])));},
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.deepOrange,Colors.orangeAccent],
                                )
                            ),
                            child:Center(child: Text(string[index-1],style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white,decoration: TextDecoration.none),),)
                        ),
                      )
                  );
                else
                  return Padding(
                      padding: EdgeInsets.only(left: 200),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>PdfViewer1(pptlinks[index-1])));
                          },
                        child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [Colors.purple,Colors.pinkAccent],
                                )
                            ),
                            child:Center(child: Text(string[index-1],style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white,decoration: TextDecoration.none),),)
                        ),
                      )
                  );
              },
            )
          ]
      ),
    );
  }
}
Widget text(String item)
{
  return Column(
    children: <Widget>[
      Text(
        item,style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        height: 1,
        color: Colors.grey,
      )
    ],
  );
}