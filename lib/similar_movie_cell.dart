import 'package:flutter/material.dart';
import 'package:movie_griller/MovieDetail.dart';
import 'package:movie_griller/tv_detail.dart';
import 'package:transparent_image/transparent_image.dart';
class SimilarCell extends StatelessWidget {
  final similarMovies;
  final type;
  final _imageURL = 'https://image.tmdb.org/t/p/w500';
  SimilarCell(this.similarMovies,this.type);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(similarMovies['poster_path']!=null){
        Navigator.push(context, MaterialPageRoute(
          
          builder: (context){
            if(type=='movie'){
            return new MovieDetail(similarMovies['id']);
            }
            return new TVDetail(tvID:similarMovies['id']);
          }
        ));
        }
        else{
          return null;
        }
      },
      child: new Container(
        alignment: Alignment.center,
        child: new Stack(
          fit: StackFit.loose,
          children: <Widget>[
            new Container(
              height: 320.0,
              width: 130.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
               
                boxShadow: [
                new BoxShadow(
                  color: Colors.black,
                  blurRadius: 2.0,
                  offset: Offset(1.0, 3.0)
                ),
                
              ]

              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: FadeInImage.memoryNetwork(image:similarMovies['poster_path']!=null? _imageURL+similarMovies['poster_path']:'https://image.freepik.com/free-vector/404-error-concept-with-camel-and-cactus_23-2147736339.jpg',placeholder: kTransparentImage,fit: BoxFit.cover,alignment: Alignment.center,),
              ),
            ),
            // new Positioned(
            //   left: 0.0,
            //   right: 0.0,
            //   bottom: 0.0,
            //   child: Container(
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         colors: [
            //           Colors.transparent,
            //           Colors.black.withOpacity(0.8),

            //         ],
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter
            //       ),
            //       borderRadius: BorderRadius.circular(14.0),
                  
            //     ),
            //     padding: const EdgeInsets.all(16.0),
            //     child: new Row(
            //       children: <Widget>[
            //         new Expanded(
            //           child: new Text(similar_movies['title'],
            //           style:TextStyle(
            //             color:Colors.white,
            //             fontFamily:'google',
            //             fontWeight:FontWeight.bold
            //           )),
            //         ),
            //         new Text(similar_movies['vote_average'].toString(),
            //         style:TextStyle(
            //           color:Colors.white,
            //           fontFamily: 'google',
            //           fontWeight: FontWeight.bold
            //         ))
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}