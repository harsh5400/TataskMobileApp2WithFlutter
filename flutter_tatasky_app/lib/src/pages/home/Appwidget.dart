
import 'package:fluttertataskyapp/src/Model/SubscriptionAppModel.dart';
import 'package:fluttertataskyapp/src/Model/entity.dart';
import 'package:fluttertataskyapp/src/pages/Categorypage/SubscriptionDetailPage.dart';
import 'package:flutter/material.dart';

import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/apppimagecollection.dart';

import '../MoviesListPage.dart';




class AppWidget extends StatelessWidget {
  // final Stream<List<MovieEntity>> listMovieFlux;

  final String title;

   AppWidget({Key key,  this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
     // margin: EdgeInsets.only(top: 20),
      child: ListView.builder(
         padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 16.0),
        scrollDirection: Axis.horizontal,
        itemCount: appImagecollection.length,
        itemBuilder: (BuildContext context, int index) {
      var image= appImagecollection[index];
         return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 8.0),
       child: Column(
         children: <Widget>[
           MyWidgets.userCircularImageNetwork(image.imagePath),
           SizedBox(height:5.0),
           Expanded(child: Text(image.title, style: Theme.of(context).textTheme.subtitle2))
         ],
       ),
         );
         
        },
      ),
    );
  }

 
}







class SubscriptionApp extends StatelessWidget {
   final Stream<List<MovieEntity>> listMovieFlux;

  final String title;

   SubscriptionApp({Key key,  this.title, this.listMovieFlux})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        title.length > 0 ? Hero(
          tag: 'hero $title',
          child: MyWidgets.heading(context, title, onTap: (){
                 
                             Navigator.push(
                     context,
                        MaterialPageRoute(
                         builder: (_) => MoviesListPage(
                          this.title ,this.listMovieFlux
                         )));
                        
                }),
        ) : Container(),
              SizedBox(height: 10,),
        Container(
          height: 100,
         // margin: EdgeInsets.only(top: 20),
          child: ListView.builder(
             padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: subscriptionApp.length,
            itemBuilder: (BuildContext context, int index) {
          var subscription= subscriptionApp[index];
             return InkWell(
               onTap: (){
                 
                    Navigator.push(
                   context,
                      MaterialPageRoute(
                       builder: (_) => SubscriptionDetailPage(
                       subscription
                       )));
               },
               child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 8.0),
           child: Column(
               children: <Widget>[
                 
                 MyWidgets.usersCircularImage(subscription.imagePath),
                 SizedBox(height:5.0),
                 //Expanded(child: Text(image.title, style: Theme.of(context).textTheme.subtitle))
               ],
           ),
               ),
             );
             
            },
          ),
        ),
      ],
    );
  }

 
}

