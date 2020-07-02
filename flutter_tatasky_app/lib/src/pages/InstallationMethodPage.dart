import 'package:fluttertataskyapp/Widget/appTheme.dart';
import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/SubscriptionAppModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ConformYourAddressPage.dart';

class InstallationMethodPage extends StatefulWidget {
  @override
  _InstallationMethodPageState createState() => _InstallationMethodPageState();
}

class _InstallationMethodPageState extends State<InstallationMethodPage> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset(
                "assets/images/tatskybinge1.png",
                height: 50,
              ),
              Center(
                child: Text(
                  "Installation Method",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 32.0,
                          color: AppTheme.white,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  installationMethod[selectedIndex].helpertext,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white60,
                          fontWeight: FontWeight.w500))),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                    children: installationMethod.asMap()
                        .map((index, f) => MapEntry(index, installtionmethodwidget(f, index)))
                        .values.toList()),
              ),
              MyWidgets.buttonsWithOutShadow(
                  context, "Proceed", HexColor("#5991c9"),
                  height: 48, width: 300, ontap: () {
                Navigator.of(context).pop(true);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ConformYourAddressPage()));
              }),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  //return Navigator.of(context).pop(true);
                },
                child: Text("Not Now",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.0,
                            decoration: TextDecoration.underline))),
              ),
           
           
            ],
          ),
        ],
      ),
    );
  }

  Widget installtionmethodwidget(InstallationMethod e, int index) {
    e.isSelected = index == selectedIndex;
    return Container(
      height: 120,
      padding: EdgeInsets.symmetric(vertical: 5.0),
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: HexColor('#3c4254'),
      child: ListTile(
        trailing: InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
                e.isSelected = index == selectedIndex;
              });
            },
            child: Container(
                height: 25,
                width: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: e.isSelected
                        ? HexColor('#5991c9')
                        : HexColor('#676f85')),
                child: e.isSelected
                    ? Container(
                        height: 8.0,
                        width: 8.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      )
                    : Container())),
        title: Text(e.title,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(e.description,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: 15,
                      fontWeight: FontWeight.w500))),
        ),
      ),
    );
  }
}
