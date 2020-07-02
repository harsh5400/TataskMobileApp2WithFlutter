import 'package:fluttertataskyapp/Helper/GlobalHelper.dart';
import 'package:fluttertataskyapp/Widget/appTheme.dart';
import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/provider/GlobalProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertataskyapp/src/Model/entity.dart';
import 'package:fluttertataskyapp/src/pages/details/VerticalmovieWidget.dart';
import 'package:fluttertataskyapp/videoplayerwidget/neeko.dart';
import 'package:provider/provider.dart';

class MoviePlayerPage extends StatefulWidget {
  final MovieEntity movie;

  MoviePlayerPage(this.movie);

  @override
  _MoviePlayerPageState createState() => _MoviePlayerPageState();
}

class _MoviePlayerPageState extends State<MoviePlayerPage> {
  VideoControllerWrapper videoControllerWrapper;

//for adding list in movie
  addContinueWatchMovie() async {
    await GlobalHelper.addMovies("cont", widget.movie);
    Provider.of<GlobalProvider>(context, listen: false).setContinueMovie();
  }

  @override
  void initState() {
    super.initState();

    //adding contine
    addContinueWatchMovie();

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);

    videoControllerWrapper = VideoControllerWrapper(DataSource.network(
        "https://bms-container.s3-ap-southeast-1.amazonaws.com/bms-destination/2013605_JWT-ROEX539-060_HD.m3u8",
        // "https://tataskyvod.pc.cdn.bitgravity.com/tataskyvod/tataskyvod-prod/cp11/HLS/Aladdin1.m3u8",
        //widget.movie.Trailer,
        displayName: "Aladdin"));

    videoControllerWrapper.addListener(() {
      setState(() {
        videoControllerWrapper.controller.play();
      });
    });
  }

  @override
  void dispose() {
    SystemChrome.restoreSystemUIOverlays();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: NeekoPlayerWidget(
                aspectRatio: 3 / 2,
                progressBarPlayedColor: Colors.pink,
                progressBarHandleColor: Colors.pink,
                onPortraitBackTap: () {
                  Navigator.pop(context);
                },
                placeholder: AspectRatio(
                  aspectRatio: 3 / 2,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.movie.screenShot.url))),
                    child: Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                videoControllerWrapper: videoControllerWrapper,
                actions: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.star_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        print("share");
                      })
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: ListView(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          widget.movie.title.toUpperCase(),
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          widget.movie.categories +
                              " | " +
                              widget.movie.year +
                              " | " +
                              widget.movie.country,
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      SizedBox(height: 20.0),

                      Center(
                          child: MyWidgets.buttonsWithOutShadow(context,
                              "View Seasons", AppTheme.secondaryButtonColor,
                              height: 48, width: 200)),

                      SizedBox(height: 25.0),

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          widget.movie.description,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      // VerticalMovieWidget(title: 'Screen', movie: widget.movie),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: VerticalMovieWidget(
                        title: 'Related Movies', movie: widget.movie),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
