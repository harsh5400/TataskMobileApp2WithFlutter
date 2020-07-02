import 'package:fluttertataskyapp/Widget/appTheme.dart';
import 'package:fluttertataskyapp/Widget/myStyles.dart';

import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/SubscriptionAppModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sticky_headers/sticky_headers.dart';


class SubscriptionActiveAppPage extends StatefulWidget {
  @override
  _SubscriptionActiveAppPageState createState() =>
      _SubscriptionActiveAppPageState();
}

class _SubscriptionActiveAppPageState extends State<SubscriptionActiveAppPage> {
  

  // PageController controller;
  PageController pageController ;
   PageController internalPageController ;
  SubscriptionPlanModel selectedSubscriptionPlanModel;
    SubscriptionPlanModel selectedAddinalSubscriptionPlanModel;

  List<SubscriptionPlanModel> subscriptionPlanModels;
   List<SubscriptionPlanModel> addinalPlansubscriptionPlanModels;
      ScrollController scrollController1;
       ScrollController scrollController2;
          ScrollController scrollController3;

  hideStatusBAr(){
    // await FlutterStatusbarManager.setHidden(true, animation:StatusBarAnimation.SLIDE);

    SystemChrome.setEnabledSystemUIOverlays([]);
   }

  @override
  void initState() {
   
   hideStatusBAr();
    super.initState();

      scrollController1 = ScrollController();

    scrollController2 = ScrollController();
        scrollController3 = ScrollController();

    scrollController1.addListener((){
      scrollController2.jumpTo(scrollController1.offset);
      scrollController3.jumpTo(scrollController1.offset);
    });

     scrollController2..addListener((){
       scrollController2.jumpTo(scrollController1.offset); //alwack with locak with svroll 1
    });

    
     scrollController3.addListener((){
       scrollController3.jumpTo(scrollController1.offset); //alwack with locak with svroll 1
    });
   

    pageController =  PageController(initialPage: 0 , viewportFraction: 1.0);
    internalPageController = PageController(initialPage: 0);
    
   
  subscriptionPlanModels = List<SubscriptionPlanModel>();
    subscriptionPlanModels.add(SubscriptionPlanModel(planNameOnly: "Basic", planPriceOnly: "199", totalApp: 5, planName: "Basic 199", planDescription: "7 days trial", planPrice: "₹ 199 / Month", type :1));
    subscriptionPlanModels.add(SubscriptionPlanModel(planNameOnly: "Standard", planPriceOnly: "299", totalApp: 7, planName: "Standard 299", planDescription: "7 days trial", planPrice: "₹  299 / Month", planPriceDescrition: "Eligible for an Amazon FTV stick Tata Sky Edition", type: 3));
    subscriptionPlanModels.add(SubscriptionPlanModel(planNameOnly: "Premium", planPriceOnly: "399", totalApp: 10, planName: "Premium 399", planDescription: "7 days trial", planPrice: "₹ 399 / Month", planPriceDescrition: "Eligible for an Amazon FTV stick Tata Sky Edition", type: 3));
    subscriptionPlanModels.add(SubscriptionPlanModel(planNameOnly: "Super", planPriceOnly: "499", totalApp: 13, planName: "Super 499", planDescription: "7 days trial", planPrice: "₹ 499 / Month", type :4));
    subscriptionPlanModels.add(SubscriptionPlanModel(planNameOnly: "Platinum", planPriceOnly: "599", totalApp: 15, planName: "Platinum 599", planDescription: "7 days trial", planPrice: "₹  599 / Month", planPriceDescrition: "Eligible for an Amazon FTV stick Tata Sky Edition", type: 4));
    subscriptionPlanModels.add(SubscriptionPlanModel(planNameOnly: "Gold", planPriceOnly: "699", totalApp: 17, planName: "Gold 699", planDescription: "7 days trial", planPrice: "₹ 699 / Month", planPriceDescrition: "Eligible for an Amazon FTV stick Tata Sky Edition", type: 4));



 selectedSubscriptionPlanModel = subscriptionPlanModels.first;
    _selectedIndex = selectedSubscriptionPlanModel.type-1;

   addinalPlansubscriptionPlanModels = List<SubscriptionPlanModel>();
    addinalPlansubscriptionPlanModels.add(SubscriptionPlanModel(planNameOnly: "Prime", planPriceOnly: "199", totalApp: 5, planName: "Amazon Prime Video", planDescription: "7 days free trial", planPrice: "₹ 159 / month", type: 5));
  

  }


  


