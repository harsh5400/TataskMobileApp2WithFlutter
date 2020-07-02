import 'package:fluttertataskyapp/Widget/appTheme.dart';
import 'package:fluttertataskyapp/Widget/myWidgets.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Custom_DialogWidget.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  bool _obscureTextLogin = true;
  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _password, _username;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  final FocusNode _passwordNode = FocusNode();

  // void _submit() async{
  //   final form = formKey.currentState;
  //   var isOnline = await ConnectivityHelper.isOnline();
  //   if(!isOnline){
  //    MyWidgets.showAlerts(context, "No Internet Found !", "Alert!",
  //    MyStyles.alertStyles(AnimationType.grow, TextStyle(fontWeight: FontWeight.bold, color: Color(0xff8E0E00)),TextStyle(
  //     color: Colors.red,),
  //      MyStyles.getRoundedRectangleBorder(10.0,borderSide : BorderSide(color: Colors.grey)),iscloseButton: false),image: Image.asset("assets/BMSLOGO.png",height: 60.0,width: 60.0,),buttons: []);
  //     return;
  //   }

  //   if (form.validate()) {
  //     setState(() => _isLoading = true);
  //     form.save();

  //     _presenter.doLogin(_username.trim(), _password.trim());
  //   } else {
  //     MyWidgets.showAlerts(context, "No Data Found !", "Alert!",
  //    MyStyles.alertStyles(AnimationType.grow, TextStyle(fontWeight: FontWeight.bold, color: Color(0xff8E0E00)),TextStyle(
  //     color: Colors.red,),
  //      MyStyles.getRoundedRectangleBorder(10.0,borderSide : BorderSide(color: Colors.grey)),iscloseButton: false),image: Image.asset("assets/BMSLOGO.png",height: 60.0,width: 60.0,),buttons: []);
  //   }
  // }

  @override
  void initState() {
    super.initState();
  }

  // @override
  // onAuthStateChanged(AuthState state) async {

  //   var tokens = await SharedVariables.getString("token");
  //   var isOnline = await ConnectivityHelper.isOnline();
  //   print("this is login page");
  //   print(isOnline);
  //   if (state == AuthState.LOGGED_IN && mounted == true && tokens != null && isOnline) {
  //     setState(() {
  //       Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(
  //               builder: (BuildContext context) => DashBoardPage()));
  //     });
  //   }

  // }

  @override
  void dispose() {
    super.dispose();
  }
  //  @override
  // void onLoginError(String errorTxt) {
  //   setState(() => _isLoading = false);
  //   // Start AlertBox Message
  //       MyWidgets.showAlerts(context, errorTxt, "Alert!",
  //    MyStyles.alertStyles(AnimationType.grow, TextStyle(fontWeight: FontWeight.bold, color: Color(0xff8E0E00)),TextStyle(
  //     color: Colors.red,),
  //      MyStyles.getRoundedRectangleBorder(10.0,borderSide : BorderSide(color: Colors.grey)),iscloseButton: false),image: Image.asset("assets/BMSLOGO.png",height: 60.0,width: 60.0,),buttons: []); return ;
  //      // End AlertBox Message
  // }
  // @override
  // void onLoginSuccess(User user) async {

  //   setState(() => _isLoading = false);

  //   if (user == null) {
  //    // Start AlertBox Message
  //       MyWidgets.showAlerts(context, "Not Found User !", "Alert!",
  //    MyStyles.alertStyles(AnimationType.grow, TextStyle(fontWeight: FontWeight.bold, color: Color(0xff8E0E00)),TextStyle(
  //     color: Colors.red,),
  //      MyStyles.getRoundedRectangleBorder(10.0,borderSide : BorderSide(color: Colors.grey)),iscloseButton: false),image: Image.asset("assets/BMSLOGO.png",height: 60.0,width: 60.0,),buttons: []); return ;

  //      // End AlertBox Message
  //      }

  //   GlobalHelper.currentUser = user;
  //   var db = new DatabaseHelper();
  //   await db.saveUser(user);
  //   if (user != null) {
  //     var authStateProvider = new AuthStateProvider();
  //     authStateProvider.notify(AuthState.LOGGED_IN);
  //   }
  // }

  void _toggleLogin() {
    setState(() {
      _obscureTextLogin = !_obscureTextLogin;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f2227),
      body: SingleChildScrollView(
        child: Material(
          child: new Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Color(0xff1f2227)
                // image: DecorationImage(
                //   colorFilter: new ColorFilter.mode(
                //       Colors.black.withOpacity(0.08), BlendMode.dstATop),
                //   image: AssetImage('assets/images/tatskybinge1.png'),
                //   fit: BoxFit.cover,
                // ),
                ),
            child: Form(
              key: formKey,
              child: new Column(
                children: <Widget>[
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 4.3),
                    child: Center(
                      child: Hero(
                        tag: 'excredellogo',
                        child: Center(
                          child: Image.asset(
                            "assets/images/tatskybinge1.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Text(
                            "EMAIL",
                            style: AppTheme.textTheme.title.apply(
                                color: AppTheme.buildLightTheme().primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: AppTheme.buildLightTheme().primaryColor,
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
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context)
                                .requestFocus(_passwordNode),

                            onSaved: (val) => this._username = val,
                            style: TextStyle(color: Colors.white),
                            //obscureText: true,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'abc@Outlook.com',
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
                            "PASSWORD",
                            style: AppTheme.textTheme.title.apply(
                                color: AppTheme.buildLightTheme().primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                        left: 40.0, right: 40.0, top: 10.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            color: AppTheme.buildLightTheme().primaryColor,
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
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                            focusNode: _passwordNode,
                            controller: _passwordController,
                            obscureText: _obscureTextLogin,
                            //onEditingComplete: () =>  _submit(),
                            onSaved: (val) => _password = val,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: '*********',
                              hintStyle: TextStyle(color: Colors.grey),
                              suffixIcon: GestureDetector(
                                onTap: _toggleLogin,
                                child: Icon(
                                  FontAwesomeIcons.eye,
                                  size: 15.0,
                                  color: Colors.grey,
                                ),
                              ),
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
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: new FlatButton(
                          child: new Text(
                            "Forgot Password?",
                            style: AppTheme.textTheme.title.apply(
                                color: AppTheme.buildLightTheme().primaryColor),
                            textAlign: TextAlign.end,
                          ),
                          onPressed: () => {},
                        ),
                      ),
                    ],
                  ),
                  !_isLoading
                      ? Expanded(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(
                                      left: 30.0, right: 30.0, top: 0.0),
                                  child: MyWidgets.roundedButonWithSingleColor(
                                      "LOGIN", onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, "/home");
                                    //  _submit();

                                    //  _emailController.clear();
                                    // _passwordController.clear();
                                  })),

                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(
                                      left: 30.0, right: 30.0, top: 0.0),
                                  child: MyWidgets
                                      .roundedOutlineButonWithSingleColor(
                                          "LOGIN WITH BINGE", onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, "/homeBinge");
                                    //  _submit();

                                    //  _emailController.clear();
                                    // _passwordController.clear();
                                  })),
                              // SizedBox(
                              //   height: 20,
                              // ),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.pushReplacementNamed(
                              //         context, "/subscribe");
                              //   },
                              //   child: Text("Subscribe Plans",
                              //       style: TextStyle(
                              //           color: Colors.blue, fontSize: 15)),
                              // ),
                              //SizedBox(height: 20,),

                              Container(
                                padding: EdgeInsets.only(top:20),
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.only(
                                      left: 30.0, right: 30.0, top: 0.0),
                                  child: MyWidgets
                                      .roundedOutlineButonWithSingleColor(
                                          "Subscribtion installtion",
                                          onTap: () {
                                    DialogHelper.exit(context);
                                   
                                  })),
                            ],
                          ),
                        )
                      : Expanded(
                          child: Container(
                            height: 60,
                            width: 60,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.orange),
                            child: Center(
                              child: CircularProgressIndicator(
                                value: null,
                                strokeWidth: 2.0,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                              ),
                            ),
                          ),
                        )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
