import 'dart:ui';

import 'package:fluttertataskyapp/LinearProgress/linear_percent_indicator.dart';
import 'package:fluttertataskyapp/src/Model/SubscriptionAppModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import 'package:fluttertataskyapp/src/Model/entity.dart';
import 'package:fluttertataskyapp/src/pages/details/DetailMoviePage.dart';


import '../src/Model/apppimagecollection.dart';
import 'Color.dart';
import 'appTheme.dart';
import 'myStyles.dart';


class MyWidgets {
  //function for Raised Button with Icon
  static Widget getRaisedOvalRoundedButton(String text, VoidCallback onPressed, Color color, Color highLightCOlor, { IconData icon}) {
    return RaisedButton(
        color: Colors.lightBlue,
        highlightColor: Colors.lightBlueAccent,
        shape: MyStyles.buttonRouded(30),
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.white,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18.0,  fontFamily: AppTheme.fontName,),
            ),
          ],
        ));
  }
 static Widget raisedbuttonRoudedWithOutIcon(String text, VoidCallback onPressed, 
      Color color, Color highLightCOlor) {
    return RaisedButton(
        color: Colors.lightBlue,
        highlightColor: Colors.lightBlueAccent,
        shape: MyStyles.buttonRouded(5),
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
           
            Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ],
        ));
  }

// Function for TextFromFiled 
  static Widget getTextField(String text, Function(String) onSaved, 
      {int maxline = 1}) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 0.0, 10.0),
        fillColor: Colors.white,
        border:  OutlineInputBorder(
              borderRadius: const BorderRadius.all(
          const Radius.circular(25.0),
        ),
              borderSide: BorderSide(style: BorderStyle.none,width: 0, )
            ),
        labelText: text,
         labelStyle: TextStyle(color: Colors.black54, fontSize: 10.0),
      ),
      maxLines: maxline,
      onSaved: onSaved,
    );
  }


static Widget getTextFields(String text, Function(String) onSaved, TextStyle style, {int maxline = 1, String hintText, TextEditingController controller,isNumeric = false}) {
    return TextFormField(
      controller: controller,
       textCapitalization: TextCapitalization.sentences,
      keyboardType: isNumeric ? TextInputType.number :  TextInputType.multiline,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
        fillColor: Colors.white,
        border:  OutlineInputBorder(
              borderRadius: const BorderRadius.all(
          const Radius.circular(25.0),
        ),
              borderSide: BorderSide(style: BorderStyle.none,width: 0, )
            ),
            
        labelText: text,
         labelStyle: style,
         hintText: hintText,
         hintStyle: TextStyle(fontFamily: AppTheme.fontName),
      ),
      maxLines: maxline,
      onSaved: onSaved,
    );
  }

// simple text filed
static Widget getsimpleTextFields(String text, Function(String) onSaved, TextStyle style,TextInputType keboard,
      {int maxline = 1,InputBorder border}) {
    return TextFormField(
      keyboardType:keboard,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        fillColor: Colors.white,
       border: border,
        labelText: text,
         labelStyle: style,
      ),
      maxLines: maxline,
      onSaved: onSaved,
    );
  }

  // Function for Setting date from Date Picker into variables
 


  static Widget getDatePicker(
      String text, Function() onTap, TextEditingController controller) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(
            filled: true,
         contentPadding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            fillColor: Colors.white,
            border:  OutlineInputBorder(
              borderRadius: const BorderRadius.all(
          const Radius.circular(25.0),
        ),
              borderSide: BorderSide(style: BorderStyle.none,width: 0, )
            ),
            labelText: text,
            labelStyle: TextStyle(color: Colors.black54,fontSize: 10.0),
            suffixIcon: Icon(
              Icons.date_range,
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }

//  static  showAlerts(BuildContext context, String msg, String title, AlertStyle alertStyle, {Image image, List<DialogButton> buttons} ) {


   

//     Alert(
//      context: context,
//      desc: msg,
//      title: title,
//      style: alertStyle,
//      buttons: buttons,
//     image: image

//    ).show();
//  } 


static  showAlertsucess(BuildContext context, String msg, {onOk : Function} ) {


   showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Success"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: onOk?? () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    
 } 

 static  showAlertfailed(BuildContext context, String msg ) {


   showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert !"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

 } 


static Widget errorWidget(String errorText){
return Center(
  child:   Column(
  
                            mainAxisAlignment: MainAxisAlignment.center,
  
                            children: <Widget>[
  
                              Image.asset(
  
                                "assets/opps-error.png",
  
                                height: 100,
  
                                width: 100,
  
                              ),
  
                              Text(
  
                                errorText,
  
                                style: TextStyle(
  
                                    color: Colors.black87,
  
                                    fontSize: 18.0,
  
                                    fontWeight: FontWeight.bold),
  
                              ),
  
                            ],
  
                          ),
);
}

// Legend widget                         
static  Widget getStatusIcon(String displayText, Color color, {String count}){

  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                          child: Text(count,style: TextStyle(fontWeight: FontWeight.bold),
                                            )
                                            ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                         color: color,
                                         )
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          displayText,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
}


