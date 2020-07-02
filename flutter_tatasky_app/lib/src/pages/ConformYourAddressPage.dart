import 'package:fluttertataskyapp/Widget/appTheme.dart';
import 'package:fluttertataskyapp/Widget/myWidgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../Custom_DialogWidget.dart';

class ConformYourAddressPage extends StatefulWidget {

bool isDIY;

ConformYourAddressPage({this.isDIY:false});

  @override
  _ConformYourAddressPageState createState() => _ConformYourAddressPageState();
}

class _ConformYourAddressPageState extends State<ConformYourAddressPage>
    with TickerProviderStateMixin {
  PageController controller;

  PageController _controller =
      PageController(initialPage: 0, viewportFraction: 1.0);
  @override
  void initState() {
    controller = PageController();

    super.initState();
  }

  gotoSchedulePage() {
    _controller.animateToPage(
      1,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  final GlobalKey<_ConformYourAddressPageState> expansionTile = new GlobalKey();
  String timeslot = 'Please select a time slot';
  String _selectedDate = 'DD / MM / YYYY';
  Color color = Color(0xff393f4d);
  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showRoundedDatePicker(
      context: context,
      theme: ThemeData(
        primaryColor: Color(0xff393f4d),
        accentColor: Color(0xff393f4d),
        dialogBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          caption: TextStyle(color: Colors.grey),
        ),
        disabledColor: Colors.orange,
        accentTextTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
          caption: TextStyle(color: Colors.grey),
        ),
      ),
      borderRadius: 0.0,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001),
      lastDate: DateTime(2030),
    );
    if (d != null)
      setState(() {
        _selectedDate = d.toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f2227),
      body: Stack(
        children: <Widget>[
          _bodyContent(),
          Positioned(
            //Place it at the top, and not use the entire screen
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: AppBar(
              brightness: Brightness.dark,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              elevation: 5.0,
              backgroundColor: Color(0xff1f2227).withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bodyContent() {
    return ScrollConfiguration(
      behavior: MyScrollBehavior(),
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(height: 100),
          Container(
            child: Image.asset(
              "assets/images/tatskybinge1.png",
              height: 50,
            ),
          ),
          SmoothPageIndicator(
            controller: _controller, // PageController
            count: 2,
           
            effect: ExpandingDotsEffect(
                dotHeight: 7,
                dotWidth: 7,
                dotColor: Colors.blue[200].withOpacity(0.5)),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.2,
            child: PageView(
              children: <Widget>[
                conformYourAddressWidget(),
                installationScheduleWidget(),
              
              ],
              controller: _controller,
            ),
          ),
        ],
      )),
    );
  }

// first page..
  Widget conformYourAddressWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Confirm Your Address",
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
            Center(
              child: Text(
                  "Thank you for showing interest on\n Amazon firetv stcick.Please confirm\n the following details to arrange for a\n firestick installation",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white60,
                          fontWeight: FontWeight.w500))),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Name",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
            Text(
              "Saravannan Kathen",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 16.0, color: Colors.white60)),
            ),
            SizedBox(height: 30),
            Text(
              "Address",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
            Text(
              "Flat no 112, Building Number 20, Deonar Colony\n Mankhunrd, Mumbai 400043",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 16.0, color: Colors.white60)),
            ),
            SizedBox(height: 10),
            Text(
              "*if the addresss is incorect then please reach out to our\n representatives on 18123456789",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 14.0, color: Colors.white54)),
            ),
            SizedBox(height: 30),
            Text(
              "LandMarks/ Insttructions (Optional)",
              style: GoogleFonts.lato(
                  textStyle: TextStyle(fontSize: 18.0, color: Colors.white)),
            ),
            SizedBox(height: 10),
            TextFormField(
              maxLines: 4,
              cursorColor: Colors.white,
              style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white)),
              decoration: InputDecoration(
                fillColor: Color(0xff393f4d),
                filled: true,
                focusColor: Color(0xff393f4d),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
              
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: MyWidgets.buttonsWithOutShadow(
                  context, "Proceed", HexColor("#5991c9"), height: 48, width: 300,
                  ontap: () {

                    this.widget.isDIY ? DialogHelperThankyou.exit(context) : gotoSchedulePage();
              
              }),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  //return Navigator.of(context).pop(true);
                },
                child: Text("Not Now",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                            decoration: TextDecoration.underline))),
              ),
            )
          ],
        ),
      ),
    );
  }

// end


// second page 
  Widget installationScheduleWidget() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Installation Schedule",
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
          Center(
            child: Text("Select a suitable Date and Time for\n installation",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white60,
                        fontWeight: FontWeight.w500))),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Date",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Color(0xff393f4d),
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(_selectedDate,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500),
                          )),
                      IconButton(
                        icon: Icon(
                          EvilIcons.getIconData("calendar"),
                          color: Colors.white60,
                          size: 40.0,
                        ),
                        tooltip: 'Select Date',
                        onPressed: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text("Time Slot",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
                  color: Color(0xff393f4d),
                  child: Theme(
                    data: ThemeData(
                        brightness: Brightness.dark,
                        iconTheme: IconThemeData(color: Colors.white)),
                    child: ExpansionTile(
                        backgroundColor: Color(0xff393f4d),
                        key: expansionTile,
                        title: Text(
                          this.timeslot,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500)),
                        ),
                        children: <Widget>[
                          ListTile(
                            title: const Text(
                              '10am-12pm',
                            ),
                            onTap: () {
                              setState(() {
                                this.timeslot = '10am-12pm';
                              });
                            },
                          ),
                          ListTile(
                            title: const Text('12pm-2pm'),
                            onTap: () {
                              setState(() {
                                this.timeslot = '12pm-2pm';
                              });
                            },
                          ),
                          ListTile(
                            title: const Text('2pm-4pm'),
                            onTap: () {
                              setState(() {
                                this.timeslot = '2pm-4pm';
                              });
                            },
                          ),
                          ListTile(
                            title: const Text('4pm-6pm'),
                            onTap: () {
                              setState(() {
                                this.timeslot = '4pm-6pm';
                              });
                            },
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Center(
                child: MyWidgets.buttonsWithOutShadow(
                    context, "Proceed", HexColor("#5991c9"),
                    height: 48, width: 300, ontap: () {
                   
                     DialogHelperThankyou.exit(context);                }),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    //return Navigator.of(context).pop(true);
                  },
                  child: Text("Not Now",
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.0,
                              decoration: TextDecoration.underline))),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
