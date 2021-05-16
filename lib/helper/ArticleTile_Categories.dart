import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/webview.dart';
class ArticleTile_Category extends StatelessWidget {
  final String imageUrl,url,title,description;
  ArticleTile_Category({@required this.imageUrl,@required this.url,
    @required this.title,@required this.description});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
          BoxShadow(
          color: Colors.white60,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 6.0,
        ),
        ],
          color: Colors.black,
        ),

        margin: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 16),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white,
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>WebViewClass(
                      articleUrl : this.url
                  ))
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(imageUrl),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,
                    style:TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(description,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 17,
                      fontWeight: FontWeight.w300,
                    ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
