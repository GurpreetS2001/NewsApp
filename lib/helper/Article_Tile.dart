import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/webview.dart';
class ArticleTile extends StatelessWidget {
  final String imageUrl,url,title,description;
  ArticleTile({@required this.imageUrl,@required this.url,
    @required this.title,@required this.description});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black,
            Colors.grey[800]]
          ),
          //border: Border.all(color: Colors.white),
          boxShadow: [
            BoxShadow(
              color: Colors.white60,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        margin: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 8),
        height: MediaQuery.of(context).size.height-110.0,
        width: MediaQuery.of(context).size.width-25.0,
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
                  child: Image.network(imageUrl,fit: BoxFit.cover,height: 400,width: MediaQuery.of(context).size.width-25.0,),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(title,
                    style:TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                SizedBox(height: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,2.0,8.0,0.0),
                    child: Text(description,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
