import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/models/Sources_response.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/NewsDataModel.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName = 'News Details Screen';

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute.of(context)?.settings.arguments as Articles;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover),
          color: Colors.white,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text(AppLocalizations.of(context)!.news),
          ),
          body: Container(
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
                SizedBox(
                  height: 15,
                ),
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
                SizedBox(
                  height: 20,
                ),
                Text(article.description ?? '',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 98, 113, 126))),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    openUrl(article.url);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'View Full Article',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Icon(Icons.play_arrow)
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void openUrl(String? url) async {
    if (url == null) {
      return;
    }
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
