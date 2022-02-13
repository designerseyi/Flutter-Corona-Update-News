

import 'dart:convert';

class MyArticle{
    String  article_link;
  String  article_title;
  String  description;
  String  publish_date;
  String  source;
  String  source_link;
  
  MyArticle({this.article_link,this.article_title,this.description,this.publish_date,this.source,this.source_link});
  factory MyArticle.fromJson(Map<String,dynamic> json){

    return MyArticle(
      article_link:json['article_link'],
      article_title:json['article_title'],
      description:json['description'],
      publish_date:json['publish_date'],
      source:json['source'],
      source_link:json['source']
    );
  }



  
List<int> parseTopStories(String jsonStr){

//  final parsed = json.jsonDecode(jsonStr);
//  final listOfIds = List<int>.from(parsed);
//  return listOfIds;
  return [];

}

List<MyArticle> parseArticle(String jsonStr){
  // the result of decode json is a map
  List<Map<String, dynamic>> parsed = json.decode(jsonStr);

  List<MyArticle> articles =  parsed.map<MyArticle>(( map) =>  MyArticle.fromJson(map)).toList();
  return articles;

}

List<MyArticle> parseFirstTen(String jsonStr){
  // the result of decode json is a map
  List<Map<String, dynamic>> parsed = json.decode(jsonStr);


  List<MyArticle> articles = List<MyArticle>();
  for(int i=0; i<9 ;i++){
  
   articles.add( MyArticle.fromJson(parsed[i]));
  
  }
 return articles;

}
}