import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/NewsDataModel.dart';

import 'news_details_screen.dart';

class NewsCard extends StatelessWidget {
  Articles article;

  NewsCard(this.article);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetailsScreen.routeName,
            arguments: article);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(15),
        color: Color.fromRGBO(255, 255, 255, 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CachedNetworkImage(
              imageUrl: article.urlToImage ?? '',
              height: 200,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Text(article.author ?? '',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 111, 120, 128))),
            Text(article.title ?? '',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 66, 80, 92))),
            Text(article.publishedAt?.substring(0, 10) ?? '',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 143, 139, 139),
                ),
                textAlign: TextAlign.right),
          ],
        ),
      ),
    );
  }
}
