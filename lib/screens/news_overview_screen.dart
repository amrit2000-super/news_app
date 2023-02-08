import 'package:flutter/material.dart';
import 'package:news_app/providers/NewsModel.dart';
import 'package:news_app/widgets/Categories.dart';
import 'package:news_app/widgets/NewsTemplate.dart';
import 'package:provider/provider.dart';

class NewsOverViewScreen extends StatelessWidget {
  const NewsOverViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            'Flutter',
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            'News',
            style: TextStyle(color: Colors.blue),
          )
        ]),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: Provider.of<News>(context, listen: false).getNews(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : snapshot.error != null
                  ? RefreshIndicator(
                      onRefresh: () =>
                          Provider.of<News>(context, listen: false).getNews(),
                      child: SingleChildScrollView(
                          child: Column(children: <Widget>[
                        Container(
                          height: 120,
                          child: Categories(),
                          padding: EdgeInsets.all(8),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 16),
                            height: 600,
                            child: NewsTemplate()),
                      ])),
                    )
                  : Center(child: Text('An error occured'))),
    );
  }
}
