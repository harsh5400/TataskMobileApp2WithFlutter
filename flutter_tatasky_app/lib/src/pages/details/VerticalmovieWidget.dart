import 'package:flutter/material.dart';
import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/entity.dart';

class VerticalMovieWidget extends StatelessWidget {
  final MovieEntity movie;

  final String title;

  const VerticalMovieWidget({Key key, this.movie, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                ),
                GestureDetector(
                  onTap: () => print('View  '),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/3,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: movie.screenShots.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 20.0,
                  ),
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: MyWidgets.catcheNetworkImage(movie.screenShots[index].url, height:190.0),
                    // child: FadeInImage.assetNetwork(
                    //   placeholder: 'assets/images/placeholder.png',
                    //   height: 190.0,
                    //   width: double.infinity,
                    //   fit: BoxFit.cover,
                    //   image: movie.screenShots[index].url,
                    // ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