static  Widget getLeaveStatusIcon(String displayText, List<Color> gradient, {String count}){

  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 38,
                                        width: 38,
                                        child: Center(
                                          child: Text(count,style: TextStyle(fontWeight: FontWeight.bold),
                                            )
                                            ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(
                                          colors: gradient,
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                         boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  offset: new Offset(0.0, 5.0),
                                  blurRadius: 7.0,
                                  spreadRadius: 0.0)
                            ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          displayText,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
}


static Widget userCircularImageNetwork(String url,{double height=70, double width=70.0 , }){
  return  Container(
                 height: height,
                width: width,
               
                decoration: BoxDecoration(
                   shape: BoxShape.circle,
                 
                  image: DecorationImage(
                  fit: BoxFit.cover,
                image: NetworkImage(url),
                  ),
                  ),
               
              );
}
static Widget usersCircularImage(String url){
  return  Container(
                 height: 70,
                width: 70,
               
                decoration: BoxDecoration(
                   shape: BoxShape.circle,
                 
                  image: DecorationImage(
                  fit: BoxFit.cover,
                image: AssetImage(url),
                  ),
                  ),
               
              );
}

static  Widget getActiveStatusIcon(String displayText, Color color, {String count}){

  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 38,
                                        width: 38,
                                        child: Center(
                                          child: Text(count,style:TextStyle(fontWeight: FontWeight.bold),
                                            )
                                            ),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: color,
                                          borderRadius: BorderRadius.circular(5),
                            //              boxShadow: <BoxShadow>[
                            //   BoxShadow(
                            //       color: Colors.black54,
                            //       offset: new Offset(0.0, 5.0),
                            //       blurRadius: 7.0,
                            //       spreadRadius: 0.0)
                            // ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          displayText,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  );
}

static Widget buttonsave(context, String title, Color color,{double width,double height, void Function () ontap}){
  return  Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 0.0),
              child: Container(
                height:height,
                width:width,
                //MediaQuery.of(context).size.width-200,
                decoration: BoxDecoration(
                  color:color,
                 
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 8,
                        offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    highlightColor: Colors.transparent,
                    onTap: ontap,
                    child: Center(
                        child: Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white,fontFamily: AppTheme.fontName),
                        ),
                    ),
                  ),
                ),
              ),
            );
}

