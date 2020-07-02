
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData;

  ThemeProvider(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData themeData) async {
    _themeData = themeData;
    notifyListeners();
  }
  

}



class AppTheme {
  //
  
  AppTheme._();
  static  const String fontName = 'Roboto';
 

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    canvasColor: Color(0xff252526),
    
    appBarTheme: AppBarTheme(
      color: Colors.white,
     textTheme: (TextTheme(headline6: TextStyle(color: Colors.pink, fontSize: 20, fontWeight: FontWeight.bold))),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
      border:  OutlineInputBorder(borderSide: BorderSide(color: Colors.black,), borderRadius: BorderRadius.circular(30)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,), borderRadius: BorderRadius.circular(30))
      
      

    ),
    hintColor: Colors.pink,
    cardTheme: CardTheme(
      color: Colors.white54,
    ),
    iconTheme: IconThemeData(
      color: Colors.black87,
    ),
 textTheme: textTheme(Colors.black)
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor:  Color(0xff1f2227),
    backgroundColor: Color(0xff1f2227),
    canvasColor: Color(0xff252526),
    hintColor: Colors.white54,
    appBarTheme: AppBarTheme(
      color: Color(0xff1f2227),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

     inputDecorationTheme: InputDecorationTheme(
      
      border:  OutlineInputBorder(borderSide: BorderSide(color: Colors.pink,), borderRadius: BorderRadius.circular(30)),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.pink,), borderRadius: BorderRadius.circular(30)),
      suffixStyle: TextStyle(color: Colors.grey)
      
      

    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    
  textTheme:  textTheme(Colors.white)
  );




  static  TextTheme textTheme(Color color) =>
   TextTheme(
    headline4: display1,
    headline5: headline,
    headline6: title.apply(color:color),
    subtitle2: subtitle.apply(color:color),
    bodyText2: body2.apply(color:color),
    bodyText1: body1.apply(color:color),
    caption: caption.apply(color:color),
  );

  static const TextStyle display1 = TextStyle( // h4 -> display1
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    
  );

  static const TextStyle headline = TextStyle( // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    
  );

  static const TextStyle title = TextStyle( // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 18,
    letterSpacing: 0.18,

    
  );

  static const TextStyle subtitle = TextStyle( // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: -0.04,
    
  );

  static const TextStyle body2 = TextStyle( // body1 -> body2
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    
  );

  static const TextStyle body1 = TextStyle( // body2 -> body1
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    
  );

  static const TextStyle caption = TextStyle( // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
     // was lightText
  );

}

// final darkTheme = ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.black,
//   brightness: Brightness.dark,
//   backgroundColor: Color(0xff1f2227),
//   accentColor: Colors.white,
//   accentIconTheme: IconThemeData(color: Colors.black),
//   dividerColor: Colors.black54,
//   scaffoldBackgroundColor: Color(0xff1f2227),
  
 
// );

// final lightTheme = ThemeData(
//   primarySwatch: Colors.grey,
//   primaryColor: Colors.white,
//   brightness: Brightness.light,
//   backgroundColor: Color(0xFFE5E5E5),
//   accentColor: Colors.black,
//   accentIconTheme: IconThemeData(color: Colors.white),
//   dividerColor: Colors.white54,
// );




