import 'package:flutter/material.dart';
import 'package:news/MyTheme.dart';

class SearchPage extends StatelessWidget {
  static const String routesName = 'search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: TextField(
            decoration: InputDecoration(enabled: false,
                hintText: 'search',
                suffixIcon: IconButton(
                  icon: InkWell(onTap:(){

                  },child: Icon(Icons.search)),
                  onPressed: (){

                  },
                ),prefixIcon: Icon(Icons.clear),
          ),
        ),
    ),
      ));
  }
}
