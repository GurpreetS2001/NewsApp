import 'package:flutter/material.dart';
import 'package:newsapp/webview.dart';
class ArticleTile extends StatelessWidget {
  final String imageUrl,url,title,description;
  ArticleTile({@required this.imageUrl,@required this.url,
    @required this.title,@required this.description});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder:(context)=>WebViewClass(
              articleUrl : this.url
            ))
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Card(
          elevation: 10.0,
          margin: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(imageUrl),
              ),
              SizedBox(height: 8),
              Text(title,
                style:TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),),
              SizedBox(height: 8),
              Text(description,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