  int _selectedIndex;

  _onSelected(SubscriptionPlanModel subscriptionPlanModel) {
    setState(() { 
      _selectedIndex = subscriptionPlanModel.type -1;
      selectedSubscriptionPlanModel = subscriptionPlanModel;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: <Widget>[
          
          // SmoothPageIndicator(
          //   controller: pageController, // PageController
          //   count: 3,
          //   // textDirection: TextDirection.rtl,
          //   effect: ExpandingDotsEffect(
          //       dotHeight: 8,
          //       dotWidth: 10,
          //       dotColor: HexColor("#283554"),
          //       activeDotColor: HexColor('#5174c9')),
          // ),
          //it is middle screen that is expanded
          Expanded(
            child: Container(
              child: PageView(controller: pageController, children: <Widget>[
              
                buildThirdPage(context, isZoom:false),
                //first page
                buildFirstPage(context),
                // second page
                //buildSecondPage(context),
                buildFourthPage(),
                 buildThirdPage(context, isZoom:true),
      //second page end..

      //third page start
    
      //third page end
              ]),
            ),
          ),
        ],
      ),
    );
  }


Widget topWidget(){
  return Column(children: <Widget>[
       SizedBox(
            height: 50,
          ),
          Image.asset(
            "assets/images/tatskybinge1.png",
            height: 50,
          ),
          SizedBox(
            height: 10,
          ),
  ]);
}

Widget buildThirdPage(BuildContext context, {bool isZoom:false}){
 return Column(
   children: <Widget>[

      
    
          Expanded(child: centerLayoutfThirdPage(isZoom)),
           SizedBox(height:15.0),

              //bottom
              Column(
          children: <Widget>[
            MyWidgets.buttonsWithOutShadow(
                context, "Proceed", HexColor("#5991c9"),
                height: 48, width: 300, ontap: (){
                
                
                      pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                
                
                }),
            InkWell(
              onTap: ()=>    pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear) ,
              child: Text("Skip",
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
            ),
            SizedBox(height: 25),
          ],
        )


            

   ],
 );
}



Widget centerLayoutfThirdPage(bool isZoom){
  return ListView(children: <Widget>[

    Column(
              crossAxisAlignment: CrossAxisAlignment.center,
          
              children: <Widget>[
                 topWidget(),
                     SizedBox(height: 10,),
                Text(
                  "Start Your Free Trial",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 32.0,
                          color: AppTheme.white,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Select a plan of your favourite\n primium apps start watching",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 18.0,
                            color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w400))
                            ),
              ],
            ),
             SizedBox(height:20),
               Center(
                 child: SmoothPageIndicator(
            controller: internalPageController, // PageController
            count: 2,
            // textDirection: TextDirection.rtl,
            effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 5,
                  dotColor: HexColor("#283554"),
                  activeDotColor: HexColor('#5174c9')),
          ),
               ),
            SizedBox(height:20),
            StickyHeader
            (
              header: Container(
                padding: EdgeInsets.only(top:40),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: horizentalSubscriptionWithMonthPack(context, 0)),
              content: subcriptionpakagePage(0, isZoom),
              overlapHeaders: false,

              ),

            // Container(
            //   height: 1100,
            //   child: PageView(
            //     controller: internalPageController,
            //     onPageChanged: (pageIndex){
            //       print(pageIndex);
            //       var selectedIndex = pageIndex*3;
            //       setState(() {
            //         selectedSubscriptionPlanModel = subscriptionPlanModels[selectedIndex];
            //       });
            //     },
            //   children: <Widget>[
            //     subcriptionpakagePage(0, isZoom),
            //      subcriptionpakagePage(3, isZoom),
            //   ],
            // )),
            
           
  ],);
}


Widget subcriptionpakagePage(int skip, bool isZoom)
{
  return Column(children: <Widget>[

    
       
        //   horizentalSubscriptionWithMonthPack(context, skip),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    "Include apps",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 18.0,
                             color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w700)),
                  ),
              ),
            ),
            susbscriptionDetailApp(skip ,isZoom),
            SizedBox(height:15.0),
            susbscriptionDetailAppactivechecked(title:"Eligible for an Amazon FTV stick Tata Sky Edition"),
            SizedBox(height:15.0),
             susbscriptionDetailAppactivechecked(title:"Includes Disney + Hotstar Subscription", issubtitle: true),
              SizedBox(height:15.0),
  ],);
}


