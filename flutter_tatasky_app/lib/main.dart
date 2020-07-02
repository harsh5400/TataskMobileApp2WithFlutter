import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertataskyapp/src/Model/SubscriptionAppModel.dart';
import 'package:fluttertataskyapp/src/pages/InstallationMethodPage.dart';
import 'package:fluttertataskyapp/src/provider/GlobalProvider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertataskyapp/route.dart';
import 'package:fluttertataskyapp/src/provider/bloc/MovieBloc.dart';
import 'package:fluttertataskyapp/src/provider/service/MovieService.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Widget/theme_provider.dart';

// import 'src/app.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]) /*lock screen orientation*/ .then((_) {
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;

      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              darkModeOn ? Brightness.light : Brightness.dark,
          systemNavigationBarColor:
              darkModeOn ? Color(0xff1f2227) : Colors.white,
          systemNavigationBarIconBrightness:
              darkModeOn ? Brightness.light : Brightness.dark));
      runApp(
        MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (_) => ThemeProvider(
                darkModeOn ? AppTheme.darkTheme : AppTheme.lightTheme),
          ),
          ChangeNotifierProvider(
            create: (_) => GlobalProvider(),
          )
        ], child: App()),
      );
    });
  });
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
/*here generate info*/
// Mock.GenerateMock();
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BlocProvider(
      blocs: [
        Bloc((i) => MovieBloc(MovieService())),
      ],
      child: MaterialApp(
          title: "Tata Sky Binge",
          debugShowCheckedModeBanner: false,
          home: InstallationMethodPage(),//  FlashScreen(),
          routes: routes,
          theme: themeProvider.getTheme()
          //  ThemeData(
          //     fontFamily: "Raleway",

          //    scaffoldBackgroundColor: AppTheme.buildLightTheme().backgroundColor,
          //     textTheme: TextTheme(body1: TextStyle(fontSize: 16)))
          ),
    );
  }
}

class FlashScreen extends StatefulWidget {
  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen>
    with TickerProviderStateMixin {
  var _visible = false;

  startTime() async {
    var _duratiion = new Duration(milliseconds: 6000);
    return Timer(_duratiion, navigationPage);
  }

  animationLogo() async {
    return Timer(Duration(milliseconds: 4900), () {
      setState(() {
        _visible = true;

        startTime();
      });
    });
  }

  void navigationPage() async {
    Navigator.of(context).pushReplacementNamed('/login');
    // Navigator.of(context).pushReplacementNamed('/subscribe');

    // var tokens = await SharedVariables.getString("token");
    // var isOnline = await ConnectivityHelper.isOnline();
    //   print(tokens);
    // print(isOnline);

    // if (tokens != null && isOnline) {
    //   GlobalHelper.currentUser = await helper.getCurrentUser();

    //   if (GlobalHelper.currentUser != null)
    //     Navigator.of(context).pushReplacementNamed('/home');
    //   else
    //     Navigator.of(context).pushReplacementNamed('/login');
    // } else {
    //   Navigator.of(context).pushReplacementNamed('/login');
    // }
  }

  @override
  void initState() {
    super.initState();

    _visible = false;
    animationLogo();
  }

  @override
  Widget build(BuildContext context) {
    GifController controller = GifController(vsync: this);
    GifController controller2 = GifController(vsync: this);

    controller.repeat(min: 0, max: 49, period: Duration(milliseconds: 5000));
    controller2.repeat(min: 0, max: 59, period: Duration(milliseconds: 2000));

    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 30, 48, 1),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          //     Container(
          //       height: MediaQuery.of(context).size.height,
          //       decoration: BoxDecoration(
          //   color: Colors.white54,
          //   image: DecorationImage(
          //     colorFilter: new ColorFilter.mode(
          //         Colors.black.withOpacity(0.1), BlendMode.dstATop),
          //     image: AssetImage('assets/splash.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          //),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Hero(
                    //   tag: 'excredellogo',
                    //   child: Container(
                    //       child: Image.asset(
                    //         "assets/images/tatskybinge1.png",
                    //       height: 90,
                    //       )),
                    // ),
                    SizedBox(height: 20.0),
                    // CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.redAccent),),
                    //   Image.asset("assets/images/loader_2 Sec_On Loop.gif"),
                    Visibility(
                      visible: !_visible,
                      child: GifImage(
                        controller: controller,
                        image: AssetImage("assets/images/tataskySplash.gif"),
                      ),
                    ),
                    Visibility(
                      visible: _visible,
                      child: GifImage(
                        controller: controller2,
                        image: AssetImage(
                            "assets/images/loader_2 Sec_On Loop.gif"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
