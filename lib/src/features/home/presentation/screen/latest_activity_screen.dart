import 'package:alnawadi/src/core/widget/grid_view_pagination.dart';
import 'package:alnawadi/src/features/activities/presentation/controller/activity_bloc.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/activity_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestActivityScreen extends StatelessWidget {
  const LatestActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أحدث الانشـــطة'),
      ),
      body: const LatestActivityScreenContent(),
    );
  }
}

class LatestActivityScreenContent extends StatelessWidget {
  const LatestActivityScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActivityBloc bloc = context.read<ActivityBloc>();
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (context, state) {
        return GridViewPagination(
          itemCount: bloc.hasReachedMax
              ? state.paginatedData.length
              : state.paginatedData.length + 1,
          itemBuilder: (context, index) {

            if(index >= state.paginatedData.length){
              return const Center(child: CircularProgressIndicator());
            }


            return ActivityItem(
              activity: state.paginatedData[index],
            );
          },
          addEvent: () {
            //  bloc.isPaginated = true;
            // bloc.page++;
            bloc.add(
              const GetMoreActivityEvent(),
            );
          },
        );
      },
    );
  }
}
