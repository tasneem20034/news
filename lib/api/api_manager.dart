import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/Models/NewsResponse.dart';
import 'package:news/Models/sourcesResponse.dart';
import 'package:news/api/apiConstants.dart';
class ApiManager{
//https://newsapi.org/v2/top-headlines/sources?apiKey=023e345eb12c4010b747fc749dc51556
static Future<SourcesResponse> getResources(String categoryId)async{
  Uri url=Uri.https(ApiConstants.baseUrl,ApiConstants.sourceApi,{
    'apiKey':'023e345eb12c4010b747fc749dc51556',
    'categories' : categoryId
  });
  try{
    var response= await http.get(url);
    var bodyString=response.body;
    var json=jsonDecode(bodyString);
    return SourcesResponse.fromJson(json);
  }catch(e){
    throw e;
  }
}
//https://newsapi.org/v2/everything?q=apple&from=2023-11-02&to=2023-11-02&sortBy=popularity&apiKey=023e345eb12c4010b747fc749dc51556
static Future<NewsResponse> getNewsBySourceId(sourceId)async{
  Uri url=Uri.http(ApiConstants.baseUrl,ApiConstants.newsApi,{
    'apiKey':'023e345eb12c4010b747fc749dc51556',
'sources':sourceId
});
  try{
var response=await http.get(url);
var bodyString=response.body;
var json=jsonDecode(bodyString);
return NewsResponse.fromJson(json);
}catch(e){
    throw e;
}

}
}