import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/change_language_provider.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;

  CategoryItem(this.categoryModel, this.index);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguageProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: categoryModel.color,
          borderRadius: provider.language == 'en'
              ? BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                  bottomLeft:
                      index.isEven ? Radius.circular(25) : Radius.circular(0),
                  bottomRight:
                      index.isOdd ? Radius.circular(25) : Radius.circular(0),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                  bottomLeft:
                      index.isEven ? Radius.circular(0) : Radius.circular(25),
                  bottomRight:
                      index.isOdd ? Radius.circular(0) : Radius.circular(25),
                )),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              categoryModel.image,
              height: 100,
            ),
          ),
          Center(
            child: Text(categoryModel.title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
