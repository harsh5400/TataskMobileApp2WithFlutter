import 'package:fluttertataskyapp/Login/LoginAndSignUpPage.dart';
import 'package:fluttertataskyapp/Widget/TransitionPageRoute.dart';
import 'package:fluttertataskyapp/Widget/appTheme.dart';
import 'package:fluttertataskyapp/src/pages/home/DashBoardHomePage.dart';

import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor:Color(0xff1f2227),
       resizeToAvoidBottomPadding: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
         decoration: BoxDecoration(
                  color: Colors.transparent,
                  // image: DecorationImage(
                  //   colorFilter: new ColorFilter.mode(
                  //       Colors.black.withOpacity(0.08), BlendMode.dstATop),
                  //   image: AssetImage('assets/images/tatskybinge1.png'),
                  //   fit: BoxFit.cover,
                  // ),
      ),

      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
                           Container(
                       padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height / 15.9),
                        child: Center(
                           child: Hero(
                            tag: 'excredellogo',
                          child: Center(
                           child: Image.asset("assets/images/tatskybinge1.png"),
                          ),
                        ),
                        ),
                      ),
                     SizedBox(height: 30.0,),
                        Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: new Text(
                                "USER NAME",
                             style: AppTheme.textTheme.headline6.apply(color: AppTheme.buildLightTheme().primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.redAccent,
                                width: 0.5,
                                style: BorderStyle.solid),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Expanded(
                              child: TextField(
                                obscureText: true,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  hintText: 'Raj kumar',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 24.0,
                      ),
                      new Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: new Text(
                                "EMAIL",
                               style: AppTheme.textTheme.headline6.apply(color: AppTheme.buildLightTheme().primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                       Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.redAccent,
                                width: 0.5,
                                style: BorderStyle.solid),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                             Expanded(
                              child: TextField(
                                obscureText: true,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                     enabledBorder: InputBorder.none,
                                  hintText: 'abc@outlook.com',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        SizedBox(height: 24.0,),
                       Row(
                        children: <Widget>[
                          new Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child: new Text(
                                "Mobile No",
                                 style: AppTheme.textTheme.headline6.apply(color: AppTheme.buildLightTheme().primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    
                      new Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.redAccent,
                                width: 0.5,
                                style: BorderStyle.solid),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Expanded(
                              child: TextField(
                                obscureText: true,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                     enabledBorder: InputBorder.none,
                                  hintText: '9717759501',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                        SizedBox(height: 24.0,),
                       Row(
                        children: <Widget>[
                           Expanded(
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child:  Text(
                                "PASSWORD",
                               style: AppTheme.textTheme.headline6.apply(color: AppTheme.buildLightTheme().primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                       Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.redAccent,
                                width: 0.5,
                                style: BorderStyle.solid),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                             Expanded(
                              child: TextField(
                                obscureText: true,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                     enabledBorder: InputBorder.none,
                                  hintText: '*********',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              SizedBox(height: 24.0,),
                      Row(
                        children: <Widget>[
                           Expanded(
                            child:  Padding(
                              padding: const EdgeInsets.only(left: 40.0),
                              child:  Text(
                                "CONFIRM PASSWORD",
                              style: AppTheme.textTheme.headline6.apply(color: AppTheme.buildLightTheme().primaryColor),
                              ),
                            ),
                          ),
                        ],
                      ),
                       Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Colors.redAccent,
                                width: 0.5,
                                style: BorderStyle.solid),
                          ),
                        ),
                        padding: const EdgeInsets.only(left: 0.0, right: 10.0),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                             Expanded(
                              child: TextField(
                                obscureText: true,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                     enabledBorder: InputBorder.none,
                                  hintText: '*********',
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              SizedBox(height: 10.0,),
              new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: new FlatButton(
                  child: new Text(
                    "Already have an account?",
                   style: AppTheme.textTheme.headline6.apply(color: AppTheme.buildLightTheme().primaryColor),
                    textAlign: TextAlign.end,
                  ),
                  onPressed: ()  {
                  
                  Navigator.push(context, SlideBottomRoute(page: LoginAndSignUpPage()));
                  },
                ),
              ),
            ],
          ),
          
          new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                    alignment: Alignment.center,
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            color: AppTheme.buildLightTheme().primaryColor,
                            onPressed: ()  {
                            Navigator.push(
               context,
                MaterialPageRoute(
                 builder: (_) => DashBoardHomePage(
                 
                 )));
                            },
                            child: new Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                                horizontal: 20.0,
                              ),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Center(
                                    child: Text(
                                      "SIGN UP",
                                      textAlign: TextAlign.center,
                                       style: AppTheme.textTheme.headline6.apply(color: AppTheme.buildLightTheme().indicatorColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                
            
                  
          ],
        ),
      ),
    
    
      ));
 
  }
}