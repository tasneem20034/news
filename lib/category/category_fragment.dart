import 'package:flutter/material.dart';
import 'package:news/category/categoryDm.dart';
import 'package:news/category/categoryitem.dart';

class CategoryFragment extends StatelessWidget {
  var categoriesList=CategoryDM.getCategories();
  Function onCategoryClick;
  CategoryFragment({required this.onCategoryClick});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Pick your category \nof interest',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
            ),
            SizedBox(height: 15,),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
                itemBuilder:(context,index){
                  return InkWell(onTap:(){
                    onCategoryClick(categoriesList[index]);
                  },child: CategoryItem(categoryDM: categoriesList[index], index: index));
                },
                itemCount
                :categoriesList.length ,),
            )
          ],
        ),
      ),
    );
  }
}
