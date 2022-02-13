import 'dart:convert';


import 'package:coronaupdate/src/article.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;


main (){

test("network", () {
 var _articles = <Article>[];

  List<int> _ids = [
    20472179,
    20465348,
    20463170,
    20468845,
    20459783,
    20468870,
    20457706,
    20475865,
    20460438
  ];


  Future<dynamic> _getArticle() async{



    final storyUrl = 'https://corona-virus-lite.herokuapp.com/extract';
    final storyRes = await http.get(storyUrl);


    if(storyRes.statusCode == 200){

      // return parseArticle(storyRes.body);
      return storyRes.body;

    }



  }


_getArticle().then((data){

  if(data == null){
    
    print("i am null");
  }

}).catchError((err){

  print("Error");
}).whenComplete( (){print("Error");});

//  print(_articles);

//  Future<Null> getArticles() async {
//    //my former code
//
//
//    final futureArticle =  _ids.map((id) => _getArticle(id));
//
//
//  final articles = await Future.wait(futureArticle);
//
//_articles = articles;
//
////    _ids.map((id) => _getArticle(id).then((data){
////
////      _articles.add(data);
////
////    }));
//
//
//
//  }
//
////    var json = """
////  {"by":"antouank","descendants":223,"id":20460438,"kids":[20461879,20461720,20461485,20460811,20463762,20461008,20461104,20462816,20460830,20460970,20463863,20462193,20462702,20466113,20462683,20463040,20463943,20462734,20474173,20464470,20461902,20462805,20463551,20462756,20467427,20464863,20461014,20476046,20464846],"score":456,"time":1563377045,"title":"How can phone companies detect tethering?","type":"story","url":"https://android.stackexchange.com/questions/47819/how-can-phone-companies-detect-tethering-incl-wifi-hotspot"}
////  """;
////  final Article a = parseArticle(json);
////
////  _articles.add(a);
//
//  getArticles().then((_){
//    print(_articles);
//
//  });





});
}