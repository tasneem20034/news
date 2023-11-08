import 'package:flutter/material.dart';
import 'package:news/Models/NewsResponse.dart';
import 'package:news/Models/sourcesResponse.dart';
import 'package:news/api/api_manager.dart';

import 'news_item.dart';

class NewsContainer extends StatefulWidget {

  Sources source;

  NewsContainer({required this.source});


  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Theme
                .of(context)
                .primaryColor,));
          } else if (snapshot.hasError) {
            return Column(children: [
              Text('Something went wrong'),
              ElevatedButton(onPressed: () {
                ApiManager.getNewsBySourceId(widget.source.id);
                setState(() {

                });
              }, child: Text('Try Again'))
            ],);
          }
          if(snapshot.data?.status!='ok'){
            return Text(snapshot.data?.message??'something went wrong');
          }
          var newsList=snapshot?.data?.articles??[];
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news:newsList[index]);
          },
          itemCount:newsList.length );
        });
  }
}
