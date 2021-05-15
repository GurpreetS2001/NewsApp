import 'package:newsapp/helper/category_model.dart';

List<CategoryModel> categoryList(){
  List<CategoryModel> categories=[];
  CategoryModel model1= new CategoryModel();
  model1.categoryName='Business';
  model1.imageURL='https://media.istockphoto.com/photos/business-development-to-success-and-growing-growth-concept-pointing-picture-id1145631842?k=6&m=1145631842&s=612x612&w=0&h=D9ToEIi64qlA4_w-VmN9CBvfW-D4DKvdJrG1jJU-GPk=';
  categories.add(model1);

  CategoryModel model2= new CategoryModel();
  model2.categoryName='Entertainment';
  model2.imageURL='https://blog.hubspot.com/hubfs/Sales_Blog/famous-movie-quotes.jpg';
  categories.add(model2);

  CategoryModel model3= new CategoryModel();
  model3.categoryName='General';
  model3.imageURL='https://wp-asset.groww.in/wp-content/uploads/2019/03/18122322/stock-market.jpg';
  categories.add(model3);

  CategoryModel model4= new CategoryModel();
  model4.categoryName='Health';
  model4.imageURL='https://m.economictimes.com/thumb/msid-75771189,width-1200,height-900,resizemode-4,imgsize-693576/223-health-insurance.jpg';
  categories.add(model4);

  CategoryModel model5= new CategoryModel();
  model5.categoryName='Science';
  model5.imageURL='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH7coFHYGBVXWjDLwSOWBEOosY7oVAP3TatA&usqp=CAU';
  categories.add(model5);

  CategoryModel model6= new CategoryModel();
  model6.categoryName='Sports';
  model6.imageURL='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzB7-ib4f-FmCgobyHm7Omn-gu80jXZF55Jw&usqp=CAU';
  categories.add(model6);

  CategoryModel model7= new CategoryModel();
  model7.categoryName='Technology';
  model7.imageURL='https://www.investopedia.com/thmb/QvLIdxSBRTqN0PFDFfW0YV9ZA70=/2121x1193/smart/filters:no_upscale()/GettyImages-964033964-ca3290057ccc4024b57e755423572264.jpg';
  categories.add(model7);

  return categories;
}