static Widget buttonsWithOutShadow(context, String title, Color color,{double width,double height, void Function () ontap}){
  return  Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 0.0),
              child: Container(
                height:height,
                width:width,
                //MediaQuery.of(context).size.width-200,
                decoration: BoxDecoration(
                  color:color,
                 
                  borderRadius: BorderRadius.all(Radius.circular(24.0)),
                  
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(24.0)),
                    highlightColor: Colors.transparent,
                    onTap: ontap,
                    child: Center(
                        child: Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white,fontFamily: AppTheme.fontName),
                        ),
                    ),
                  ),
                ),
              ),
            );
}

         static Widget  roundButtonshavecancel(context, String name, Color color, {String count, void Function () onTap, double height  = 100}){
                                                            return  Expanded(
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(4.0),
                                                                child: Container(
                                                                  
                                                                            height: height,
                                                                            decoration: BoxDecoration(
                                                                              color:color,
                                                                              //const Color(0xff54D3C2),
                                                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                                              boxShadow: <BoxShadow>[
                                                                                BoxShadow(
                                                                                  color: Colors.grey.withOpacity(0.6),
                                                                                  blurRadius: 10,
                                                                                  offset: Offset(3, 3),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            child: Material(
                                                                              color: Colors.transparent,
                                                                              child: InkWell(
                                                                                borderRadius: BorderRadius.all(Radius.circular(24.0)),
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: onTap,
                                                                                child: Row(
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  children: <Widget>[
                                                                                   Text(
                                                                                        name,style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white,fontFamily: AppTheme.fontName, letterSpacing: -0.1,),
                                                                                      ),
                                                                                    
                                                                                   Text(
                                                                                        count,style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Colors.black87,fontFamily: AppTheme.fontName),
                                                                                      ),
                                                                                  
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                              ),
                                                            );
                                                                     
  }
   static Widget  getleavestatus(){
    return Column(
      children: <Widget>[
        Container(
          height: 250,
          child: Card(
          shape: MyStyles.getRoundedRectangleBorder(8, borderSide: BorderSide(color: Colors.grey)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 90,
                      width: 90,
                     
                      child: Card(
                         color: Colors.blue,
                         elevation: 5.0,
                      shape: MyStyles.getRoundedRectangleBorder(10, borderSide: BorderSide(color: Colors.grey)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("AL",style: TextStyle(color: Colors.white, fontFamily: AppTheme.fontName,fontWeight: FontWeight.w500),),
                            Text("11",style: TextStyle(color: Colors.white, fontFamily: AppTheme.fontName,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                     Container(
                      height: 90,
                      width: 90,
                      child: Card(
                        elevation: 5.0,
                        color: Color(0xff82d17d),
                        shape: MyStyles.getRoundedRectangleBorder(10, borderSide: BorderSide(color: Colors.grey)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("SL",style: TextStyle(color: Colors.white, fontFamily: AppTheme.fontName,fontWeight: FontWeight.w500),),
                            Text("05",style: TextStyle(color: Colors.white, fontFamily: AppTheme.fontName,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
               Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 90,
                      width: 90,
                      child: Card(
                        color: Colors.orange,
                      shape: MyStyles.getRoundedRectangleBorder(10, borderSide: BorderSide(color: Colors.grey)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("LWP",style: TextStyle(color: Colors.white, fontFamily: AppTheme.fontName,fontWeight: FontWeight.w500),),
                            Text("11",style: TextStyle(color: Colors.white, fontFamily: AppTheme.fontName,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                     Container(
                     height: 90,
                      width: 90,
                      child: Card(
                        color: Colors.pinkAccent,
                      shape: MyStyles.getRoundedRectangleBorder(10, borderSide: BorderSide(color: Colors.grey)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text("SL",style: TextStyle(color: Colors.white, fontFamily: AppTheme.fontName,fontWeight: FontWeight.w500),),
                            Text("05",style: TextStyle(color: Colors.white, fontFamily: AppTheme.fontName,fontWeight: FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
             
              ],
            ),
          ),
        )
      ],
    );

  }


// /// attendance popup
//  static void settingModalBottomSheet(context, DayViewModel dayViewModel) {
//     var checkInTime = dayViewModel.checkInTime != null
//         ? dayViewModel.checkInTime
//         : "00:00:00";
//     var checkOutTime = dayViewModel.checkOutTime != null
//         ? dayViewModel.checkOutTime
//         : "00:00:00";
//     var holidayReason =
//         dayViewModel.holidayReason != null ? dayViewModel.holidayReason : "";

//     showModalBottomSheet(
//         context: context,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20), topRight: Radius.circular(20.0))),
//         backgroundColor: Colors.white,
//         builder: (BuildContext bc) {
//           return Container(
//               height: 230,
//               // color: Colors.blue,
//               child:
//                   Column(mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                    children: < Widget>[
//                 Container(
//                   child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
                    
//                       Container(
                        
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: <Widget>[
//                             Padding(
//                               padding: const EdgeInsets.all(0.0),
//                               child: Container(
//                                 color: Colors.blue,
//                                 height: 4.0,
//                                 width: 30,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
                    
//                   ]),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 5.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       OutlineButton(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                             side: BorderSide(color: Colors.red)),
//                         borderSide: BorderSide(color: Colors.redAccent),
//                         onPressed: () {},
//                         child: Text(
//                           dayViewModel.status,
//                           style: TextStyle(
//                             color: Colors.black45,
//                             fontSize: 22.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 8.0, top: 10.0),
//                   child: Column(
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text(
//                             dayViewModel.userName,
//                             style: TextStyle(
//                                 color: Colors.black54,
//                                 fontSize: 22.0,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 2.0),
//                             child: Text(
//                               holidayReason,
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 18.0,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Column(
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Text(
//                                 "In Time",
//                                 style: TextStyle(
//                                     fontSize: 20.0,
//                                     color: Colors.green,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(right: 2.0),
//                                 child: Text(
//                                   "Out Time",
//                                   style: TextStyle(
//                                       fontSize: 20.0,
//                                       color: Colors.red,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(0.0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Container(
//                                 height: 45,
//                                 width: 180,
//                                 child: Card(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(0.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: <Widget>[
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 28),
//                                           child: Text(
//                                             checkInTime,
//                                             style: TextStyle(fontSize: 18.0),
//                                           ),
//                                         ),
//                                         Container(
//                                           margin: EdgeInsets.only(),
//                                           height: 30,
//                                           width: 30,
//                                           child: Icon(
//                                             Icons.access_time,
//                                             color: Colors.white,
//                                             size: 25,
//                                           ),
//                                           decoration: BoxDecoration(
//                                             shape: BoxShape.circle,
//                                             color:
//                                                 //Color(0xff055ba6)
//                                                 Color(0xff04d619),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                     color: Colors.lightBlue[50],
//                                      elevation: 0.0,
//                                      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
//                                 ),
//                               ),
//                               Container(
//                                 height: 45,
//                                 width: 180,
//                                 child: Card(
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(0.0),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: <Widget>[
//                                         Padding(
//                                           padding:
//                                               const EdgeInsets.only(left: 28.0),
//                                           child: Text(
//                                             checkOutTime,
//                                             style: TextStyle(fontSize: 18.0),
//                                           ),
//                                         ),
//                                         Container(
//                                           margin: EdgeInsets.only(),
//                                           height: 30,
//                                           width: 30,
//                                           child: Icon(
//                                             Icons.access_time,
//                                             color: Colors.white,
//                                             size: 25,
//                                           ),
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: Color(0xffa61a05)
//                                               //Color(0xff04d619),
//                                               ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   color: Colors.lightBlue[50],
//                                   elevation: 0.0,
//                                   shape: RoundedRectangleBorder(
//                                   borderRadius:BorderRadius.circular(20.0)),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10.0,),
//                 Padding(
//                   padding: EdgeInsets.only(left: 8.0, top: 0.0, bottom: 0.0),
//                   child: Column(
//                     children: <Widget>[
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: <Widget>[
//                           Text("Date: " + dayViewModel.date,
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 18.0,
//                               )),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 5),
//                             child: Text(
//                               "Day: " + dayViewModel.day,
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 18.0,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ]));
//         });
//   }

static Widget textBoxFeildRounded(String title, Function(String) onSaved, {int maxline = 1,String hintText,TextEditingController controller, isNumeric = false})
{
  return
  Card(
                elevation: 5.0,
                borderOnForeground: false,
                shape: MyStyles.buttonRouded(25),
                child: MyWidgets.getTextFields(
                  title,
                  onSaved,
                  TextStyle(color: Colors.black54, fontSize: 12.0),
                  maxline: maxline,
                  hintText: hintText,
                  controller: controller,
                  isNumeric:isNumeric
                ),
              );
}

static  Widget getAppBarUI(context, String title) {
    return Container(
      decoration: BoxDecoration(
        color:AppTheme.black,
        boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.grey.withOpacity(0.2), offset: Offset(0, 2), blurRadius: 4.0),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top, left: 8, right: 8),
        child: Row(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.all(
                    Radius.circular(32.0),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.close,color: Colors.white,),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Text(
                     title,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            Container(
              width: AppBar().preferredSize.height + 40,
              height: AppBar().preferredSize.height,
            )
          ],
        ),
      ),
    );
  }

  static Widget line({double height=2, Color color}){
    return Container(
                        height: height,
                        decoration: BoxDecoration(
                          color: color??AppTheme.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ));
  }
    static Widget lineVertical({double width=2,height=30.0, Color color}){
    return Container(
      width: width,
      height: height,
                       
                        decoration: BoxDecoration(
                          color: color??AppTheme.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ));
  }

static columnWithTitleAndValue(String title,String value){
  return Expanded(
    child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: <Widget>[
                   Text(title,style: TextStyle(fontFamily: AppTheme.fontName, fontSize: 13.0, fontWeight: FontWeight.w700,color: AppTheme.grey.withOpacity(0.6)),),
                   SizedBox(height: 5.0,),
                    Text(value,style: TextStyle(fontFamily: AppTheme.fontName, fontSize: 15.0, fontWeight: FontWeight.w500),)
                 ],
               ),
  );
}
  static Widget dashBoardGroupTitle(String title, {double fontSize = 18, Color fontColor}){
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      child: Text(title, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500, fontFamily: AppTheme.fontName, color: fontColor??Colors.black)));
  }


static containerWithRoundedBorderWithText(String title, {Color backgourandcolor, Color textColor, double height = 25, double paddingVal=0.0,}){
 final double padVal=paddingVal;
  return  Padding(
    padding:  EdgeInsets.all( padVal),
    child: Container(
                           height: height,
                           alignment: Alignment.centerLeft,
                           decoration: BoxDecoration(
                             color: backgourandcolor?? Colors.redAccent,
    
                             borderRadius: BorderRadius.circular(20)
    
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(5.0),
                             child: Text(title,style: TextStyle(fontSize: 12.0,fontFamily: AppTheme.fontName,color: textColor?? Colors.white ,fontWeight: FontWeight.w500)),
                           )),
  );
}

  static Widget roundedSmallTilewithTwoText(String countText, String title, {Function onTap}){
    return  InkWell(
      onTap: onTap,
      child: Container(
                           decoration: MyStyles.boxDecorationwithRoudedCorner(color: AppTheme.grey.withOpacity(0.4)),
                           height: 90,
                           width: 110,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             
                             children: 
                             [
                              Text(countText, style: TextStyle(color: Colors.yellow, fontFamily: AppTheme.fontName, fontSize: 25, fontWeight: FontWeight.w800),),
                              Text(title, style: TextStyle(color: AppTheme.nearlyWhite, fontFamily: AppTheme.fontName, fontSize: 16),),
                             ]
                           
                           ,),
                         ),
    );
  }


 static Widget containerRoundedWithText(String content ){

return Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
padding: EdgeInsets.all(8.0),
 
    constraints: BoxConstraints(
  
      minHeight: 100.0,
      minWidth:  double.infinity
  
  
  
    ),
  
    decoration: MyStyles.boxDecorationwithRoudedCorner(color: AppTheme.nearlyWhite),
  
    child: 
  
        Text(content,textAlign: TextAlign.start,),
  ),
);



 }

  static Widget containerWithRoundedIconButton({ Function onPressed, IconData iconData, double height=40, double width=40, double iconSize=18.0 } ) {
  return   Container(
                      height: height,
                      width: width,
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: leaveWithoutPaycolor,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.green[100],
                              offset: new Offset(0.0, 5.0),
                              blurRadius: 7.0,
                              spreadRadius: 0.0)
                        ],
                      ),
                      child: Center(
                        child: IconButton(
                          iconSize: iconSize,
                          onPressed: onPressed,
                          //() {

                            // formKey.currentState.save();

                            // if (formKey.currentState.validate()) {
                            //   bloc.onAddComment(this.comment);
                            // }
                            // this.controller.clear();
                         // },
                          icon: Icon(
                           iconData?? Icons.send,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
  } 
  
   static catcheNetworkImage(String imgUrl, { double height = 80.0}){
     return CachedNetworkImage(
  imageUrl: imgUrl,
  imageBuilder: (context, imageProvider) => Container(
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
         ),
    ),
  ),
  placeholder: (context, url) => Image.asset('assets/images/placeholder.png', fit:BoxFit.cover),
  errorWidget: (context, url, error) => Icon(Icons.error),
);
   }    

static Widget headrline(width){
  return Container(
                  height:1.5,
                  width: width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
             Colors.deepPurpleAccent[400],
                Colors.pink[600],
                 Colors.red[700],
            Colors.orange,
           
         
           
          ],
        ),
                  ),
                );
}

static Widget heading(context, String title, {Function onTap, bool hideSeeAll = false}){
  var width  = hideSeeAll? MediaQuery.of(context).size.width - 50 :   MediaQuery.of(context).size.width/1.5;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children:[

    Padding(
           padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(title, style: Theme.of(context).textTheme.headline6),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: hideSeeAll ? 6 : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //header line
                    headrline(width),
                Visibility(
                  visible: !hideSeeAll,
                  child: InkResponse(
                    highlightShape: BoxShape.rectangle,
                       borderRadius: BorderRadius.circular(5.0),
                       onTap: onTap,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          "View All",
                          style: TextStyle(
                            fontSize: 13.0,color: Colors.blue[600],
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: 4.0),
                         Container(
                           padding: EdgeInsets.all(5),
                          alignment: Alignment.center,
                           decoration: BoxDecoration(
                              color: Colors.blue[600],
                            borderRadius: BorderRadius.circular(50.0),
                           ),
                           child: Icon(
                             Icons.arrow_forward_ios,
                             color: AppTheme.white,
                             size: 10.0,
                           ),
                         ),
                      ],
                    ),
                  ),
                ),
               
              ],
            ),
          ),

  ]);
}   

static Widget subscriptionBox(context, SubscriptionAppModel movie, {isChecked = false}){
  return 
        Container(
         height: 110,
            margin:  EdgeInsets.all(8.0),
            decoration: BoxDecoration(
           color: Color.fromRGBO(43, 45, 65, 0.9),
              borderRadius: BorderRadius.all( Radius.circular(10.0)),
            ),
            child: Container(
               padding: EdgeInsets.only(left: 5, top: 10, right: 0, bottom: 5),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       MyWidgets.usersCircularImage(movie.imagePath),
                       Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left:15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left:5),
                                child: Text(
                                      'Prime Video',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(top:5, left: 5),
                              child: Text(
                                      '₹ 129/month',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight:
                                              FontWeight
                                                  .w400),
                                    ),
                            ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, left: 5.0),
                                child: Text(
                                  "7 day free trial",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight:
                                          FontWeight.w400),
                                ),
                              ),
                             
                              
                            ],
                          ),
                        ),
                      ),
                    
                    Visibility(
                      visible: isChecked,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: roundCheckBox(),
                      ),
                    )
                     
                      
                    ],
                  ),
                ],
              ),
            ),
            );
}

