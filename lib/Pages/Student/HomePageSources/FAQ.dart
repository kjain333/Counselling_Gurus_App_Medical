//import 'file:///C:/Users/Ralex/Desktop/Counselling_Gurus/lib/Pages/Student/HomePageSources/FAQAnswerMentor.dart';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final questions = ['Q1. How do I get an idea of the seat I am likely to be allotted on the basis of rank secured by me??',
  'Q2. If a candidate has mistakenly opted for Deemed University’s seats instead of AIQ does he/she have the option to correct it?',
  'Q3. Am I eligible to participate in the subsequent rounds of counselling if I have joined the seat allotted to me in round one of NEET counselling 2020?',
  'Q4. Do those candidates who do not join the college allotted to them in round 2 of counselling of NEET and wish to participate in the mop-up round for Deemed/Central universities need to register afresh?',
  'Q5. Which candidates are not eligible for the second round of NEET counselling 2020?',
  'Q6. After joining the college allotted to me in the second round of AIQ seats counselling can I opt to join state/private quota seats?',
  'Q7. Is fresh registration required for round 2 of counselling of NEET if I have already registered for round 1?',
  'Q8. Will the authorities enable fresh registrations for stray vacancy round?',
  'Q9. How can I retrieve the password in case I forget it?',
  'Q10. How many choices can the candidate give for college and course?',
  'Q11. What if I do not enter any choice during the choice filling process?',
  'Q12. When does the authority forfeit the security money?',
  'Q13. How is the refund of the security amount of the counselling for NEET initiated?',
  'Q14. Can upgradation facility be availed in the second round of counselling for Deemed/ Central Universities to Mop-up Round counseling of DGHS for Central / Deemed Universities?',
  'Q15. If my upgraded choice is allotted to me after round 1 do I have to join the allotted college?',
  'Q16. What will happen if I do not join the college allotted to me after upgradation?'];

final answer = ['Ans. For this candidates can refer to previous year seat allotment lists to get an indicative idea of the seat they might get allotted on the basis of their rank. However it must be noted that there is no guarantee of the same and no certainty of the data provided. Another way of knowing this is the Mock counselling and Indicative seat allotment done during the registration period of round one of counselling of NEET',
  'Ans. Yes, candidates have the one-time opportunity to correct this mistake by by using the reset initialization option which is provided at the time of NEET registration 2020',
  'Ans. Those candidates who have been allotted a college in the first round will have to join to complete the admission formalities following which they can choose to participate in the subsequent rounds and also opt for upgradation. Candidates have been provided with the facility of free entry and exit in the round 1 of NEET 2020 counselling so they can surrender the allotted seats and participate in round 2. For the aforementioned round candidates can use their login credentials of round 1. Those of them who do not join the allotted college in round 1 can also participate in round 2.',
  'Ans. Of course yes, such candidates will have to register themselves afresh for the mop-up round of counselling conducted by Deemed/Central universities. However, such candidates will have their security amount forfeited.',
  'Ans. Those candidates who have furnished incomplete or inadequate documents for the admission process of NEET 2020 will not be eligible to participate in the second round.',
  'Ans. It is a guideline by the Honorable Supreme Court that once allotted a seat in the second round of counselling, a candidate cannot vacate it. In case a candidate has been allotted a seat in round 2, they can exit by getting their security money forfeited.',
  'Ans. No, already registered candidates are not required to re-register themselves for round 2, they can use the login credentials of round 1.',
  'Ans. No, DGHS will send a list of candidates ten times the vacant seats and the Deemed/Central universities will conduct the final stray vacancy round.',
  'Ans. In order to retrieve the password candidates will have to re-enter the details filled in by them at the time of registration. This includes the answer to the security question. Candidates will then be able to set a new password for future logging purposes, provided the data entered by them matches the previously entered information.',
  'Ans. Candidates can opt for as many colleges and courses as many they want at the time of choice filling. The authorities have not put any restrictions or limits on it.',
  'Ans. In case a candidate does not enter any choice then he/she will not be allotted any college in the counselling process.',
  'Ans. In the below mentioned cases security money of candidates will be forfeited:\n•	In case the candidate is allotted a seat in the second or mop-up round and he/she does not wish to join the allotted college\n•	In a situation where the candidate furnishes incorrect or inadequate information at any step of the admission process',
  'Ans. The authorities will refund the security money at the end of the counselling process. If the candidate has been allotted a seat in NEET counselling 2020 then his/her security amount is refunded to the respective institution and is adjusted with the annual fee. In case the candidate is not allotted any seat throughout the counselling process, his/her security deposit will be refunded to the bank account, details of which were given at the time of registration.',
  'Ans. Candidates who join the college allotted to them in the second round of counselling for Deemed/Central universities will not have the upgradation facility. Also, such candidates cannot vacate the AIQ seats. Also, these candidates will no longer be eligible to participate in the further rounds of counselling including the stray round.',
  'Ans. Yes, because in such a situation the seat allotted to you in round 1 will automatically get cancelled. After seat allotment result is published candidates will have to report to the college alloted in round 2 with a relieving letter from the college allotted in round 1 of counselling of NEET.',
  'Ans. If you do not take admission to the seat allotted to you after upgradation then your security money will be forfeited and thereafter you can register yourself afresh for the mop-up round of counselling.'];
