import 'package:flutter/material.dart';
import 'package:news/category/categoryDm.dart';
import 'package:news/taps/tab_container.dart';
import 'package:news/Models/sourcesResponse.dart';
import 'package:news/api/api_manager.dart';

import '../MyTheme.dart';

class categoryDetails extends StatefulWidget {
  static const String routesName='CategoryDetails';
 CategoryDM category;
 categoryDetails({required this.category});
  @override
  State<categoryDetails> createState() => _categoryDetailsState();
}

class _categoryDetailsState extends State<categoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          color: MyTheme.whiteColor,
          child: Image.asset('assets/images/pattern.png',
            width: double.infinity,height: double.infinity,fit: BoxFit.fill,)),
    Scaffold(

    body:FutureBuilder<SourcesResponse>(
    future: ApiManager.getResources(widget.category.id),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(
    child: CircularProgressIndicator(
    color: Theme.of(context).primaryColor,
    ));
    } else if (snapshot.hasError) {
    return Column(
    children: [
    Text('Something went wrong'),
    ElevatedButton(
    onPressed: () {
    ApiManager.getResources(widget.category.id);
    },
    child: Text('Try again'))
    ],
    );
    }
    if(snapshot.data?.status!='ok'){
    return Column(
    children: [
    Text(snapshot.data?.message??''),
    ElevatedButton(
    onPressed: () {
    ApiManager.getResources(widget.category.id);
    setState(() {
    });
    },
    child: Text('Try again'))
    ],
    );
    }
    var sourceList=snapshot.data?.sources??[];
    return TapContainer(sourceList: sourceList);
    }
    ),
    )
    ],);

}}
