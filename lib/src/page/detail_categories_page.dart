import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/provider/categories_provider.dart';
import 'package:provider/provider.dart';

class DetailCategoriesPage extends StatelessWidget {
  final String idCategories;

  const DetailCategoriesPage({Key key, this.idCategories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Provider.of<CategoriesProvider>(context,listen: false).getMenuByCategories(idCategories);
    return Container();
  }
}
