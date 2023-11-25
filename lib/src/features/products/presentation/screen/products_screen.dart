import 'package:alnawadi/src/core/enums.dart';
import 'package:alnawadi/src/features/products/presentation/controller/products_bloc.dart';
import 'package:alnawadi/src/features/products/presentation/screen/widget/app_bar.dart';
import 'package:alnawadi/src/features/products/presentation/screen/widget/product_category.dart';
import 'package:alnawadi/src/features/products/presentation/screen/widget/product_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProductsScreenContent();
  }
}

class ProductsScreenContent extends StatelessWidget {
  const ProductsScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: productAppBar(context),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocBuilder<ProductBloc, ProductsState>(
            builder: (context, state) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductCatBuilder(),
                  BuildProductList(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