//last widget
Widget susbscriptionDetailAppactivechecked({String title, bool issubtitle=false}){

  return Padding(
    padding:  EdgeInsets.symmetric(horizontal:15.0, vertical: 5.0),
    child: Column(
      children: <Widget>[
         MyWidgets.headrline(MediaQuery.of(context).size.width -10),
        
            SizedBox(height:10.0),  

        Text(
                   title,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15.0,
                             color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w500)),
                  ),
           SizedBox(height:15.0),       
        Container(
          height: 20,
          child: ListView (
            controller: scrollController3,
            scrollDirection: Axis.horizontal,
           children: <Widget>[
             InkWell(
               onTap: (){
                 _onSelected(subscriptionPlanModels[0]);
               },
               child: Container(
                 height: MediaQuery.of(context).size.height,
                 width: MediaQuery.of(context).size.width /3 ,
                 alignment: Alignment.center,
                  decoration: BoxDecoration(
                   
                    border: Border(right: BorderSide(color:Colors.grey))
                 ),
                 child:  Padding(
                   padding: const EdgeInsets.only(left:8.0, right: 8.0),
                   child: Opacity(
                     opacity: selectedSubscriptionPlanModel == subscriptionPlanModels[0] ? 1.0:0.3,
                     child:issubtitle==false? Icon(Icons.close): Text(
                    "Freemimum",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15.0,
                             color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w500)),
                  ),
                     ),
                 ),
               ),
             ),
             InkWell(
                 onTap: (){
                 _onSelected(subscriptionPlanModels[1]);
               },
               child: Container(
                 height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width /3 ,
                 alignment: Alignment.center,
                 decoration: BoxDecoration(
                   
                    border: Border(right: BorderSide(color:Colors.grey))
                 ),
                 child:  Padding(
                   padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Opacity(
                     opacity: selectedSubscriptionPlanModel == subscriptionPlanModels[1]? 1.0:0.3,
                      child:issubtitle==false? Icon(Icons.check): Text(
                    "VIP",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15.0,
                             color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w500)),
                  ),),
                 ),
            ),
             ),
             InkWell(
                 onTap: (){
                 _onSelected(subscriptionPlanModels[2]);
               },
               child: Container(
                 height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width /3 ,
                  alignment: Alignment.center,
                   decoration: BoxDecoration(
                   
                    border: Border(right: BorderSide(color:Colors.grey))
                 ),
                 child:  Padding(
                   padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Opacity(
                     opacity: selectedSubscriptionPlanModel == subscriptionPlanModels[2]? 1.0:0.3,
                       child:issubtitle==false? Icon(Icons.check): Text(
                    "Peremium",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15.0,
                             color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w500)),
                  ),),
                 ),
            ),
             ),

               InkWell(
                 onTap: (){
                 _onSelected(subscriptionPlanModels[3]);
               },
               child: Container(
                 height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width /3 ,
                  alignment: Alignment.center,
                   decoration: BoxDecoration(
                   
                    border: Border(right: BorderSide(color:Colors.grey))
                 ),
                 child:  Padding(
                   padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Opacity(
                     opacity: selectedSubscriptionPlanModel == subscriptionPlanModels[3]? 1.0:0.3,
                       child:issubtitle==false? Icon(Icons.check): Text(
                    "Super",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15.0,
                             color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w500)),
                  ),),
                 ),
            ),
             ),

               InkWell(
                 onTap: (){
                 _onSelected(subscriptionPlanModels[4]);
               },
               child: Container(
                 height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width /3 ,
                  alignment: Alignment.center,
                   decoration: BoxDecoration(
                   
                    border: Border(right: BorderSide(color:Colors.grey))
                 ),
                 child:  Padding(
                   padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Opacity(
                     opacity: selectedSubscriptionPlanModel == subscriptionPlanModels[4]? 1.0:0.3,
                       child:issubtitle==false? Icon(Icons.check): Text(
                    "Platinum",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15.0,
                             color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w500)),
                  ),),
                 ),
            ),
             ),


            InkWell (
                onTap: (){
                 _onSelected(subscriptionPlanModels[5]);
               },
              child: Container(
                 height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width /3 ,
                  alignment: Alignment.center,
                 child:  Padding(
                   padding: const EdgeInsets.only(left:8.0, right: 8.0),
                    child: Opacity(
                     opacity: selectedSubscriptionPlanModel == subscriptionPlanModels[5]? 1.0:0.3,
                       child:issubtitle==false? Icon(Icons.check): Text(
                    "Gold",
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 15.0,
                             color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w500)),
                  ),),
                 ),
              ),
            )

           ],
          ),
        ),
      ],
    ),
  );
}




