import 'package:flutter/material.dart';
import 'package:news_app/providers/change_body_provider.dart';
import 'package:news_app/screens/categories_screen.dart';
import 'package:news_app/screens/drawer_screen.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/shared/network/remote/api_manger.dart';
import 'package:provider/provider.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

import '../screens/tab_controller.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home screen';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeBodyScreen(),
      builder: (context, child) {
        var provider = Provider.of<ChangeBodyScreen>(context);
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
              actions: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: SearchBarAnimation(
                    enableBoxShadow: false,
                    enableButtonShadow: false,
                    buttonColour: Colors.transparent,
                    buttonShadowColour: Colors.transparent,
                    searchBoxWidth: MediaQuery.of(context).size.width * .95,
                    secondaryButtonWidget: Icon(
                      Icons.close,
                      color: Colors.blue,
                      size: 25,
                    ),
                    buttonWidget: Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                      size: 28,
                    ),
                    trailingWidget: Icon(
                      Icons.search_outlined,
                      color: Colors.blue,
                      size: 25,
                    ),
                    textEditingController: TextEditingController(),
                    isOriginalAnimation: false,
                    buttonBorderColour: Colors.transparent,
                    buttonElevation: 0,
                    onFieldSubmitted: (String value) {
                      debugPrint('onFieldSubmitted value $value');
                      TabControllerScreen.value = value;
                      HomeScreen(provider.categoryModel!);
                    },
                  ),
                ),
              ],
            ),
            drawer: DrawerScreen(),
            body: provider.categoryModel == null
                ? CategoriesScreen(provider.onCategorySelected)
                : HomeScreen(provider.categoryModel!),
          ),
        );
      },
    );
  }
}
