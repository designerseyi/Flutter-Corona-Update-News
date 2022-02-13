import 'dart:async';
import 'dart:convert';

import 'package:coronaupdate/src/article.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'dart:collection';

import 'myArticle.dart';




enum StoriesType{
  newStories,
  topStories
}
class HackerNewsBloc {



  Stream<UnmodifiableListView<MyArticle>> get articles => _articlesSubject.stream;

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<MyArticle>>();

//is loading stream

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  final _isLoadingSubject = BehaviorSubject<bool>();

  HackerNewsBloc() {


    // getArticles().then((_){
    //   _isLoadingSubject.add(true);
    //   _articlesSubject.add(UnmodifiableListView(_articles));
    //   _isLoadingSubject.add(false);

    // });

    getMyArticles().then((_){

        _isLoadingSubject.add(true);
      _articlesSubject.add(UnmodifiableListView(_myarticles));
      _isLoadingSubject.add(false);
    });

    // listeninig to the event pressed by the user through the sink
    // _storiesTypeController.stream.listen((storiesType){

      // if(storiesType == StoriesType.topStories){

      //   _getAndUpdateIds(_topids);
      // }
      // else{
      //   _getAndUpdateIds(_newids);
      // }

    // });


  }


  // _getAndUpdateIds(List<int> ids) async{

  //   _isLoadingSubject.add(true);
  //   await getArticles(ids);
  //   _articlesSubject.add(UnmodifiableListView(_articles));
  //   _isLoadingSubject.add(false);

  // }
  var  _articles = <Article>[];
  List<MyArticle> _myarticles = List<MyArticle>();

  //  static List<int> _newids = [
  //   20472179,
  //   20465348,
  //   20463170,
  //   20468845,

  // ];

  // static List<int> _topids = [
  //   20459783,
  //   20468870,
  //   20457706,
  //   20475865,
  //   20460438,
  // ];


  // List<int> _ids = [
  //   20472179,
  //   20465348,
  //   20463170,
  //   20468845,
  //   20459783,
  //   20468870,
  //   20457706,
  //   20475865,
  //   20460438
  // ];


List<MyArticle> parseMyArticle(String jsonStr){
  // the result of decode json is a map
 

 

  List<MyArticle> myarticles = (json.decode(jsonStr) as List ).map<MyArticle>((map)=>MyArticle.fromJson(map) ).toList();


  
 return myarticles;

}

List<MyArticle> parseMyFirstTen(String jsonStr){
  // the result of decode json is a map

  
  List<MyArticle> parsed = (json.decode(jsonStr) as List ).map<MyArticle>((map)=>MyArticle.fromJson(map) ).toList();




  List<MyArticle> myarticles = List<MyArticle>();
  for(int i=0; i<9 ;i++){
  
   myarticles.add( parsed[i]);
  
  }
 return myarticles;

}


  Future<MyArticle> getMyArticles() async{


      final storyUrl = 'https://corona-virus-lite.herokuapp.com/extract';
    final storyRes = await http.get(storyUrl);
    _myarticles = parseMyFirstTen(storyRes.body);


    if(storyRes.statusCode == 200){
        print('success');
      _myarticles =    parseMyArticle(storyRes.body);
    }
    else{
      throw Exception('Failed to load ');
      // print('outside');
    }

  }

  // Future<Article> _getArticle(int id) async{

  //   final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
  //   final storyRes = await http.get(storyUrl);


  //   if(storyRes.statusCode == 200){
  //     return parseArticle(storyRes.body);
  //   }

  // }

// sink
  //we neet the sink to help us add data to the stream from outside the bloc
  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  //controller
  final _storiesTypeController = StreamController<StoriesType>();
}