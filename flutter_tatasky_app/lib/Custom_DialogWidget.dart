import 'package:fluttertataskyapp/src/pages/InstallationMethodPage.dart';
import 'package:fluttertataskyapp/src/pages/home/DashBoardHomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widget/appTheme.dart';
import 'Widget/myWidgets.dart';

class DialogHelper {
 
  static exit(context) => showDialog(
      context: context, builder: (context) => ExitConfirmationDialog());
}

class ExitConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Material(
        child: Container(
          height: 450,
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xff1f2227),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              
              children: <Widget>[
                Text("You are eligible for a\n Free Amazon FireTV Stick",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 25.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600))),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Image.asset(
                    'assets/images/amzonFire_stick.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Text("+3 months of Amozon prime Video at\n no extra cost",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white60,
                            fontWeight: FontWeight.w600))),
                SizedBox(
                  height: 20,
                ),
                MyWidgets.buttonsWithOutShadow(
                    context, "I am Interested", HexColor("#5991c9"),
                    height: 48, width: 300, ontap: () {
                  Navigator.of(context).pop(true);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              InstallationMethodPage()));
                  //pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                }),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    //return Navigator.of(context).pop(true);
                  },
                  child: Text("Cancel",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 14.0,
                              decoration: TextDecoration.underline))),
                ),
              ],
            ),
          ),
        ),
      );
}

/// thanky dialog
///
class DialogHelperThankyou {
  static exit(context) =>
      showDialog(context: context, builder: (context) => ThankyouDialog());
}

class ThankyouDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Material(
        child: Container(
          height: 350,
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xff1f2227),
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Container(
                height: 60,
                width: 60.0,
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: Icon(Icons.check, color: Colors.green, size: 40.0),
              ),
              SizedBox(height: 30),
              Text("Thank You",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600))),
              SizedBox(height: 30),
              Text(
                  "You firestick will be delivered to\n Your address by 28/03/2020",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white60,
                          fontWeight: FontWeight.w500))),
              SizedBox(
                height: 20,
              ),
              MyWidgets.buttonsWithOutShadow(
                  context, "Proceed", HexColor("#5991c9"),
                  height: 48, width: 300, ontap: () {
                Navigator.of(context).pop();
                     Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              DashBoardHomePage(istoptataskybing: true,)));
              }),
            ],
          ),
        ),
      );
}
