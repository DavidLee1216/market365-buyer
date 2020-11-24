import 'package:buyer/models/recipe.dart';
import 'package:buyer/screens/home/recipe/view_recipe.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  RecipeItem({this.recipe});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => open(context, ViewRecipe(recipe: recipe)),
      child: Column(
        children: [
          Expanded(child: CachedImage(rounded: false, height: double.infinity, url: recipe.imageUrl)),
          SizedBox(height: 10),
          Text(recipe.title),
        ],
      ),
    );
  }
}
