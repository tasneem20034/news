import 'package:flutter/material.dart';
import 'package:news/MyTheme.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories=1;
  static const int settings=2;
   Function onSideMenue;
HomeDrawer({required this.onSideMenue});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1),
            color: MyTheme.primaryLight,
            child: Text(
              'NewsApp !',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 15,),
          InkWell(onTap: (){
            onSideMenue(HomeDrawer.categories);
          },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(  children: [Icon(Icons.list),
              SizedBox( width: 10,),
              Text('Categories',style: Theme.of(context).textTheme.titleMedium,)],),
            ),
          ),
          InkWell(onTap: (){
            onSideMenue(HomeDrawer.settings);
          },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(  children: [Icon(Icons.settings),
                SizedBox( width: 10,),
                Text('Settings',style: Theme.of(context).textTheme.titleMedium,)],),
            ),
          )
        ],
      ),
    );
  }
}
