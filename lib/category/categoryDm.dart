import 'dart:ui';

import '../MyTheme.dart';

class CategoryDM{
  Color color;
  String image;
  String title;
  String id;
  CategoryDM({required this.title,required this.id,required this.color,required this.image});
  static List<CategoryDM> getCategories(){
    //business entertainment general health science sports technology
    return[
      CategoryDM(title: 'sports', id: 'sports', color: MyTheme.redColor, image: 'assets/images/ball.png'),
      CategoryDM(title: 'General', id: 'general', color: MyTheme.darkBlueColor, image: 'assets/images/Politics.png'),
      CategoryDM(title: 'Health', id: 'health', color: MyTheme.pinkColor, image: 'assets/images/health.png'),
      CategoryDM(title: 'Business', id: 'business', color: MyTheme.brownColor, image: 'assets/images/bussines.png'),
      CategoryDM(title: 'Entertainment', id: 'entertainment', color: MyTheme.blueColor, image: 'assets/images/environment.png'),
      CategoryDM(title: 'Science', id: 'science', color: MyTheme.yellowColor, image: 'assets/images/science.png'),
    ];
  }
}