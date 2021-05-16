import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:newsapi/newsapi.dart';

class Loading extends StatefulWidget {
  const Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    getFrontPage();
  }

  void getFrontPage() async{
    var newsApi = NewsApi(
      debugLog: true,
      apiKey: '58ac473a6c2b456f939e82cfbae85f2e'
    );
    ArticleResponse topHeadlines = await newsApi.topHeadlines(
      country: 'in',
      language: 'en',
    );

    ArticleResponse businessNews =await newsApi.topHeadlines(
      country: 'in',
      language: 'en',
      category: 'business',
    );

    ArticleResponse entertainmentNews =await newsApi.topHeadlines(
      country: 'in',
      language: 'en',
      category: 'entertainment',
    );

    ArticleResponse generalNews =await newsApi.topHeadlines(
      country: 'in',
      language: 'en',
      category: 'general',
    );

    ArticleResponse healthNews =await newsApi.topHeadlines(
      country: 'in',
      language: 'en',
      category: 'health',
    );

    ArticleResponse scienceNews =await newsApi.topHeadlines(
      country: 'in',
      language: 'en',
      category: 'science',
    );

    ArticleResponse sportsNews =await newsApi.topHeadlines(
      country: 'in',
      language: 'en',
      category: 'sports',
    );

    ArticleResponse technologyNews =await newsApi.topHeadlines(
      country: 'in',
      language: 'en',
      category: 'technology',
    );



    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'topHeadlines': topHeadlines,
      'business': businessNews,
      'health': healthNews,
      'sports':sportsNews,
      'technology':technologyNews,
      'science':scienceNews,
      'general':generalNews,
      'entertainment':entertainmentNews,
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child:
        SpinKitChasingDots(
          color: Colors.white,
          size: 50.0,
           ),
        )
      );
  }
}