Widget susbscriptionDetailApp(int skip, isZoom){

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:8.0),
    child: Container(
      height: 650,
      child: Card(
         color: HexColor('#18191f'),
        child: ListView (
          scrollDirection: Axis.horizontal,
          controller: scrollController2,
          
          
         children: 
           subscriptionPlanModels.skip(skip).map((subscriptionPlanModel){
              return Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height,
                 decoration: BoxDecoration(
                  
                   border: Border(right: BorderSide(color:Colors.grey))
                ),
                child:  Padding(
                  padding: const EdgeInsets.only(left:8.0, right: 8.0),
                  child: Opacity(
                    opacity: selectedSubscriptionPlanModel == subscriptionPlanModel ? 1.0:0.3,
                    child:  
                    
                   InkWell(
                     onTap: (){
                       _onSelected(subscriptionPlanModel);
                     },
                     child: Column(children: getList(subscriptionPlanModel.type, isZoom).asMap().map((index, value){
                       return  MapEntry(index, Container(
                         padding: EdgeInsets.only(top:5),
                         height: index  == subscriptionPlanModel.type -1 && isZoom && selectedSubscriptionPlanModel == subscriptionPlanModel? 80 : 60,
                         child: value,
                       ));
                      }
                      ).values.toList() ),
                   )
                    
                    //gridImage(subscriptionPlanModel, crosscount: 1, isZoom:isZoom)
                    
                    ),
                ),
              );
           }).toList() 
           
          
         
         
        ),
      ),
    ),
  );
}





Widget horizentalSubscriptionWithMonthPack(BuildContext context, int skip){
  return Container(
    height:155.0,
    child: ListView(
      controller: scrollController1,
      scrollDirection: Axis.horizontal,
      children: subscriptionPlanModels.skip(skip).map((subscriptionPlanModel){
         return Opacity(
               opacity:selectedSubscriptionPlanModel ==   subscriptionPlanModel ? 1.0:0.3,
           child: Container(
             width: MediaQuery.of(context).size.width/3 ,
             child: Padding(
               padding: const EdgeInsets.only(left: 10),
               child: Column(
                 children:<Widget>[
                   toolTipWidget(headerTitle: subscriptionPlanModel.planNameOnly, middleTitle: subscriptionPlanModel.planPriceOnly, bottomTitle: 'Monthly', subscriptionPlanModel: subscriptionPlanModel),
                   SizedBox(height:selectedSubscriptionPlanModel ==   subscriptionPlanModel? 4.0:15.0),
                   Text(subscriptionPlanModel.totalApp.toString() + ' Apps',  style: GoogleFonts.lato(
                     textStyle: TextStyle(
                         fontSize: 20.0,
                        color: HexColor("#fafafa"),
                         fontWeight: FontWeight.w700))),
                   SizedBox(height:10.0),

                         
                 ]
               ),
             ),
           ),
         );
      }).toList(),
      
    ));

    
  

}

