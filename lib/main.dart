import 'dart:collection';
import 'dart:convert';

import 'package:coronaupdate/src/article.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'hn_bloc.dart';
import 'myArticle.dart';

void main() => runApp(MyApp());

Future<List<MyArticle>> fetchArticle() async{
  final response = await http.get('https://corona-virus-lite.herokuapp.com/extract');

  if(response.statusCode == 200){

    return (json.decode(response.body) as List ).map<MyArticle>((map)=>MyArticle.fromJson(map) ).toList();
  }
  else {
    throw Exception('Failed to load');
  }
}


class MyApp extends StatelessWidget {

  final HackerNewsBloc bloc = HackerNewsBloc();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       theme: ThemeData(

          fontFamily: 'Montserrat',
          primarySwatch: Colors.red,
        ),
      debugShowCheckedModeBanner: false,
      // home: MyHomePage(title: 'COV19 UPDATES',bloc: bloc,),
      home: MyHomePage(title: 'COV19 UPDATES'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // final HackerNewsBloc bloc;

  // MyHomePage({Key key, this.title,this.bloc}) : super(key: key);
   MyHomePage({Key key, this.title}) : super(key: key);


  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // int _currentIndex = 0;
  Future<List<MyArticle>> futureMyArticle;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMyArticle = fetchArticle();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        // leading: LoadingInfo(widget.bloc.isLoading),



      ),

      body: FutureBuilder<List<MyArticle>>(

            future:futureMyArticle ,
            builder: (context,snapshot){

              if(snapshot.hasData){
                return  ListView(
              children: snapshot.data.map(_buildItem).toList(),
                );
            }
            else if(snapshot.hasError){
              return Text("${snapshot.error}");
            }

            return Center(
            child:CircularProgressIndicator()
          );

            }
            ), 
        

     
    );

    //     body: StreamBuilder<UnmodifiableListView<MyArticle>>(

    //         initialData: UnmodifiableListView<MyArticle>([]),
    //         stream: widget.bloc.articles,
    //         builder: (context,snapshot)=> ListView(
    //           children: snapshot.data.map(_buildItem).toList(),
    //         ) ),
        

     
    // );


  }

  Widget _buildItem(MyArticle article) {
    return Padding(
      key: Key(article.article_link),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: new Text(
          article.article_title,
          style: TextStyle(fontSize: 20),
        ),

      
        children: <Widget>[

          
          Padding(
            padding: const EdgeInsets.only(left:16,top:8),
            child: Text(
            article.publish_date,
            style: TextStyle(fontSize: 18),
        ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('News Source: ${article.source}'),
              IconButton(
                  icon: Icon(Icons.launch),
                  color: Colors.red,
                  onPressed: () async {
//                    final urlString = "https://${article.url}";
                    final urlString = article.article_link;
                    if (await canLaunch(urlString)) {
                      launch(urlString);
                    }
                  })
            ],
          )
        ],
      ),
    );
  }
}

class LoadingInfo extends StatelessWidget {
  Stream<bool> _isLoading;
  LoadingInfo(this._isLoading);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _isLoading,
        builder: (context , AsyncSnapshot<bool> snapshot){
          if(snapshot.hasData && snapshot.data) return Icon(FontAwesomeIcons.hackerNews);

          return Center(
            child:CircularProgressIndicator(backgroundColor: Colors.white,)
          );


    });
  }
}
