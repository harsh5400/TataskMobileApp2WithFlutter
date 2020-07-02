import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertataskyapp/Game/Tictoctoe/ui/game_page.dart';
import 'package:fluttertataskyapp/Helper/GlobalHelper.dart';

import 'package:fluttertataskyapp/Widget/theme_provider.dart';
import 'package:fluttertataskyapp/src/Model/entity.dart';
import 'package:fluttertataskyapp/src/pages/Categorypage/CategoryPage.dart';
import 'package:fluttertataskyapp/src/pages/MySubscriptionPage.dart';

import 'package:fluttertataskyapp/src/pages/home/Appwidget.dart';
import 'package:fluttertataskyapp/src/pages/home/TopWidget.dart';
import 'package:fluttertataskyapp/src/pages/home/VerticalmovieWidget.dart';
import 'package:fluttertataskyapp/src/provider/GlobalProvider.dart';
import 'package:fluttertataskyapp/src/provider/bloc/MovieBloc.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../MoviesListPage.dart';
import '../SubscriptionActiveAppPage.dart';
import 'ContinueWatchingVideoWidget.dart';
import 'GenereAndLanguaageWidget.dart';

class DashBoardHomePage extends StatefulWidget {
  final bool istoptataskybing;
  DashBoardHomePage({this.istoptataskybing = false});

  @override
  _DashBoardHomePageState createState() => _DashBoardHomePageState();
}

MovieBloc _movieBloc = BlocProvider.getBloc<MovieBloc>();


