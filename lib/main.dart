import 'package:flutter/material.dart';
import 'package:news/Home/Home.dart';
import 'package:news/MyTheme.dart';
import 'package:news/category/category_details.dart';
import 'package:news/newsdetails.dart';
import 'package:news/searchPage.dart';

void main ()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,routes: {
      Home.routesName:(context)=>Home(),
      NewsDetails.routeName:(context)=>NewsDetails(),
      SearchPage.routesName:(context)=>SearchPage(),

    },
    initialRoute:
      Home.routesName,theme: MyTheme.lightTheme,);
  }

}