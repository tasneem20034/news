import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'Models/NewsResponse.dart';
import 'MyTheme.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'newsdetails';

  @override
  Widget build(BuildContext context) {
    var news=ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News Tittle',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child:CachedNetworkImage(imageUrl: news.urlToImage??'',
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.3,
                    fit: BoxFit.fill,
                    placeholder:(context,url)=>Center(child: CircularProgressIndicator()) ,
                    errorWidget: (context,url,error)=>Icon(Icons.error),)
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.author ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 14, color: MyTheme.grayColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 10,
            ),Text(news.content!),
            Text(
                news.publishedAt ?? '',
                textAlign: TextAlign.end, style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 14, color: MyTheme.grayColor)
            )
          ],
        ),
      ),
    );
  }
}