Widget toolTipWidget( {String headerTitle, String middleTitle, String bottomTitle, SubscriptionPlanModel subscriptionPlanModel}){
  var isSelected = subscriptionPlanModel == selectedSubscriptionPlanModel;
  return   Center(
      child: Container(
        height: isSelected ? 95.0:84,
        width: 105.0,
       
        decoration: ShapeDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.centerRight,
            colors: [
          HexColor('#4688f2'), HexColor('#1e65d6')
          ]),
          shape:
          isSelected ? TooltipShapeBorder(arrowArc: 0.0, radius: 5.0):MyStyles.buttonRouded(5.0),
          shadows: [
            BoxShadow(
                color: Colors.black26, blurRadius: 4.0, offset: Offset(2, 2))
          ],
        ),
        child: InkWell(
          onTap: (){
            _onSelected(subscriptionPlanModel);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(headerTitle,  style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 18.0,
                    color: AppTheme.white,
                    fontWeight: FontWeight.w700))),
                    SizedBox(height:2.0),
              Text(middleTitle,  style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 18.0,
                    color: AppTheme.white,
                    fontWeight: FontWeight.w700))),
               Text(bottomTitle,  style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 14.0,
                    color: AppTheme.white,
                    fontWeight: FontWeight.w400))),
            ],
          ),
        ),
      ),
    );
             
}


  Widget buildSecondPage(BuildContext context) {
    return Column(
     
      children: <Widget>[

        SizedBox(height: 10,),
        Text("Subscription Summary",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 32.0,
                    color: AppTheme.white,
                    fontWeight: FontWeight.w500))),
        SizedBox(
          height: 10,
        ),
        Text(selectedSubscriptionPlanModel.planName ,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400))),
        SizedBox(
          height: 10,
        ),
        gridImage(selectedSubscriptionPlanModel),
        SizedBox(
          height: 10,
        ),
        Text(selectedSubscriptionPlanModel.planPriceDescrition,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[350],
                    fontWeight: FontWeight.w400))),
        SizedBox(
          height: 10,
        ),
        Text("your free trial expires on 14/07/2020",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 20.0,
                    color: HexColor("#fafafa"),
                    fontWeight: FontWeight.w400))),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:2,right: 2) ,
            child: Text(
                "You would be required to make a payment of "+ selectedSubscriptionPlanModel.planPrice +" during or after your trail period to continue watching content form these apps.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400))),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: FractionalOffset.bottomCenter,
                  child: MyWidgets.buttonsWithOutShadow(
                      
                      context, "Start Watching Now", HexColor("#5991c9"),
                      height: 48, width: 300, ontap: (){
                         Navigator.pushReplacementNamed(context, "/homeBinge");
                      }),
                      
                    
                      ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFourthPage(){
  return ListView(
    children: <Widget>[
       Column(
              crossAxisAlignment: CrossAxisAlignment.center,
          
              children: <Widget>[

                
                topWidget(),
                Text(
                  "Subscription Summary",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 32.0,
                          color: AppTheme.white,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 10,
                ),
                

                Container(
                    
                  //height: 300,
                  padding: EdgeInsets.symmetric(horizontal:10, vertical: 10),
                  margin: EdgeInsets.symmetric(horizontal:10),
                  child:Card(
                    color: HexColor('#18191f'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                      children:<Widget>[
                         SizedBox(height:10.0),
                        Padding(
                          padding: const EdgeInsets.only(left:10.0),
                          child: Text(selectedSubscriptionPlanModel.planName, style:GoogleFonts.lato(textStyle:TextStyle(fontSize: 16.0, color:Colors.white))),
                        ),
                        SizedBox(height:5.0),
                      gridImage(selectedSubscriptionPlanModel, height: 180),
                         Padding(
                          padding: const EdgeInsets.only(left:10.0, top:5),
                          child: Text(selectedSubscriptionPlanModel.planPriceDescrition, style:GoogleFonts.lato(textStyle:TextStyle(fontSize: 14.0, color:Colors.white.withOpacity(0.7)))),
                        ),
                        SizedBox(height:15.0),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:10.0),
                              child: Text('24 Apr 2020 - 24 May 2020', style:GoogleFonts.lato(textStyle:TextStyle(fontSize: 15.0, color:Colors.white.withOpacity(0.9)))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Text('₹ ' + selectedSubscriptionPlanModel.planPriceOnly, style:GoogleFonts.lato(textStyle:TextStyle(fontSize: 15.0, color:Colors.white.withOpacity(0.9)))),
                            ),
                          ],
                        ),
                        SizedBox(height:15.0),
                        Builder(
                          builder: (context) {
                            return selectedAddinalSubscriptionPlanModel == null ? Container(): 
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left:10.0),
                                  child: Text(selectedAddinalSubscriptionPlanModel.planName, style:GoogleFonts.lato(textStyle:TextStyle(fontSize: 18.0,letterSpacing: 0.6, color:Colors.white, fontWeight: FontWeight.w600))),
                                ),
                                 SizedBox(height:15.0),
                             gridImage(selectedAddinalSubscriptionPlanModel, height: 70),
                               SizedBox(height:15.0),
                           Padding(
                              padding: const EdgeInsets.only(left:10.0),
                              child: Text('24 Apr 2020 - 24 May 2020', style:GoogleFonts.lato(textStyle:TextStyle(fontSize: 15.0, color:Colors.white.withOpacity(0.7)))),
                            ),
                              ],
                            );
                          }
                        ),
                        
                          
                             SizedBox(height:15.0),
                             Divider(color: Colors.grey,),

                             Row(
                               
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left:10.0),
                              child: Text('Total Payment', style:GoogleFonts.lato(textStyle:TextStyle(fontSize: 16.0, color:Colors.white))),
                            ),
                            SizedBox(width:90),
                            Padding(
                              padding: const EdgeInsets.only(left:10.0),
                              child: Text('₹ ' + selectedSubscriptionPlanModel.planPriceOnly, style:GoogleFonts.lato(textStyle:TextStyle(fontSize: 16.0, color:Colors.white))),
                            ),
                          ],
                        ),
                    SizedBox(height:15.0),

                      ]
                    ),
                  )
                ),
              
               Text(
                    "Subscription amount will be deducted form Tata\n Sky blance account every 30 days",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 16.0,
                            color: HexColor("#fafafa").withOpacity(0.5),
                            fontWeight: FontWeight.w400))),
              ],
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Icon(Icons.check, size: 20, color: Colors.green,),
              Text(
                    "  Use My Tata Sky Blance",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 12.0,
                            color: HexColor("#fafafa").withOpacity(0.7),
                            fontWeight: FontWeight.w400))),
            ],),

             //bottom
              SizedBox(height: 25),
              MyWidgets.buttonsWithOutShadow(
                context, "Proceed", HexColor("#5991c9"),
                height: 48, width: 300, ontap: (){
                
                
                        Navigator.pushReplacementNamed(context, "/homeBinge");
                
                
                }),
                 SizedBox(height: 10.0),
            InkWell(
              onTap: ()=>    pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear) ,
              child: Text("Skip",textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
            ),
            SizedBox(height: 25),


    ],
  );
}

  Widget buildFirstPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
          //top after tatasky logo start
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: <Widget>[
                SizedBox(height: 40,),
                topWidget(),
                Text(
                  "Additional App",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 32.0,
                          color: AppTheme.white,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Select a plan of your choice and start\n watching your favourite Movies and TV\n Show today",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 18.0,
                            color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w400))),
              ],
            ),
            //top after tatasky logo end

      //center start
        // Expanded(
        //   child: ListView(
        //     children: addinalPlansubscriptionPlanModels.map((f)=>  buildExpandListTile(f)).toList()
        //   ),
        // ),

         Expanded(
          child: ListView(
            children: addinalPlansubscriptionPlanModels.map((f)=>  buildOnlyListTile(f)).toList()
          ),
        ),
        //center end
        SizedBox(height: 10,),
       //botoom page
        Column(
          children: <Widget>[
            MyWidgets.buttonsWithOutShadow(
                context, "Proceed", HexColor("#5991c9"),
                height: 48, width: 300, ontap: (){
                
                
                      pageController.animateToPage(2, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                
                
                }),
            // InkWell(
            //   onTap: ()=>    pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear) ,
            //   child: Text("Skip",
            //       style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
            // ),
            SizedBox(height: 25),
          ],
        ),
      ],
    );
  }

  Container buildExpandListTile(SubscriptionPlanModel subscriptionPlanModel) {
    return Container(
      
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        color: HexColor('#3c4254'),
        child: ExpansionTile(
          key: Key(subscriptionPlanModel.planName),
          initiallyExpanded:  subscriptionPlanModel.isSelected,
          onExpansionChanged: (isExpand){
            setState(() {

                subscriptionPlanModel.isSelected = isExpand;
                selectedSubscriptionPlanModel = subscriptionPlanModel;

            });
          
          },
          title: Text(subscriptionPlanModel.planName,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))),
          subtitle: Text(subscriptionPlanModel.planDescription,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 15,
                      fontWeight: FontWeight.w500))),
       
          trailing: InkWell(
            onTap: (){

              setState(() {
                subscriptionPlanModel.isSelected = !subscriptionPlanModel.isSelected;
              });

            },
            child: checkbox(subscriptionPlanModel.isSelected)),
          children:   <Widget>[
            gridImage(subscriptionPlanModel),
            Text(subscriptionPlanModel.planPrice,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold))),
            Text(subscriptionPlanModel.planPriceDescrition,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 20)
          ],
        ));
  }


  Widget buildOnlyListTile(SubscriptionPlanModel subscriptionPlanModel) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        color: HexColor('#3c4254'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: <Widget>[
            ListTile(
              key: Key(subscriptionPlanModel.planName),
             
              title: Text(subscriptionPlanModel.planName,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold))),
              subtitle: Text(subscriptionPlanModel.planDescription,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500))),
       
              trailing: InkWell(
                onTap: (){

                  setState(() {
                    subscriptionPlanModel.isSelected = !subscriptionPlanModel.isSelected;

                    selectedAddinalSubscriptionPlanModel = null;
                    if(subscriptionPlanModel.isSelected){
                      selectedAddinalSubscriptionPlanModel = subscriptionPlanModel;
                    }


                  });

                },
                child: checkbox(subscriptionPlanModel.isSelected)),
             
            ),

            gridImage(subscriptionPlanModel, height: 75),
            
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(subscriptionPlanModel.planPrice,
                      style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold))),
            ),
               
                
          ],
        ));
  }

  Widget checkbox(bool isSelected) {

  
    return Container(
        height: 25,
        width: 25,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            shape: BoxShape.rectangle,
            color: HexColor('#676f85')),
        child: isSelected
            ? Icon(
                Icons.check,
                size: 25.0,
                color: Colors.white,
              )
            : Container());
  }


  Widget gridImage(SubscriptionPlanModel subscriptionPlanModel,   {int crosscount,  double height, isZoom}) {
    return InkWell(
      onTap: (){
          _onSelected(subscriptionPlanModel);
      },
      child: Container(
        height: height??210.0 ,
        padding: EdgeInsets.only(top: 10),
        child: GridView.count(
          mainAxisSpacing: 5.0,
          physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 3.0,
          childAspectRatio: 1.9,
          padding: EdgeInsets.symmetric(horizontal: 10),
          crossAxisCount: crosscount??4,
          children: getList(subscriptionPlanModel.type, isZoom),
        ),
      ),
    );
  }

 List<Widget> getList(int type, isZoom){

    switch (type) {

        case 2:
        return <Widget>[
          Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg", height: 300, width: 200,),
          Image.asset("assets/images/sun.jpg"),
          Image.asset("assets/images/errosnow.jpg"),
          Image.asset("assets/images/netfliex.png"),
          Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/errosnow.jpg"),
          
        ];
        break;
      case 3:
        return <Widget>[
          Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
          Image.asset("assets/images/sun.jpg"),
          Image.asset("assets/images/errosnow.jpg"),
          Image.asset("assets/images/hungama.png"),
         
           Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
             Image.asset("assets/images/netfliex.png"),
              Image.asset("assets/images/disnyhotstar.jpg"),
                  Image.asset("assets/images/sun.jpg"),
          
        ];
        break;

         case 4:
        return <Widget>[
          Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
          Image.asset("assets/images/sun.jpg"),
          Image.asset("assets/images/errosnow.jpg"),
          Image.asset("assets/images/hungama.png"),
         
           Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
             Image.asset("assets/images/netfliex.png"),
              Image.asset("assets/images/disnyhotstar.jpg"),
                  Image.asset("assets/images/sun.jpg"),
          
        ];
        break;

      case 5:
        return <Widget>[
          Container( 
            color: Colors.white,
            child: Image.asset("assets/images/primevideo.png")),
          
        ];
        break;
      default:

      return <Widget>[
          Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
          Image.asset("assets/images/sun.jpg"),
          Image.asset("assets/images/errosnow.jpg"),
        
           Image.asset("assets/images/hungama.png"),
          

          
        ];
    }
    
  }
}








class TooltipShapeBorder extends ShapeBorder {
  final double arrowWidth;
  final double arrowHeight;
  final double arrowArc;
  final double radius;

  TooltipShapeBorder({
    this.radius = 16.0,
    this.arrowWidth = 20.0,
    this.arrowHeight = 10.0,
    this.arrowArc = 0.0,
  }) : assert(arrowArc <= 1.0 && arrowArc >= 0.0);

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.only(bottom: arrowHeight);

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    rect = Rect.fromPoints(rect.topLeft, rect.bottomRight - Offset(0, arrowHeight));
    double x = arrowWidth, y = arrowHeight, r = 1 - arrowArc;
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)))
      ..moveTo(rect.bottomCenter.dx + x / 2, rect.bottomCenter.dy)
      ..relativeLineTo(-x / 2 * r, y * r)
      ..relativeQuadraticBezierTo(-x / 2 * (1 - r), y * (1 - r), -x * (1 - r), 0)
      ..relativeLineTo(-x / 2 * r, -y * r);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
