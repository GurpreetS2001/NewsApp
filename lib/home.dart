import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsapi/newsapi.dart';
import 'package:newsapp/category_newspage.dart';
import 'package:newsapp/helper/category_model.dart';
import 'package:newsapp/helper/Category_data.dart';
import 'helper/Article_Tile.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map dataHomePage={};

  List<CategoryModel> importedList=[];

  @override
  void initState() {
    super.initState();
    importedList=categoryList();
  }

  @override
  Widget build(BuildContext context) {

    dataHomePage=dataHomePage.isNotEmpty ? dataHomePage:ModalRoute.of(context).settings.arguments;


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
                    SizedBox(height: 2.0,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      height: 90,
                      child: ListView.builder(
                        itemCount:importedList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return CategoryTile(
                            imageURL: importedList[index].imageURL,
                            categoryName: importedList[index].categoryName,
                            categoryResponse: dataHomePage[importedList[index].categoryName.toLowerCase()],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 2.0,),
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: ListView.builder(
                          //physics: ClampingScrollPhysics(),
                          itemCount: dataHomePage['topHeadlines'].articles.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder:(context,index){
                            return ArticleTile(imageUrl: dataHomePage['topHeadlines'].articles[index].urlToImage,
                                url: dataHomePage['topHeadlines'].articles[index].url,
                                title: dataHomePage['topHeadlines'].articles[index].title,
                                description: dataHomePage['topHeadlines'].articles[index].description);
                          }),
                    )
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imageURL,categoryName;
  final ArticleResponse categoryResponse;
  CategoryTile({this.imageURL,this.categoryName,this.categoryResponse});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryPage(
        categoryResponse: this.categoryResponse,
      )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageURL,width:120,height: 120,fit: BoxFit.cover,),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              child: Text(categoryName,style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              )),
            )
          ],
        ),
      ),
    );
  }
}



