import 'package:flutter/widgets.dart';

import '../models/category_model.dart';

class ChangeBodyScreen extends ChangeNotifier {
  CategoryModel? categoryModel = null;

  void onCategorySelected(categorySelected) {
    categoryModel = categorySelected;
    notifyListeners();
  }
}
