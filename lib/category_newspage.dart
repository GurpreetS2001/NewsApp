import 'package:flutter/material.dart';
import 'package:newsapi/newsapi.dart';
import 'package:newsapp/helper/Article_Tile.dart';

class CategoryPage extends StatefulWidget {
  final ArticleResponse categoryResponse;
  CategoryPage({Key key,this.categoryResponse}):super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.grey[850],
              floating: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('News'),
                  Text(
                    'App',
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  )
                ],
              ),
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(height: 8.0),
                  Container(
                    padding: EdgeInsets.only(top: 10.0),
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: widget.categoryResponse.articles.length,
                        shrinkWrap: true,
                        itemBuilder:(context,index){
                          return ArticleTile(imageUrl: widget.categoryResponse.articles[index].urlToImage,
                              url: widget.categoryResponse.articles[index].url,
                              title: widget.categoryResponse.articles[index].title,
                              description: widget.categoryResponse.articles[index].description);
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
