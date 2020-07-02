import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertataskyapp/Game/Tictoctoe/main.dart';
import 'package:fluttertataskyapp/Widget/Color.dart';
import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/SubscriptionAppModel.dart';
import 'package:fluttertataskyapp/src/pages/MySubscriptionPage.dart';
import 'package:fluttertataskyapp/src/pages/home/VerticalmovieWidget.dart';
import 'package:fluttertataskyapp/src/provider/bloc/MovieBloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SubscriptionDetailPage extends StatelessWidget {
  MovieBloc _movieBloc = BlocProvider.getBloc<MovieBloc>();
  final SubscriptionAppModel subscriptionAppModel;
  SubscriptionDetailPage(this.subscriptionAppModel);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        title:Text(this.subscriptionAppModel.title ,style:Theme.of(context).textTheme.headline6)),
      body: ListView(
     
        children:<Widget>[
        Hero(
          tag: 'hero $title',
          child: Container(
          height: MediaQuery.of(context).size.height/2.3,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          
          child: CachedNetworkImage(imageUrl: this.subscriptionAppModel.imagemainPath, placeholder: (context, url) => CircularProgressIndicator(),),
          ),
        ),
        
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children:<Widget>[
                  Text(this.subscriptionAppModel.title, style: Theme.of(context).textTheme.bodyText2),
                  SizedBox(width:10),
                  Text("|", style: Theme.of(context).textTheme.headline6),
                   SizedBox(width:10),
                    Text("Not Subscribed", style: Theme.of(context).textTheme.bodyText2),
                ]
              ),
              SizedBox(height:10),
              Text(this.subscriptionAppModel.description)
               ,SizedBox(height:20)
              ,RawMaterialButton(

               child: MyWidgets.roundedRectButton(
                "Add "+ this.subscriptionAppModel.title +" to My Subscription",
                signInGradientsblue,
                false,
                height: MediaQuery.of(context).size.width/1.1,
                ),
               onPressed: () {
                 Navigator.push(
                 context,
                  MaterialPageRoute(
                   builder: (_) => MySubscriptionPage ()
                )
                );
             } 
            ),
               
                             
            ],
          ),
        ),
         VerticalMovieWidge(
              title: subscriptionAppModel.title + " Movies",
              listMovieFlux: _movieBloc.listMoviesPopularFlux),
              SizedBox(height:20)
        ]
      ),
      
    );
  }
}