static Widget channelBox(AppImagecollection image, {bool isChecked = false}){
  return Column(
                children: <Widget>[
                  Container(
                    height: 112,
                    width: 166,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(3.0),
                     image: DecorationImage(image: AssetImage(image.imagePath)),

                    ),
                    //checked icon
                    child: Visibility(
                      visible: isChecked,
                      child: Align (
                        alignment: Alignment.topRight,
                        child:roundCheckBox()
                         ,
                      )
                    )
                    )
                ],
               );
}

static Widget roundCheckBox(){
  return Container(
                            height:25.0,
                             width:25.0,
                             alignment: Alignment.center,
                             decoration: BoxDecoration(
                               shape: BoxShape.circle,
                                color: Colors.green[600],
                              // borderRadius: BorderRadius.circular(radius)
                             ),
                            
                             child: Icon(Icons.check, color: Colors.white, size: 20.0,),
                            );
}



static Widget squareMovieDetail(MovieEntity movie, context, {double indicatarValue = 0.5, isWithPlayAndIdicator  = false}){
    return InkWell(
            onTap:(){
               Navigator.push(
               context,
                MaterialPageRoute(
                 builder: (_) => DetailsMoviePage(
                  movie:movie 
                 )));
            } ,
            child: Container(
              margin: EdgeInsets.symmetric(
                 horizontal: 8.0,
                // vertical: 20.0,
              ),
              width: 220,
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                boxShadow: [
                  BoxShadow(
                    color:Colors.black54,
                    offset: Offset(0.0, 4.0),
                    //blurRadius: 4.0,
                  ),
                ],
              ),
             
              child: Stack(
                
                children: <Widget>[
                
                 MyWidgets.catcheNetworkImage(movie.screenShot.url, height:150.0),

                 //play and icons
                 Visibility(
                   visible: isWithPlayAndIdicator,
                   child: Positioned.fill(
                     child: Align(
                       alignment: Alignment.center,
                       child:  Container(
                     width: 50,
                     height: 50,
                       alignment: Alignment.center,
                     child: Icon(Icons.play_arrow, size: 40,color: Colors.white,),
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                          boxShadow: [
               BoxShadow(
                   color:Colors.transparent,
                   offset: Offset(0.0, 4.0),
                   blurRadius: 6.0,
               ),
               ],
                       border: Border.all(color:Colors.white60, width:5.0)
                     )
               )
                     ),
                   ),
                 ),
                 Visibility(
                   visible: isWithPlayAndIdicator,
                   child: Align(
                     alignment: Alignment.bottomCenter,
                     child: Container(
        margin: EdgeInsets.only(top: 109),
        //alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
               Colors.black.withAlpha(0),
               Colors.black12,
               Colors.black45
            ],
          ),
        ),
        child:  LinearPercentIndicator(
                         //   //width: 100.0,
                           linearStrokeCap:LinearStrokeCap.butt ,
                           backgroundColor: Colors.transparent,
                           padding: EdgeInsets.symmetric(horizontal: 0.0,),
                           fillColor: Colors.white60,
                           lineHeight: 7.0,
                           percent: indicatarValue,
                           progressColor: Colors.white,
                         ),
      ),
                   ),
                 ),
                            
                ],
              ),
            ),
          );
  }

