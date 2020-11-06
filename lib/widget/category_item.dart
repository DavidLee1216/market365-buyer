import 'package:buyer/models/category.dart';
import 'package:buyer/screens/stores/store_selection.dart';
import 'package:buyer/services/navigation_service.dart';
import 'package:buyer/widget/cached_image.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  CategoryItem({this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => open(context, StoreSelect()),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.grey, width: 0.75), borderRadius: BorderRadius.circular(5)),
              child: CachedImage(rounded: false, height: double.infinity, url: category.image),
            ),
          ),
          SizedBox(height: 5),
          Text(category.name),
        ],
      ),
    );
  }
}