final expanded=[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false];
class FAQ extends StatefulWidget{
  static _FAQ of(BuildContext context) => context.ancestorStateOfType(const TypeMatcher<_FAQ>());
  @override
  State<StatefulWidget> createState() {
    return _FAQ();
  }
}
class _FAQ extends State<FAQ>{
  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50)),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    Text('FAQ',style: TextStyle(fontFamily: 'icons',fontWeight: FontWeight.w900,fontSize: 30,color: Colors.white),),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('Here you will find the Frequently asked Questions. Feel free to contact us if you have any another question not mentioned here.',style: GoogleFonts.aBeeZee(fontSize: 12,color: Colors.white,fontWeight: FontWeight.w100),),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return QuestionCard(index,context);
            }, childCount: questions.length),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Container(
                height: 40,
                child: RaisedButton(
                  color: Colors.purple,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text("Ask a question",style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),),
                  ),
                  onPressed: (){
                    _launchURL("https://forms.gle/8Z7Vu8FDkQLnEAGT7");
                  },
                ),
              )
            ),
          )
        ],
      )
    );

  }


Widget QuestionCard(int index,BuildContext context){
  return Padding(
    padding: EdgeInsets.all(20),
    child: Material(
      elevation: 10,
      child: ExpansionPanelList(
        expansionCallback: (int ind,bool status){
          setState(() {
            if(expanded[index]==true)
              expanded[index]=false;
            else
            {
              for(int i=0;i<questions.length;i++)
                expanded[i]=false;
              expanded[index]=true;
            }
          });
        },
        children: [
          new ExpansionPanel(
              isExpanded: expanded[index],
              headerBuilder: (BuildContext context,bool isExpanded)=>new ListTile(
                contentPadding: EdgeInsets.all(10),
               // trailing: Icon(Icons.arrow_forward),
                title: Text(questions[index],style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
                onTap: (){
                  setState(() {
                    if(expanded[index]==true)
                      expanded[index]=false;
                    else
                      {
                        for(int i=0;i<questions.length;i++)
                          expanded[i]=false;
                        expanded[index]=true;
                      }

                  });
                },
              ),
              body: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text(answer[index],style: GoogleFonts.aBeeZee(fontSize: 15,fontWeight: FontWeight.w300),),
              )
          )
        ],
      )/* ListTile(
        trailing: Icon(Icons.arrow_forward),
        title: Text(questions[index],style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.w300),),
        onTap: (){
          FAQ.of(context).create();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQAnswer(questions[index],answer)));
        },
      ),*/
    ),
  );
}

}
