import 'package:flutter/material.dart';
import 'package:news_app/screens/tab_controller.dart';
import 'package:news_app/shared/network/remote/api_manger.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home screen';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'), fit: BoxFit.cover),
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
          leading: Icon(Icons.list, size: 35),
          title: Text('News'),
        ),
        body: FutureBuilder(
          future: ApiManger.getSources(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: CircularProgressIndicator(
                color: Colors.green,
              ));
            }
            if (snapshot.hasError) {
              return Center(
                  child:
                      Text(snapshot.data?.message ?? 'Something went Wrong'));
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
        ),
      ),
    );
  }
}
