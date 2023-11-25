import 'package:alnawadi/src/features/activities/presentation/screen/widget/activity_by_categoty_builder.dart';
import 'package:alnawadi/src/features/activities/presentation/screen/widget/app_bar.dart';
import 'package:alnawadi/src/features/activities/presentation/screen/widget/club_category.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ActivityScreenContent();
  }
}

class ActivityScreenContent extends StatelessWidget {
  const ActivityScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: activityAppBar(context),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClubsBuilder(),
              ActivitiesByCategory(),
            ],
          ),
        ),
      ),
    );
  }
}
