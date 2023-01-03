import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoriesScreen extends StatelessWidget {
  Function onCategorySelected;

  CategoriesScreen(this.onCategorySelected);

  @override
  Widget build(BuildContext context) {
    var categories = CategoryModel.getCategories(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              AppLocalizations.of(context)!.pick_category,
              style: TextStyle(
                  color: Color(0xFF4F5A69),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      onCategorySelected(categories[index]);
                    },
                    child: CategoryItem(categories[index], index));
              },
            ),
          )
        ],
      ),
    );
  }
}
