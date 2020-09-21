import 'dart:convert';
import 'dart:core';
import 'package:counselling_gurus/Pages/Student/HomePageSources/CompleteNews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'News.dart';

List<News> newsfinal = [News("AIIMS PG Entrance Result 2020 declared at aiimsexams.org","All India Institute of Medical Sciences, New Delhi has declared the result for its PG entrance exam conducted for July session admission on its official website at aiimsexams.org. The exam was conducted on June 11 for AIIMS Delhi, Bhopal, Bhubaneshwar, Jodhpur, Nagpur, Patna, Rishikesh and Raipur.Candidates whose roll number is there in the selection list are eligible for online seatallocation/Counselling. Candidates other than those who are not mentioned in the list can view their rank and percentile in the website www.aiimsexams.org after navigating through the Academic tab using their login credentials from June 19.The mock round of online subject allocation/ Counselling is expected to begin from Sunday, the 21st June 2020 followed by subsequent rounds of online subject allocation/counselling. The details will be available at www.aiimsexams.org.“Admission to various Postgraduate Courses (MD/MS/DM6Yrs/M.Ch. 6Yrs/MDS) in AIIMS New Delhi, Bhopal, Bhubaneswar, Jodhpur, Nagpur, Patna, Raipur & Rishikesh for the July 2020 Session is through Online Subject Allocation/Counselling process of AIIMS, New Delhi. All candidates are requested to familiarize themselves and follow all instructions related to online seat allocation/ counselling,” reads the official notice.There will be no counselling for Foreign/Sponsored Candidates. Click here to check AIIMS PG Entrance Merit List - ","https://www.aiimsexams.org/pdf/COUNSEL1_Rank_Wise-FINAL-NET.pdf","assets/images/new1.png"),
News("Beware of fake NTA notice on NEET-UG 2020 postponement being circulated: PIB","The Press Information Bureau (PIB) on Wednesday said that a fake WhatsApp message claiming that the NEET- UG entrance exam has been postponed to August is circulating on social media. PIB urged people to beware of this fake notice claiming to be that of NEET-UG exams.PIB has tweeted a fact-check regarding this on its official twitter handle.“Claim: A WhatsApp forward of an alleged public notice by @DG_NTA is doing rounds claiming that NEET- UG has been postponed to August. #PIBFackCheck: It’s #Fake. There is no such advisory on postponing the test. Check your info only from authentic sources,” reads the tweet.","","assets/images/new2.png"),
News("COMEDK UGET 2020 exam postponed, check fresh dates here","The Consortium of Medical, Engineering and Dental Colleges of Karnataka, or COMDEK, has postponed the COMEDK UGET 2020 exam dates to July 25, 2020. Earlier, the exam was scheduled to take place on June 26, 2020. But due to the Covid-19 situation, the consortium has decided to shift the dates ahead.The consortium has also decided to reopen the application process for UGET 2020 exams from June 14 to 17, 2020.The application correction facility has also been extended from June 1-3 to June 18-21, 2020.“In view of the health concerns due to Coronavirus, our helpline will remain closed. All queries will be answered by email only. Please address your queries to studenthelpdesk@comedk.org,” reads the statement flashing on the official website.For more details, candidates are advised to visit the official website -","https://www.comedk.org/","assets/images/new3.png"),
News("BITSAT 2020 exam schedule released, admit card from June 23","Birla Institute of Technology and Science (BITS), Pilani, has released the schedule for the Birla Institute of Technology and Science Admission Test 2020, or BITSAT 2020 on its official website.As per the schedule available on the official website, BITSAT 2020 Hall Ticket will be available to download from June 23 to August 10, 2020. Earlier, the institute had decided to conduct the BITSAT 2020 from August 6 to 10. The exam was re-scheduled to be held from May 16 to 25 but was postponed due to the nation-wide coronavirus lockdown.The test city allotment is scheduled on July 1, while the candidates will be able to choose their test date and slot on the official website from July 10 to July 16.For more details, candidates are advised to visit the official website -","https://www.bitsadmission.com/","assets/images/new4.png"),
  News("One has to study very hard for IIT? I can’t do it!","<p>To achieve anything big in life one has to put the best efforts. And when we are talking about one of the toughest exams it is surely need of time. But merely working hard is not the key. There has to be proper planning, time management, managing the course and topics properly. You also need to ensure you are tracking and analyzing your performance repeatedly by mock examinations and tests. Every student, whether it be you, your friend, people who cracked JEE in past or anyone else, have the same 24 hours in a day and it all comes to how efficiently you managed and utilized your time. You will never find time for anything. If you want time you must make it.","","assets/images/m-blog-1.png"),
  News("I joined the best coaching institute. Why would i fail?","Many people develop this misbelieve that to crack JEE coaching is a must! They believe that joining a good coaching institute will make you more compatible to crack JEE and will act as a substitute to the hard work. This is absolutely wrong!To an extent, coaching helps you in channelizing your energy and efforts in right direction, by means of experienced faculties and presenting study material, questions, content and guidelines in simplified manner. But it does not mean if you are not joining a coaching your schedule will be a mess, you will never understand the concepts or you will not be able to crack JEE! Until and unless you don’t do vast variety of questions, develop understanding for the concepts and their applications under various scenarios, you won’t be able to gain the confidence that yes you can crack JEE. Most of the students are mislead by the fancy misleading advertisements in newspapers, pamphlets, Television or any other source bragging about the success and number of selections from their institute.  JEE can be cracked without coaching as well! Remember, and mark these words, at the end of the day, there is no magic in coaching institutes which can get you selected in JEE. The magic lies in you, you are the magician and the strong will and dedicated efforts will get you there. Coaching can help you in achieving the same.","","assets/images/m-blog-2.jpg"),
  News("Questions asked in JEE are very lengthy and complex!","A lot of students have this misbelieve that the questions asked in JEE are very long and run across the page. Gone are those days when JEE used to be subjective and completely solving 2 questions out of 5 was considered good. Questions in JEE now are focused on testing your conceptual knowledge, analytical skills and through understanding of topic along with numerical abilities. You don’t believe me? Go and check the previous year questions of IIT and note how many questions were there which asked for the mathematical labor. There will be set of questions not running down more than 3-4 steps but needed strong analytical and conceptual application. In recent years, the pattern of JEE is inspired by the NCERT format as well. You will find questions related to practical applications, laboratory experiments and related terminologies. The professors working on the JEE paper are wise and well aware that they are preparing it for a 12th pass-out kid and what has to be the difficulty level.  So what should be your focus be is to strengthen the conceptual knowledge & practice practice and practice. The price of success is hard work, dedication to job at hand, and determination that whether we win or lose we have applied the best of ourselves to the task at end. ","","assets/images/m-blog-3.jpg"),
  News("I have lot of time left still. I would study later!"," It’s never too early to start. There is no gain without pain. Remember, you know yourself better than anyone else. When you give yourself proper amount of time to study and grab to concepts it yields better results. It’s not like if you don’t prepare for minimum 2 years or start some foundation course from class 5th itself you can’t crack IIT entrance.  It’s more about understanding your capabilities and efforts needed for the goal and utilizing all the available time in best manner. Start today, not tomorrow. If anything, you should have started yesterday. The earlier you start, the more time you have to mess up.","","assets/images/m-blog-4.jpg"),
  News("Reading basics are for weak students. I will solve questions!","This is a common misconception that JEE aspirants have. It’s true that you need to practice on diverse variety of questions in order to understand all possible applications and questions. But often it is seen that students try to jump to questions after completing the theory and concepts in hurry.This is highly not advisable. Jumping to questions directly in hurry will lead to weak concepts and you will also not be having clarity while solving the questions.Before you move to the questions, ensure you have well understood the concepts, formulas and applications of the various topics. A wrong concept misleads the understanding. The pattern of JEE focuses on testing your conceptual ability. If you don’t have through concepts it will be difficult to solve the questions in exam when questions are mingled up from all the chapters. There is nothing worse than a sharp image of a fuzzy concept.","","assets/images/m-blog-5.jpg"),
  News("I love physics but i hate mathematics? I will compunsate maths with physics!","This is a question a major section of JEE aspirants face! The subject you like and the subject you hate may change but there is always a subject you love studying or you perform better compared to the others. Now what should be done? Should you leave the tough subject (One you like or understand less) and focus on the interest subject? Would it give same results? The answer is NO. You might be able to compensate some part of the weak subject by scoring well in your strength subject but it won’t get the best rank possible for you. We all have habit of ignoring our weaknesses and focus on the strengths. It’s not just you, it’s all of us. We do it because it’s hard to work on weaknesses and mistakes. You have to take lot of pain to improve on the weaknesses. Give some extra time to the subject you face more difficulty in understanding. Consult and take proper guidance from the faculty at your school/coaching/tuitions. They will be able to guide you on the pattern and ways you should follow or books you should refer to.","","assets/images/m-blog-6.jpg"),
];
class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}
  final bgcolor = [
    Colors.purpleAccent,
    Colors.indigoAccent,
    Colors.lightBlueAccent,
    Colors.greenAccent,
    Colors.cyanAccent,
    Colors.orangeAccent,
    Colors.redAccent,
    Colors.white
  ];
  JsonDecoder jsonDecoder = new JsonDecoder();
  bool loader = false;
  Map<String, dynamic> jsonData;
  List<String> heading = new List(20);
  List<String> subheading = new List(20);
  int news;

