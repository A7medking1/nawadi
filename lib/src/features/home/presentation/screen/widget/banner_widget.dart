import 'package:alnawadi/src/core/api/api_constant.dart';
import 'package:alnawadi/src/core/widget/cached_image_network.dart';
import 'package:alnawadi/src/features/home/presentation/controller/home_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return CustomSlider(
          items: state.banners
              .map(
                (e) => CachedImages(
                  imageUrl: ApiConstant.imagePath(e.image),
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class CustomSlider extends StatelessWidget {
  final List<Widget>? items;

  const CustomSlider({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items,
      options: CarouselOptions(
        height: 250,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 4),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
