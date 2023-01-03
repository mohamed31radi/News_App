import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/change_language_provider.dart';
import 'package:news_app/screens/tab_controller.dart';
import 'package:provider/provider.dart';

import '../shared/network/remote/api_manger.dart';

class HomeScreen extends StatelessWidget {
  CategoryModel categoryModel;

  HomeScreen(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManger.getSources(categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.green,
          ));
        }
        if (snapshot.hasError) {
          return Center(
              child: Text(snapshot.data?.message ?? 'Something went Wrong'));
        }
        if (snapshot.data?.status != 'ok') {
          return Center(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(snapshot.data!.message!)));
        }
        var sources = snapshot.data?.sources ?? [];
        return TabControllerScreen(sources);
      },
    );
  }
}