class _NewsPageState extends State<NewsPage> {

  @override
  void initState() {
//    loader = true;
//    getNews();
    super.initState();
  }

//  getNews() async {
//    Uri uri = Uri.parse('http://192.168.43.70:3060/getnews');
//    http.Response response =
//        await http.get(uri, headers: {"Accept": "application/json"});
//    print(response.body);
//    if (response.statusCode == 200) {
//      setState(() {
//        jsonData = jsonDecoder.convert(response.body);
//        news = jsonData['count'];
//        for(int i=0; i<news; i++){
//          heading[i] = jsonData['item'][i]['heading'];
//          subheading[i] = jsonData['item'][i]['subheading'];
//        }
//        loader = false;
//      });
//    } else {
//      throw Exception('Failed to load data');
//    }
//  }


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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: (){
          _launchURL("https://t.me/joinchat/AAAAAEqb4HIHyUFDstk5Sg");
        },
      ),
      body:loader ? Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.orangeAccent,
        ),
      ):
      ListView.builder(
        itemCount: newsfinal.length+1,  //news + 1
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(
                height: 50,
                child: Center(
                  child: Text('TOP BLOGS',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.lightBlueAccent)),
                )
            );
          } else
            return  Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  color: bgcolor[(index==1?7:(index%7-1==-1?6:index%7-1))],
                ),
                Container(
                  //   height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
                      color: bgcolor[index%7],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CompleteNews(newsfinal[index-1])));
                      },
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 15,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: AssetImage(newsfinal[index-1].image),
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width-60,
                                child: ListTile(
                                  title: Text(
                                    newsfinal[index-1].heading,//heading[index-1]
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    newsfinal[index-1].subheading,//subheading[index-1]
                                    style: GoogleFonts.aBeeZee(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CompleteNews(newsfinal[index-1]))); //pass news as parameter and do changes in Complete News
                                  },
                                  trailing: Wrap(
                                    children: <Widget>[
                                      IconButton(
                                          icon: new Icon(
                                            Icons.content_copy,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            Clipboard.setData(ClipboardData(
                                                text:
                                                newsfinal[index-1].heading+"\n"+newsfinal[index-1].subheading));//heading[index-1],subheading[index-1]
                                            final snackBar = SnackBar(
                                                content: Text(
                                                    "Content Copied to Clipboard"));
                                            Scaffold.of(context)
                                                .showSnackBar(snackBar);
                                          }),
                                      IconButton(
                                          icon: new Icon(
                                            Icons.share,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            Share.share(
                                                newsfinal[index-1].heading+'\nDOWNLOAD OUR APP',//heading[index-1]
                                                subject: newsfinal[index-1].heading);
                                          })
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                )
              ],
            );
        },
      ),
    );
  }
}
