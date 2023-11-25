import 'package:alnawadi/src/core/widget/grid_view_pagination.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/product_items.dart';
import 'package:alnawadi/src/features/products/presentation/controller/products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestProductScreen extends StatelessWidget {
  const LatestProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أحدث المنتجـــات'),
      ),
      body: const LatestProductsScreenContent(),
    );
  }
}

class LatestProductsScreenContent extends StatelessWidget {
  const LatestProductsScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductBloc bloc = context.read<ProductBloc>();
    return BlocBuilder<ProductBloc, ProductsState>(
      builder: (context, state) {
        return GridViewPagination(
          itemCount: bloc.hasReachedMax
              ? state.paginatedData.length
              : state.paginatedData.length + 1,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            childAspectRatio: 1 / 1.1,
          ),
          itemBuilder: (context, index) {
            if (index >= state.paginatedData.length) {
              return const Center(child: CircularProgressIndicator());
            }

            return ProductsItems(
              product: state.paginatedData[index],
            );
          },
          addEvent: () {
            //  bloc.isPaginated = true;
            // bloc.page++;
            bloc.add(
              const GetMoreProductEvent(),
            );
          },
        );
      },
    );
    /*  return FadeAnimation(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: bloc!.data.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            childAspectRatio: 1 / 1.1,
          ),
          itemBuilder: (BuildContext context, int index) {
            return ProductsItems(
              product: bloc.data[index],
            );
          },
        ),
      ),
    );*/
  }
}
