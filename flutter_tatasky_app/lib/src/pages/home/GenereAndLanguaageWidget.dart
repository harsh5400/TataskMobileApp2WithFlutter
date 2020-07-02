import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/GenereLanguageModel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertataskyapp/Widget/appTheme.dart';

class GenereAndLanguageWidget extends StatelessWidget {
  
  final String title;
  

  const GenereAndLanguageWidget({Key key, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
             MyWidgets.heading(context, title, onTap: null, hideSeeAll: true),
        
          Container(
            height: 120.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: genreLanguageAndActionModel.length,
              itemBuilder: (BuildContext context ,int index){
              var  genreLanguage=genreLanguageAndActionModel[index];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal:8.0, vertical: 0.0),
                  child: Column(
                    children: <Widget>[
                      InkResponse(
                        onTap: (){},
                        child: Align(
                                alignment: Alignment.center,
                                child:  Container(
                              width: 80.0,
                              height: 80.0,
                              
                                alignment: Alignment.center,
                              child: title=='Browse by Language'?Text(genreLanguage.languagetitle,style:Theme.of(context).textTheme.bodyText1,):Icon(Icons.center_focus_strong, color: AppTheme.white,),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                   boxShadow: [
                          BoxShadow(
                            color:Theme.of(context).primaryColor,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 0.0,
                          ),
                        ],
                         border: Border.all(color:Theme.of(context).backgroundColor, width:5.0)
                              )
                          )
                              ),
                      ),
                            SizedBox(height:4.0),
                           title== 'Browse by Language'?Text(genreLanguage.languagesubtitle,style: Theme.of(context).textTheme.subtitle2,):Text(genreLanguage.genresubtitle,style: Theme.of(context).textTheme.subtitle2)
                    ],
                  ),
                );
              }
              ),
          ),
        ],
      ),
    );
  }
}