import 'package:flutter/material.dart';
import 'package:news_app/providers/NewsModel.dart';
import 'package:news_app/widgets/NewsTemplate.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  static const routePage = '/news-detail';

  @override
  Widget build(BuildContext context) {
    final title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
          future: Provider.of<News>(context, listen: false)
              .getNews(title.toLowerCase()),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(child: CircularProgressIndicator())
                  : RefreshIndicator(
                      child: NewsTemplate(),
                      onRefresh: () async {
                        await Provider.of<News>(context, listen: false)
                            .getNews(title.toLowerCase());
                      })),
    );
  }
}
