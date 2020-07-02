import 'package:fluttertataskyapp/Helper/GlobalHelper.dart';
import 'package:fluttertataskyapp/src/pages/MoviePlayerPage.dart';
import 'package:flutter/material.dart';

import 'package:fluttertataskyapp/Widget/appTheme.dart';
import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/entity.dart';
import 'package:fluttertataskyapp/src/infra/CircularClipper.dart';
import 'package:fluttertataskyapp/src/pages/details/VerticalmovieWidget.dart';



class DetailsMoviePage extends StatefulWidget {
  final MovieEntity movie;
 
  DetailsMoviePage  ({this.movie});

  @override
  _DetailsMoviePageState createState() => _DetailsMoviePageState();
}

class _DetailsMoviePageState extends State<DetailsMoviePage> with TickerProviderStateMixin{


         
  @override
  void initState() {
    super.initState();
    
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);
   /// SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    
  }

  

   @override
  void dispose() {
   // SystemChrome.restoreSystemUIOverlays();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:widget.movie==null? Center(
                   child: SizedBox(
                     height: 40,
                     width: 40,
                     child: CircularProgressIndicator(
                     valueColor: AlwaysStoppedAnimation(Colors.white),
                     ),
                   ),
                 ):
      
       Builder(
         
         builder: (context) {
           return Container(
              child:  ListView(
                      children: <Widget>[
                        
                        Stack(
                          children: <Widget>[
                            Container(
                              transform:
                                  Matrix4.translationValues(0.0, -50.0, 0.0),
                              child: ShadowClip(
                                clipper: CircularClipper(),
                                shadow: Shadow(blurRadius: 20.0),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/images/placeholder.png',
                                  height: 400.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  image: widget.movie.screenShot.url,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                IconButton(
                                  padding: EdgeInsets.only(left: 30.0),
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(Icons.arrow_back, ),
                                  iconSize: 32.0,
                                 color: Theme.of(context).iconTheme.color,
                                ),
                              
                                IconButton(
                                  padding: EdgeInsets.only(left: 30.0),
                                  onPressed: () => {},
                                  icon: Icon(Icons.star_border),
                                  iconSize: 30.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Positioned.fill(
                              bottom: 10.0,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: RawMaterialButton(
                                  padding: EdgeInsets.all(10.0),
                                  elevation: 12.0,
                                  onPressed: () {
                                        setState(() {
                              Navigator.push(
    context,
    new MaterialPageRoute(
            builder: (BuildContext context) =>
            new MoviePlayerPage(widget.movie)));
                              // videoControllerWrapper.controller.play();
                              // isPlaying = false;
                              // isReadyToPlay = true;

               });
                                     
                                     },
                                  shape: CircleBorder(),
                                  fillColor: Theme.of(context).primaryColor,
                                  child: Icon(
                                  
                                   Icons.play_arrow,
                                    size: 60.0,
                                    color: AppTheme.white,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 2.0,
                              child: IconButton(
                                onPressed: () async {

                               await   GlobalHelper.addMovies("watch", widget.movie);

                              final snackBar = SnackBar(content: Text("Added in watchlist"));
                              Scaffold.of(context).showSnackBar(snackBar);
                               
                        


                                },
                                icon: Icon(Icons.add, color: Theme.of(context).iconTheme.color,),
                                iconSize: 40.0,
                                color: AppTheme.lightText,
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 2.0,
                              child: IconButton(
                               onPressed: () async {

                               await   GlobalHelper.addMovies("fav", widget.movie);

                              final snackBar = SnackBar(content: Text("Added in Favorites"));
                              Scaffold.of(context).showSnackBar(snackBar);
                               
                        


                                },
                                icon: Icon(Icons.favorite,color: Theme.of(context).iconTheme.color),
                                iconSize: 35.0,
                                color:  Theme.of(context).iconTheme.color
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.movie.title.toUpperCase(),
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                widget.movie.categories + " | "  + widget.movie.year + " | " + widget.movie.country,
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              SizedBox(height: 20.0),
                              
                              
                              Center(child: MyWidgets.buttonsWithOutShadow(context, "View Seasons", AppTheme.secondaryButtonColor, height: 48,  width: 200)),
                              
                              SizedBox(height: 25.0),
                              
                              Container(
                                height: 120.0,
                                child: SingleChildScrollView(
                                  child: Text(
                                    widget.movie.description,
                                    style:Theme.of(context).textTheme.bodyText1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        Visibility(
                          visible: widget.movie.screenShots.length > 0,
                          child: VerticalMovieWidget(title: 'Related Movies', movie: widget.movie)),
                       
                      ],
                    ),
            
             );
         }
       )

        );




  }
}


