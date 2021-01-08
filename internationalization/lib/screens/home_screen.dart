import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Multi-Language Support",
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Function for changing the language
          setState(() {
            isChanged = !isChanged;
          });
          if (isChanged) {
            EasyLocalization.of(context).locale = Locale('hi');
          } else {
            EasyLocalization.of(context).locale = Locale('en', 'US');
          }
        },
        child: Icon(Icons.translate),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Just use the key value of text declared in lang.json file inside tr()
            Text(
              tr('title'),
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              tr('msg', args: ['Guddu Tyagi']),
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