class _DashBoardHomePageState extends State<DashBoardHomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var _darkTheme = true;

  double _height;
  double _width;
  int _currentIndex;

   List<MovieEntity> continueMovies ;
   
  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    Provider.of<GlobalProvider>(context, listen: false).setContinueMovie();

   
  }

 

  void onThemeChanged(bool value, ThemeProvider themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(AppTheme.darkTheme)
        : themeNotifier.setTheme(AppTheme.lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    final themeNotifier = Provider.of<ThemeProvider>(context);
   
    _darkTheme = (themeNotifier.getTheme() == AppTheme.darkTheme);
    return Scaffold(
      //  backgroundColor:Color(0xff1f2227),
      appBar: widget.istoptataskybing == true
          ? AppBar(
              title: Image.asset(
              "assets/images/tatskybinge1.png",
              height: 40,
            ))
          : null,
      key: scaffoldKey,
      drawer: buildDrawer(context, themeNotifier),
      bottomNavigationBar: bottomnavigationbar(),
      body: Container(
        height: _height,
        width: _width,
        // color: Color(0xff1f2227),
        child: IndexedStack(
          index: _currentIndex,
          children: <Widget>[
            buildHome(),
            buildSeearch(),
           
              GamePage("Tic Tak Toe"),
             MySubscriptionPage(istoptataskybing: widget.istoptataskybing),
          ],
        ),
      ),
    );
  }

  Widget buildHome() {
    
    
  
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // top carusel and menu  topWidgetMain
          widget.istoptataskybing == true && widget.istoptataskybing != null
              ? TopWidget()
              : discoveryTopWidgetMain(),

          ContinueWatchingVideoWidget(title: "Continue Watching",),
          SizedBox(height: 5.0),
          VerticalMovieWidge(
              title: 'Show We Love',
              listMovieFlux: _movieBloc.listMoviesPopularFlux),
          SizedBox(height: 20.0),

          VerticalMovieWidge(
              title: 'Binge Watch : Bear Grylls',
              listMovieFlux: _movieBloc.listMoviesMyListFlux),
          SizedBox(height: 15.0),
         
          GenereAndLanguageWidget(
            title: 'Browse by Language',
          ),
          SizedBox(height: 15.0),

          GenereAndLanguageWidget(
            title: 'Browse by Genere',
          ),
          SizedBox(height: 20.0),
          AppWidget(
            title: "",
          ),
          SizedBox(height: 20.0)
        ],
      ),
    );
  }

  Widget buildDrawer(BuildContext context, ThemeProvider themeNotifier,) {
    MovieBloc _movieBloc = BlocProvider.getBloc<MovieBloc>();
    return Drawer(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            Opacity(
              opacity: 0.75,
              child: Container(
                height: _height / 6,
                padding: EdgeInsets.only(top: _height / 20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange[200], Colors.pinkAccent],
                  ),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                    radius: 30,
                    backgroundColor: Colors.white,
                  ),
                  title: Text(
                    "Harsh Aggarwal",
                    style: TextStyle(fontSize: 25),
                  ),
                  subtitle: Text(
                    "",
                    style: TextStyle(fontSize: 13),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
            ),
            
            InkWell(
               onTap: () async{
              var watchListMovies = await GlobalHelper.geMovies("fav");
        Navigator.push(
               context,
                  MaterialPageRoute(
                   builder: (_) => MoviesListPage(
                    "Favorites" , null, loadedMovie: watchListMovies, sharedPrefenceMovieID: "watch", isShowClearButton: true
                   )));
                
              },
              child: ListTile(
                leading: Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text("Favorites"),
              ),
            ),
            
            InkWell(
              onTap: () async{
              var watchListMovies = await GlobalHelper.geMovies("watch");
        Navigator.push(
               context,
                  MaterialPageRoute(
                   builder: (_) => MoviesListPage(
                    "WatchList" , null, loadedMovie: watchListMovies, sharedPrefenceMovieID: "watch", isShowClearButton: true
                   )));
                
              },
              child: ListTile(
                leading: Icon(
                  Icons.watch_later,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text("Watchlist"),
              ),
            ),
            
             InkWell(
               onTap: (){
                 Navigator.push(
                 context,
                  MaterialPageRoute(
                   builder: (_) => CategoryPage(
                   movieCategories:_movieBloc.movieCategoryStream,
                   )));
               },
               child: ListTile(
                leading: Icon(
                  Icons.category,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text("Category"),
            ),
             ),
             InkWell(
               onTap: (){
                 Navigator.push(
                 context,
                  MaterialPageRoute(
                   builder: (_) => SubscriptionActiveAppPage(
)));
               },
               child: ListTile(
                leading: Icon(
                  Icons.subscriptions,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text("Subscription"),
            ),
             ),
             InkWell(
               onTap: (){
                 Navigator.push(
                 context,
                  MaterialPageRoute(
                   builder: (_) => GamePage(
                 "Tic toc toe",
                   )));
               },
               child: ListTile(
                leading: Icon(
                  Icons.gamepad,
                  color: Theme.of(context).iconTheme.color,
                ),
                title: Text("Tic toc toe game"),
            ),
             ),
            Divider(),
            ListTile(
                title: Text('Dark Theme'),
                contentPadding: const EdgeInsets.only(left: 16.0),
                trailing: Transform.scale(
                  scale: 0.8,
                  child: CupertinoSwitch(
                    value: _darkTheme,
                    onChanged: (bool value) {
                      setState(() {
                        _darkTheme = value;
                      });
                      onThemeChanged(value, themeNotifier);
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

// top crosel and menu
  Widget discoveryTopWidgetMain() {
    return Stack(
      children: <Widget>[
        Container(
            height: _height / 1.8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).backgroundColor
                  ]),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  blurRadius: 8.0,
                  spreadRadius: 4,
                  offset: Offset(0.0, 0.0),
                  color: Colors.black,
                )
              ],
            ),
            child: TopWidget()),

        //round icons
        Container(
         
          height: 120,
          margin: EdgeInsets.only(top:_height -500),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Theme.of(context).backgroundColor
                ]),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  blurRadius: 80.0,
                  spreadRadius: 4.0,
                  offset: Offset(0.0, 0.0),
                  color: Theme.of(context).backgroundColor)
            ],
          ),

          child: SubscriptionApp(title: ''), //AppWidget(  title: '',)
        ),

        //top bars
        Container(
            //color: Colors.blue,
            margin: EdgeInsets.only(left: 20, right: 20, top: _height / 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        scaffoldKey.currentState.openDrawer();
                      },
                      child: IconTheme(
                          data: IconThemeData(color: Colors.white),
                          child: Icon(
                            Icons.menu,
                            size: 30,
                            color: Colors.white,
                          )),
                    )),
                //top icons
                Flexible(
                  child: Container(
                    height: _height / 17,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/tatskybinge1.png",
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentIndex = 1;//search tab
                      });
                    },
                    child: IconTheme(
                        data: IconThemeData(color: Colors.white),
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: _height / 20,
                        ))),
              ],
            )),
      ],
    );
  }

  Widget bottomnavigationbar() {
    return Theme(
      data: Theme.of(context).copyWith(textTheme: Theme.of(context).textTheme),
      child: BottomNavigationBar(
        //currentIndex: _cIndex,
        backgroundColor: Theme.of(context).backgroundColor,
        selectedLabelStyle: TextStyle(color: Theme.of(context).accentColor),
        selectedIconTheme: IconThemeData(color: Theme.of(context).accentColor),
        unselectedIconTheme:
            IconThemeData(color: Theme.of(context).iconTheme.color),
        // unselectedLabelStyle: TextStyle( color:Theme.of(context).bottomAppBarColor),
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              title:  Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
              ),
              title: new Text(
                'Explore',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.games,
              ),
              title: new Text('Mind Blowm')),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.subscriptions,
              ),
              title: new Text('Subscriptions'))
        ],
      ),
    );
  }

  buildSeearch() {
    
    return Scaffold(
     appBar: widget.istoptataskybing ? null: AppBar(
       title: Text("Search"),
      ),
     
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          style: Theme.of(context).textTheme.bodyText1,
          
          decoration: InputDecoration(
          
         
          hintText: "Search",
          suffixIcon: Icon(FontAwesomeIcons.search, color: Colors.grey,)
          
        

          

          ),
        
          

        ),
      ),
    );
  }
}
