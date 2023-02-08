import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/NewsModel.dart';
import 'package:news_app/screens/news_detail.dart';
import 'package:news_app/screens/news_overview_screen.dart';
import 'package:provider/provider.dart';

class NewsTemplate extends StatelessWidget {
  const NewsTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    final news = Provider.of<News>(context, listen: false).news;
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(NewsDetailScreen.routePage,
                arguments: news[index].url);
          },
          child: Card(
            margin: EdgeInsets.all(16),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: CachedNetworkImage(
                        imageUrl: news[index].urlToImage,
                        fit: BoxFit.cover,
                        height: 200,
                      )),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    news[index].title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    news[index].description,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: news.length,
    );
  }
}
