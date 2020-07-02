
import 'package:fluttertataskyapp/src/Model/entity.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
   final Stream<List<MovieCategory>> movieCategories;
   const CategoryPage({Key key,this.movieCategories})  : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title:Text("Categories", style:Theme.of(context).textTheme.headline6)),
      body: StreamBuilder(
        initialData: List<MovieCategory>(),
        stream: widget.movieCategories,
        builder: (context, AsyncSnapshot<List<MovieCategory>> snapshot) {
          if (snapshot.hasData) {
            return buildContent(snapshot, context);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          return Container(
              padding: EdgeInsets.all(20.0),
              child: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }

  Widget buildContent(AsyncSnapshot<List<MovieCategory>> snapshot, BuildContext context) {
    List<MovieCategory> movieCategores = snapshot.data;
    var width = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
      height: width,
      margin: EdgeInsets.only(bottom: 10, top: 0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.94,
          children:movieCategores.map(
        (movieCategores) {
         return   Material(
           child: Container(
            
             margin: EdgeInsets.only(left:  10, right: 10, bottom: 20),
            // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
             child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
               return Stack(
                 children: <Widget>[
                   Image.network(movieCategores.imagePath,
                     fit: BoxFit.cover,
                     height: constraints.biggest.height,
                     width: constraints.biggest.width,
                   ),
                   Container(
                     alignment: Alignment.center,
                     width: constraints.biggest.width,
                     height: constraints.biggest.height,
                     decoration: BoxDecoration(
                       gradient: LinearGradient(
                         begin: Alignment.topRight,
                         end: Alignment.bottomLeft,
                         stops: [0.1, 0.5, 0.7, 0.9],
                         colors: [
                      Color(0x99ff0000),
                      Color(0x66ff0000),
                      Color(0x66ff0000),
                      Color(0x99ff0000),
                         ],
                       ),),
                     child: Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: Text(movieCategores.name,
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 18,
                             fontWeight: FontWeight.bold,
                             fontFamily: 'Muli'
                         ),
                       ),
                     ),
                   )
                 ],
               );
             }),
           ),
         );
 
        },
      ).toList(),
          
         
      ),
     
    );
  }

  
}


