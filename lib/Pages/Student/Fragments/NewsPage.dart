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

List<News> newsfinal = [News("Admission to Indian Veterinary Research Institute (I.V.R.I) Bareilly)","I.V.R.I the premier institute is known for its veterinary education which had been established as Imperial Bacteriological Lab in Mukteshawar. The Institute is 133 old having five regional stations across India. It is one of the deemed universities of I.C.A.R. The I.V.R.I. is offering P.G and Ph.D. education in India but in the year 2015 I.V.R.I started the UG with 20 seats with special perks and facility to the students. The lowest fees with a handsome scholarship are the main element of I.V.R.I. Now 24 seats are available with seat distribution as 12 unreserved, 2 E.W.S, 06 O.B.C, 04 S.C, 02 S.T. I.V.R.I forms are available on their website in the month of August followed by on spot counseling.","http://www.ivri.nic.in/","assets/images/college-blog-temp.png"),
  News("Admission to BHU","BHU has faculty of Veterinary Science which has 60 seats for the B.V.Sc&A.H course. The college is new and opened in the year 2014. The college is equipped with good faculty and infrastructure. The BHU uses the NEET score, all seats are open to Indian National and no state quota is required. The application is filled in two phases. The forms are available in the month of Jan and Feb for filling the initial form (First Phase). After the NEET result is declared the student needs to update its score on the admission website followed by on spot counseling on the campus.","http://bhuonline.in/","assets/images/college-blog-temp.png"),
  News("Admission to 15% AIQ","Veterinary Cousncil of India conducts counseling for the 15% AIQ through an online portal. Student needs to upload NEET score for the admission purposes. The students selected with V.C.I. entitled with 3000 per month scholarship for the college located in the non-domicile state.","http://aipvt.vci.nic.in/","assets/images/college-blog-temp.png"),
  News("Admission to J&K Union Territory","The union territory has 2 functional universities which offer admission in B.V.Sc.& A.H. course. These university grants admission to only the domiciled students of J&K and Ladakh union territory. However, the non-domicile students are granted admission to these universities on N.R.I. sponsored seats that have annual fees of 2.5 LPA.\nUniversities name are:\n1. SKAUST JAMMU\nhttp://skuast.org\n2. SKAUST Kashmir","http://www.skuastkashmir.ac.in/","assets/images/college-blog-temp.png"),
  News("Admission to Punjab","GADVASU is the university which affiliates three colleges for the admission to B.V.Sc& A.H. course. The 85% state quota seats of government colleges are filled through GADVASU entrance, 15% AIQ seats are filled through VCI (AIPVT). There are management quota seats is Khalsa college of veterinary science which is filled through GADVASU entrance and no Punjab Domicile is required for it.\n1. COLLEGE OF VETERINARY SCIENCE LUDHIANA\n2. COLLEGE OF VETERINARY SCIENCE RAMPURA PHUL\n3. KHALSA COLLEGE OF VETERINARY SCIENCE AMRITSAR (PRIVATE)","https://www.gadvasu.in/","assets/images/college-blog-temp.png"),
  News("Admission to Haryana","LUVAS is the university which affiliates two colleges for the admission in B.V.Sc&A.H. course.  The 85% of state quota seats are filled through LUVAS which is using NEET score for admission purposes. 15% AIQ seats are filled through VCI (AIPVT). There are management quota seats is IIVER Rohtak which is filled through LUVAS and no Haryana Domicile is required for it.\n1. College of Veterinary Science Hissar\n2. International Institute of Veterinary Education and Research Rohtak (Private)","https://www.luvas.edu.in/","assets/images/college-blog-temp.png"),
  News("Admission to Himachal Pradesh","Dr. G.C. Negi College of veterinary science offers admission to B.V.Sc. & A.H. course. The 85% state quota seats are filled through state entrance. 15% AIQ seats are filled through VCI (AIPVT).","http://www.hillagric.ac.in/index/admission/admission.html","assets/images/college-blog-temp.png"),
  News("Admission to Uttarakhand","College of veterinary science offers admission to B.V.Sc. & A.H. course. The 85% state quota seats are filled through state entrance. 15% AIQ seats are filled through VCI (AIPVT).","http://www.gbpuat.in/","assets/images/college-blog-temp.png"),
  News("Admission to Uttar Pradesh","There are three universities offering B.V.Sc&A.H course. The 85% state quota seats are filled through state entrance in DUVASU Mathura and UPCATET in NDUAT Faizabad & SVPUA&T Meerut. 15% AIQ seats are filled through VCI (AIPVT).\n1. DUVASU Mathura https://www.upvetuniv.edu.in/\n2. NDUSAT FAIZABAD https://www.nduat.org/\n3. SVPUA &T MEERUT","https://upcatet.org/","assets/images/college-blog-temp.png"),
  News("Admission to Rajasthan","RAJUVAS is the university which affiliates six colleges for the admission to B.V.Sc& A.H. course. The 85% state quota seats of government colleges are filled through RAJUVAS entrance, 15% AIQ seats are filled through VCI (AIPVT). There are management quota seats in three of its private veterinary college which is filled through RAJUVAS entrance and no Rajasthan Domicile is required for it.\n1. College of Veterinary Science Bikaner\n2. College of Veterinary Science Udaipur\n3. Postgraduate Institute of Veterinary Education and Research Jaipur\n4. Arawali Veterinary College Sikar (Private)\n5. Apollo Veterinary College Jaipur (Private)\n6. MAHATMA JYOTIBA PHULE COLLEGE OF VETERINARY AND ANIMAL SCIENCE, CHOMU (Private)"," http://rajuvas.org/","assets/images/college-blog-temp.png"),
  News("Admission to Madhya Pradesh","NDVSU is the university which affiliates three colleges for the admission to B.V.Sc& A.H. course. The 85% state quota seats of government colleges are filled through NDVSU entrance, 15% AIQ seats are filled through VCI (AIPVT).\n1. College of Veterinary Science Jabalpur\n2.  College of Veterinary Science Mhow\n3. College of Veterinary Science Rewa","ndvsu.org","assets/images/college-blog-temp.png"),
  News("Admission to Gujrat","There are four universities offering admission to B.V.Sc& A.H. course. The 85% state quota seats are filled through GUJCET, 15% AIQ seats are filled through VCI\n1. ANAND AGRICULTURAL UNIVERSITY, ANAND – 388110, GUJARAT.\n2. S.K. NAGAR DANTIWADA AGRICULTURAL UNIVERSITY, SARDAR KRUSHINAGAR – 385506, GUJARAT\n3. NAVSARI AGRICULTURAL UNIVERSITY, NAVSARI – 396450, GUJARAT\n4. JUNAGADH AGRICULTURAL UNIVERSITY, JUNAGADH, - 362 001, GUJARAT","https://gujcet.gseb.org/","assets/images/college-blog-temp.png"),
  News("Admission to Maharashtra","MAFSU is the veterinary the university which affiliates 5 colleges for the admission in the B.V.Sc&A.H. course. The 85% state quota seats are filled through MHCET(NEET SCORE), 15% AIQ seats are filled through VCI.\n1. COLLEGE OF VETERINARY & ANIMAL SCIENCES, PARBHANI MAHARASHTRA\n2. NAGPUR VETERINARY COLLEGE, SEMINARY HILLS, NAGPUR\n3. BOMBAY VETERINARY COLLEGE, PAREL, MUMBAI , MAHARASHTRA\n4. COLLEGE OF VETERINARY AND ANIMAL SCIENCES, UDGIR\n5. K.N.P. COLLEGE OF VETERINARY SCIENCE, POST – SHIRWAL, DISTT.SATARA","http://cetcell.mahacet.org/","assets/images/college-blog-temp.png"),
  News("Admission to Goa","There is no college in Goa but Goa domicile students apply in Maharashtra and Puducherry seats are reserved for the Goa domicile students."," ","assets/images/college-blog-temp.png"),
  News("Admission to Karnataka","The KVAFSU affiliates five colleges for the admission in the B.V.Sc&A.H. course. The 85% state quota seats are filled through KEA(NEET SCORE), 15% AIQ seats are filled through VCI.\n1. VETERINARY COLLEGE, HEBBAL, BANGALORE - 560 024.\n2. VETERINARY COLLEGE, NANDINAGAR BIDAR - 585 401, KARNATAKA\n3. VETERINARY COLLEGE, VINOBA NAGAR, P.B. NO. 53, SHIVAMOGGA - 577204, KARNATAKA\n4. VETERINARY COLLEGE, GOKULA, VIDYANAGAR, HASSAN -573202, KARNATAKA\n5. VETERINARY COLLEGE GADAG","https://cetonline.karnataka.gov.in/kea/","assets/images/college-blog-temp.png"),
  News("Admission to Kerala","Kerala Veterinary and Animal Science University affiliates two colleges for the admission in the B.V.Sc&A.H. course. The 85% state quota seats are filled through Kerala CEE (NEET SCORE) , 15% AIQ seats are filled through VCI.\n1. COLLEGE OF VETERINARY & ANIMAL SCIENCES, MANNUTHY, P.O., TRISSSUR - 680651, KERALA\n2. COLLEGE OF VETERINARY AND ANIMAL SCIENCES, POOKOT, LAKKIDI P.O., WAYANAD - 673576 KERALA","http://www.cee-kerala.org/","assets/images/college-blog-temp.png"),
  News("Admission to Tamil Nadu","TANUVAS affiliates four colleges for the admission to the B.V.Sc&A.H. course. The 85% state quota seats are filled through marks obtained in class 12 and the application forms are available on the TANUVAS website. 15% AIQ seats are filled through VCI\n1. Madras Veterinary College Chennai\n2. V.C.R.I Namakkal\n3. V.C.R.I Orathanadu\n4. V.C.R.I Tirunelveli","http://www.tanuvas.ac.in/","assets/images/college-blog-temp.png"),
  News("Admission to Andhra Pradesh","Sri Venkateswara Veterinary University affiliates four colleges for the admission in the B.V.Sc&A.H. course. The 85% state quota seats are filled through  AP EAMCET (NEET SCORE), 15% AIQ seats are filled through VCI.\n1. College of Veterinary Science Tirupati\n2. NTR College of Veterinary Science Gannavaram\n3. College of Veterinary Science Prodattur\n4. College of Veterinary Science Garividi","https://apeamcet.nic.in/","assets/images/college-blog-temp.png"),
  News("Admission to Telangana","P V Narsimha Rao Veterinary University affiliates three colleges for the admission in the B.V.Sc&A.H. course. The 85% state quota seats are filled through PVNR VETERINARY UNIVERSITY (NEET SCORE) , 15% AIQ seats are filled through VCI.\n1. College of Veterinary Science Hyderabad\n2. College of Veterinary Science Warangal\n3. College of Veterinary Science Kortula","http://tsvu.nic.in/faculty.aspx","assets/images/college-blog-temp.png"),
  News("Admission to Odisha","OUAT affiliates one college for the admission in the B.V.Sc&A.H. course. The 85% state quota seats are filled through OUAT state entrance, 15% AIQ seats are filled through VCI.\n1. College of Veterinary Science and Animal Husbandry Bhubaneshwar","http://www.ouat.nic.in/profile","assets/images/college-blog-temp.png"),
  News("Admission to West Bengal","WBUAFS affiliates one college for the admission in the B.V.Sc&A.H. course. The 85% state quota seats are filled through the WBUAFS website (NEET Score), 15% AIQ seats are filled through VCI.\n1. College of Veterinary Science Kolkata","http://www.wbuafsce.org/index.php ","assets/images/college-blog-temp.png"),
  News("Admission to Chhattisgarh","Chhattisgarh Kamdhenu University affiliates two colleges for the admission in the B.V.Sc&A.H course. The seats are filled through Chhattisgarh Kamdhenu University (NEET Score\n1. College of Veterinary Science Durg\n2. College of Veterinary Science Bilaspur","http://cgkv.ac.in/Default.aspx","assets/images/college-blog-temp.png"),
  News("Admission to Jharkhand","Birsa Agricultural University affiliates one college for the admission in the B.V.Sc&A.H course. The seats are filled through Jharkhand Combined Entrance Competitive Board (NEET Score)\n1. Ranchi Veterinary College","http://jceceb.jharkhand.gov.in/","assets/images/college-blog-temp.png"),
  News("Admission to Bihar","BASU affiliates one college for the admission in the B.V.Sc&A.H course. The seats are filled through Bihar Combined Entrance Competitive Board (NEET Score)\n1. The website of Bihar Veterinary College Patna","https://bceceboard.bihar.gov.in/","assets/images/college-blog-temp.png"),
  News("Admission to Assam","AAU affiliates two colleges for admission in the B.V.Sc&A.H. course. The 85% state quota seats are filled through AAU state entrance, 15% of AIQ seats are filled through VCI.\nNote: other northeastern states have some seat reservation in AAU\n1. Faculty of Veterinary Science Khannapara\n2. Lakhimpur Veterinary College","http://www.aau.ac.in/","assets/images/college-blog-temp.png"),
  News("Admission to Puducherry","RIVER affiliates one college for the admission in the B.V.Sc&A.H. course. The 85% state quota seats are filled through CENTAC , 15% AIQ seats are filled through VCI.\nNote: 2 Indian nationals seats are also available filled through CENTAC","https://www.centacpuducherry.in/","assets/images/college-blog-temp.png"),
  News("Admission to North Eastern State","Central Agricultural University Imphal Manipur affiliates two colleges and Tripura University affiliates one college grants admission to different northeastern states students on the basis of university entrance and there is 15% AIQ seats that are filled through VCI.\n1. College of Veterinary Science Selishah Imphal (CAU)\n2. College of Veterinary Science Nagaland (CAU)\nhttps://www.cau.ac.in/\n3. College of Veterinary ScienceAgartala (Tripura University)","https://www.tripurauniv.ac.in/","assets/images/college-blog-temp.png"),
  News("AIIMS PG Entrance Result 2020 declared at aiimsexams.org","All India Institute of Medical Sciences, New Delhi has declared the result for its PG entrance exam conducted for July session admission on its official website at aiimsexams.org. The exam was conducted on June 11 for AIIMS Delhi, Bhopal, Bhubaneshwar, Jodhpur, Nagpur, Patna, Rishikesh and Raipur.Candidates whose roll number is there in the selection list are eligible for online seatallocation/Counselling. Candidates other than those who are not mentioned in the list can view their rank and percentile in the website www.aiimsexams.org after navigating through the Academic tab using their login credentials from June 19.The mock round of online subject allocation/ Counselling is expected to begin from Sunday, the 21st June 2020 followed by subsequent rounds of online subject allocation/counselling. The details will be available at www.aiimsexams.org.“Admission to various Postgraduate Courses (MD/MS/DM6Yrs/M.Ch. 6Yrs/MDS) in AIIMS New Delhi, Bhopal, Bhubaneswar, Jodhpur, Nagpur, Patna, Raipur & Rishikesh for the July 2020 Session is through Online Subject Allocation/Counselling process of AIIMS, New Delhi. All candidates are requested to familiarize themselves and follow all instructions related to online seat allocation/ counselling,” reads the official notice.There will be no counselling for Foreign/Sponsored Candidates. Click here to check AIIMS PG Entrance Merit List - ","https://www.aiimsexams.org/pdf/COUNSEL1_Rank_Wise-FINAL-NET.pdf","assets/images/new1.png"),
News("Beware of fake NTA notice on NEET-UG 2020 postponement being circulated: PIB","The Press Information Bureau (PIB) on Wednesday said that a fake WhatsApp message claiming that the NEET- UG entrance exam has been postponed to August is circulating on social media. PIB urged people to beware of this fake notice claiming to be that of NEET-UG exams.PIB has tweeted a fact-check regarding this on its official twitter handle.“Claim: A WhatsApp forward of an alleged public notice by @DG_NTA is doing rounds claiming that NEET- UG has been postponed to August. #PIBFackCheck: It’s #Fake. There is no such advisory on postponing the test. Check your info only from authentic sources,” reads the tweet."," ","assets/images/new2.png"),
News("COMEDK UGET 2020 exam postponed, check fresh dates here","The Consortium of Medical, Engineering and Dental Colleges of Karnataka, or COMDEK, has postponed the COMEDK UGET 2020 exam dates to July 25, 2020. Earlier, the exam was scheduled to take place on June 26, 2020. But due to the Covid-19 situation, the consortium has decided to shift the dates ahead.The consortium has also decided to reopen the application process for UGET 2020 exams from June 14 to 17, 2020.The application correction facility has also been extended from June 1-3 to June 18-21, 2020.“In view of the health concerns due to Coronavirus, our helpline will remain closed. All queries will be answered by email only. Please address your queries to studenthelpdesk@comedk.org,” reads the statement flashing on the official website.For more details, candidates are advised to visit the official website -","https://www.comedk.org/","assets/images/new3.png"),
News("What is the detailed NEET seat allotment process?","In the points that follow medical aspirants can check for the detailed seat allotment process of NEET 2020\n•	Firstly, medical aspirants will have to register themselves for the counselling of NEET and make payment for the counselling fee\n•	Next, candidates will have to fill and lock choices of college and course on the basis of their preference\n•	Then the authorities will publish seat allotment for the first round of NEET counselling 2020\n•	Such candidates who have been allotted a seat will have to report at the allotted college for document verification and completion of admission process. Here, medical aspirants will also have free entry/exit option details of which are provided below\n•	The authorities will then publish the seat matrix of vacant seats college wise following which registrations for the second round of NEET 2020 counselling will begin. All those candidates who have already registered themselves need not register again. Such candidates will only have to re-arrange or shuffle their choices if required\n•	Next, the authorities will publish seat allotment for round 2 of counselling of NEET. Here also candidates will be allowed to exit but only after forfeiture of security money\n•	Finally candidates will have to report to the allotted colleges. It must be noted that such candidates who join the college at this stage will not be allowed to vacate the seat under any circumstances\n•	The authorities will conduct only two rounds of NEET counselling 2020 for AIQ seats and no mop-up round","","assets/images/m-blog-2.jpg"),
  News("What is the process of allotment of seats in Deemed/Central Universities for the mop-up round?","For the mop-up round of counselling below mentioned procedure will be followed\n•	Apart from the already registered candidates others will have to register themselves for the mop-up round of NEET 2020 counselling\n•	Candidates will then have to fill and lock choices following which the seat allotment will be published\n•	Medical aspirants will then have to report to the allotted colleges\nIf seats remain vacant a stray vacancy round will be conducted for which DGHS will send 10 times the number of vacant seats to colleges for the stray vacancy round. Candidates will not be allowed to do fresh registrations for the same. Deemed/Central Universities will conduct the final stray vacancy round.","","assets/images/m-blog-1.png"),
News("Who is eligible for the second round of counselling?","Candidates can check the points that follow for answer to the above mentioned question:\n•	Group I - Those registered candidates who were not allotted any seat in the first round of NEET 2020 counselling\n•	Group II - Those candidates who have registered themselves and secured a seat under reserved quota but their allotted seat got cancelled during first round of document verification will be eligible for second round. The allotment of seat to them will be with changed category provided there is availability of seats.\n•	Group III - Medical aspirant who reported to their allotted college after first round of counselling of NEET and have submitted their willingness for seat-upgradation\n•	Group IV - Such candidates to whom seat was allotted but they did not join\n•	Group V - Those candidates who have surrendered the seat allotted to them in the first round of NEET counselling 2020","","assets/images/m-blog-3.jpg"),
 News("I have lot of time left still. I would study later!"," It’s never too early to start. There is no gain without pain. Remember, you know yourself better than anyone else. When you give yourself proper amount of time to study and grab to concepts it yields better results. It’s not like if you don’t prepare for minimum 2 years or start some foundation course from class 5th itself you can’t crack IIT entrance.  It’s more about understanding your capabilities and efforts needed for the goal and utilizing all the available time in best manner. Start today, not tomorrow. If anything, you should have started yesterday. The earlier you start, the more time you have to mess up.","","assets/images/m-blog-4.jpg"),
  News("Reading basics are for weak students. I will solve questions!","This is a common misconception that JEE aspirants have. It’s true that you need to practice on diverse variety of questions in order to understand all possible applications and questions. But often it is seen that students try to jump to questions after completing the theory and concepts in hurry.This is highly not advisable. Jumping to questions directly in hurry will lead to weak concepts and you will also not be having clarity while solving the questions.Before you move to the questions, ensure you have well understood the concepts, formulas and applications of the various topics. A wrong concept misleads the understanding. The pattern of JEE focuses on testing your conceptual ability. If you don’t have through concepts it will be difficult to solve the questions in exam when questions are mingled up from all the chapters. There is nothing worse than a sharp image of a fuzzy concept.","","assets/images/m-blog-5.jpg"),
  News("I love chemistry but i hate physics? I will compensate physics with biology and chemistry!","This is a question a major section of NEET aspirants face! The subject you like and the subject you hate may change but there is always a subject you love studying or you perform better compared to the others. Now what should be done? Should you leave the tough subject (One you like or understand less) and focus on the interest subject? Would it give same results? The answer is NO. You might be able to compensate some part of the weak subject by scoring well in your strength subject but it won’t get the best rank possible for you. We all have habit of ignoring our weaknesses and focus on the strengths. It’s not just you, it’s all of us. We do it because it’s hard to work on weaknesses and mistakes. You have to take lot of pain to improve on the weaknesses. Give some extra time to the subject you face more difficulty in understanding. Consult and take proper guidance from the faculty at your school/coaching/tuitions. They will be able to guide you on the pattern and ways you should follow or books you should refer to.","","assets/images/m-blog-6.jpg"),
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
