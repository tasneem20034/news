import 'package:flutter/material.dart';
import 'package:news/category/categoryDm.dart';
import 'package:news/category/category_fragment.dart';
import 'package:news/searchPage.dart';
import 'package:news/settings.dart';

import '../MyTheme.dart';
import '../category/category_details.dart';
import 'homeDrawer.dart';

class Home extends StatefulWidget {
  static const String routesName = 'HomeScreen';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: MyTheme.whiteColor,
            child: Image.asset(
              'assets/images/pattern.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            )),
        Scaffold(
          appBar: AppBar(actions: [IconButton(onPressed: (){
            Navigator.of(context).pushNamed(SearchPage.routesName);
          },icon: Icon(Icons.search,size: 28,),)],
            title: Text(selectedMenueItem==HomeDrawer.settings?'Settings':
                selectedCategory==null?'News App':selectedCategory!.title
              ,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenue: onSideMenueItem),
          ),
          body: selectedMenueItem == HomeDrawer.settings
              ? Settings()
              : selectedCategory == null
                  ? CategoryFragment(
                      onCategoryClick: onCategoryClick,
                    )
                  : categoryDetails(
                      category: selectedCategory!,
                    ),
        )
      ],
    );
  }

  CategoryDM? selectedCategory;

  onCategoryClick(CategoryDM newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int selectedMenueItem = HomeDrawer.categories;

  void onSideMenueItem(int newSelectedMenueItem) {
    selectedMenueItem = newSelectedMenueItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
