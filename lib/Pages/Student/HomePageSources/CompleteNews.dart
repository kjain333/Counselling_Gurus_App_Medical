import 'package:counselling_gurus/Pages/Student/Fragments/News.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
class CompleteNews extends StatelessWidget{
  CompleteNews(this.news);
  final News news;
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SingleChildScrollView(
          child: ColumnSuper(
            innerDistance: -50,
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: new AssetImage(news.image),
                      fit: BoxFit.fill,
                    )
                ),
              ),
              Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
                  elevation: 20,
                  color: Colors.blue,
                  child: Container(
                    height: 100,
                  ),
               ),
               SingleChildScrollView(
                 child: Material(
                  //shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))),
                  elevation: 20,
                  color: Colors.blue,
                  child:SingleChildScrollView(
                    child: Container(
                    height: MediaQuery.of(context).size.height-300,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Center(
                           child: Text(news.heading,style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),),
                          ),
                            trailing: Wrap(

                              children: <Widget>[
           /*                     IconButton(
                                    icon: new Icon(Icons.content_copy,color: Colors.amber,),
                                    onPressed: (){
                                      Clipboard.setData(ClipboardData(text: news.heading+"\n"+news.subheading));
                                      final snackBar = SnackBar(content: Text("Content Copied to Clipboard"));
                                      Scaffold.of(context).showSnackBar(snackBar);
                                    }
                                ),*/
                                IconButton(
                                    icon: new Icon(Icons.share,color: Colors.amber,),
                                    onPressed: (){
                                      Share.share(news.heading+'\nDOWNLOAD OUR APP'+"\nhttps://play.google.com/store/apps/details?id=com.counsellinggurus.counselling_gurus_medical",subject: news.heading);
                                    }
                                )

                              ],
                            )
                        ),
                        SizedBox(
                          child: Padding(
                            padding: EdgeInsets.only(left: 50,right: 50),
                            child: Text(news.data,style: GoogleFonts.aBeeZee(color: Colors.white,fontWeight: FontWeight.w300,fontSize: 13),),
                        )
                        ),
                        InkWell(
                          child:Padding(
                            padding: EdgeInsets.only(left: 50,right: 50),
                            child: Text(news.link,style: GoogleFonts.aBeeZee(color: Colors.amber,fontWeight: FontWeight.w300,fontSize: 13),),
                          ),
                          onTap: (){
                            launch(news.link);
                          },
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    //color: Colors.blue,
                  ),
               ),
               ),
               ),
               ),
            ],

          ),
        )
    );
  }
}
