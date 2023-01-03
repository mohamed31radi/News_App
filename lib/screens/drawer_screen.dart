import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/change_body_provider.dart';
import 'package:news_app/screens/setting_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerScreen extends StatelessWidget {
  CategoryModel? categoryModel = null;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChangeBodyScreen>(context);
    return Drawer(
      width: MediaQuery.of(context).size.width * .80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              color: Colors.green,
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png', height: 100),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context)!.news_app,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.list_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    provider.onCategorySelected(categoryModel);
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context)!.categories,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.settings_outlined,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.pushNamed(context, SettingScreen.routeName);
                  },
                  child: Text(AppLocalizations.of(context)!.settings,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
