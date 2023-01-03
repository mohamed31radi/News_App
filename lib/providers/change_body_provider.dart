import 'package:flutter/widgets.dart';

import '../models/category_model.dart';

class ChangeBodyScreen extends ChangeNotifier {
  static bool parameter = false;
  CategoryModel? categoryModel = null;

  void onCategorySelected(categorySelected) {
    categoryModel = categorySelected;
    notifyListeners();
  }
}
