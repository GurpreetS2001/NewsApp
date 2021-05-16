import 'package:flutter/material.dart';
import 'package:newsapi/newsapi.dart';
import 'package:newsapp/helper/ArticleTile_Categories.dart';

class CategoryPage extends StatefulWidget {
  final ArticleResponse categoryResponse;
  final String category;
  CategoryPage({Key key,this.categoryResponse,this.category}):super(key: key);

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
              backgroundColor: Colors.black,
              floating: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.category,
                    style: TextStyle(
                      color: Colors.amberAccent,
                    ),
                  ),
                  Text('News'),
                ],
              ),
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    color:Colors.grey[700],
                    padding: EdgeInsets.only(top: 10.0),
                    child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: widget.categoryResponse.articles.length,
                        shrinkWrap: true,
                        itemBuilder:(context,index){
                          if(widget.categoryResponse.articles[index].urlToImage!=null && widget.categoryResponse.articles[index].url!=null
                              && widget.categoryResponse.articles[index].title!=null && widget.categoryResponse.articles[index].description!=null)
                            return ArticleTile_Category(imageUrl: widget.categoryResponse.articles[index].urlToImage,
                              url: widget.categoryResponse.articles[index].url,
                              title: widget.categoryResponse.articles[index].title,
                              description: widget.categoryResponse.articles[index].description);
                          else
                            return SizedBox(height: 0.0,);
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
