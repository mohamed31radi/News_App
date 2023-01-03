import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String title;
  String image;
  Color color;

  CategoryModel(this.id, this.title, this.image, this.color);

  static List<CategoryModel> getCategories(BuildContext context) {
    return [
      CategoryModel('sports', AppLocalizations.of(context)!.sports,
          'assets/images/ball.png', Color(0xFFC91C22)),
      CategoryModel('general', AppLocalizations.of(context)!.politics,
          'assets/images/politics.png', Color(0xFF003E90)),
      CategoryModel('health', AppLocalizations.of(context)!.health,
          'assets/images/health.png', Color(0xFFED1E79)),
      CategoryModel('business', AppLocalizations.of(context)!.business,
          'assets/images/business.png', Color(0xFFCF7E48)),
      CategoryModel('entertainment', AppLocalizations.of(context)!.environment,
          'assets/images/environment.png', Color(0xFF4882CF)),
      CategoryModel('science', AppLocalizations.of(context)!.science,
          'assets/images/science.png', Color(0xFFF2D352)),
    ];
  }
}
