import 'package:buyer/models/product.dart';
import 'package:buyer/models/recipe.dart';
import 'package:buyer/services/poducts_service.dart';
import 'package:buyer/widget/empty_box.dart';
import 'package:buyer/widget/loading.dart';
import 'package:buyer/widget/product_item.dart';
import 'package:buyer/widget/recipe_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  final String type;

  ProductsList({this.type});

  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.type != 'isToday' ? getProductsList(widget.type, false) : getRecipesList(false),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData)
          return snapshot.data.docs.isNotEmpty
              ? GridView.builder(
                  padding: EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10, childAspectRatio: 0.8),
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, i) {
                    if (widget.type == 'isToday')
                      return RecipeItem(recipe: Recipe.fromDocument(snapshot.data.docs[i]));
                    else
                      return ProductItem(product: Product.fromDocument(snapshot.data.docs[i]));
                  },
                )
              : EmptyBox(text: 'Nothing to show');
        else
          return LoadingData();
      },
    );
  }
}
