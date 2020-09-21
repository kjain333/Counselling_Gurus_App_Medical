import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class UploadFile extends StatefulWidget {
  @override
  _UploadFile createState() => new _UploadFile();
}
final string = ["Allotment Letter by MCI/VCI/AYUSH","Application Form","Admit Card","Rank Card","Adhaar Card/Voter ID/Passport","Date of Birth Certificate","10+2 Marksheet","Secondary School Examination Certificate","10+2 Certificate","Character Certificate","Migration/Transfer Certificate","Gap Affidavit","Income and Caste Certificate(if applicable)"];
class _UploadFile extends State<UploadFile> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text("Verify Documents",style: GoogleFonts.aBeeZee(fontWeight: FontWeight.bold,fontSize: 23),),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("Afraid about the Counselling procedure? Make sure lack of documents doesn't stop you from getting your dream College. Our team has carefully found all the documents required for the counselling procedure. Make sure to carry all of them.", style: GoogleFonts.aBeeZee(fontSize: 13),),
            ),
            SizedBox(
              height: 20,
            ),
            MyTile(0, context),
            MyTile(1, context),
            MyTile(2, context),
            MyTile(3, context),
            MyTile(4, context),
            MyTile(5, context),
            MyTile(6, context),
            MyTile(7, context),
            MyTile(8, context),
            MyTile(9, context),
            MyTile(10, context),
            MyTile(11, context),
            MyTile(12, context),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
  Widget MyTile(int index,BuildContext context){
    return Column(
      children: <Widget>[
        Container(
          height: 2,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade300,
        ),

        Padding(
          padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Container(height: 50,width: 50,child: Icon(Icons.warning,size: 30,color: Colors.amber,)),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width-220,
                  child: Text(string[index],style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
