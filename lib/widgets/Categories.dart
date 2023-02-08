import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/CategoryModel.dart';
import 'package:news_app/screens/category_screen.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    final newsCategory = Provider.of<CategoryTypes>(context, listen: false);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) => Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(CategoriesScreen.routePage,
                    arguments: newsCategory.items[index].categoryName);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: newsCategory.items[index].categoryUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 90,
              height: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.only(left: 30),
              child: Text(newsCategory.items[index].categoryName,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            )
          ],
        ),
      ),
      itemCount: newsCategory.items.length,
    );
  }
}