static Widget roundedRectButton(
  String title,
  List<Color> gradient,
  bool isEndIconVisible,
   { double height,}
) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment(1.0, 0.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: height??MediaQuery.of(mContext).size.width / 2.7,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(top: 16, bottom: 16),
          ),
          Visibility(
            visible: isEndIconVisible,
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: ImageIcon(
                  AssetImage("assets/ic_forward.png"),
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  });
}


 static Widget roundedButonWithSingleColor(String title, {Color color  = Colors.orange, Color textColor = Colors.white, Function onTap })
 {
   return FlatButton(
                padding: EdgeInsets.all(20),
                shape:  RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(30.0)),
                color: color,
                onPressed: onTap ?? (){},
                child:  Text(
                  title,
                  textAlign: TextAlign.center,
                  style:  TextStyle(color: textColor, fontWeight: FontWeight.bold, )
                ),
              );

 }

 static Widget roundedOutlineButonWithSingleColor(String title, {Color color  = Colors.orange, Color textColor = Colors.white, Function onTap })
 {
   return OutlineButton(
                padding: EdgeInsets.all(20),
                shape:  RoundedRectangleBorder(
                    borderRadius:  BorderRadius.circular(30.0)),
                color: Colors.white,
              borderSide: BorderSide(color: color, width: 2.0),
              
                onPressed: onTap ?? (){},
                child:  Text(
                  title,
                  textAlign: TextAlign.center,
                  style:AppTheme.textTheme.subtitle2.apply(color: textColor),
                ),
              
            );

 }



 

}



class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}


