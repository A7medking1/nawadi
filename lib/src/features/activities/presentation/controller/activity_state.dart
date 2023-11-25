part of 'activity_bloc.dart';

class ActivityState extends Equatable {
  final String message;

  final ActivityEntity? activitiesByCompany;
  final ReqState activitiesByCompanyReqState;
  final ReqState allActivitiesReqState;
  final SelectedCategory selectedCategory;
  final CompaniesEntity? company;
  final ActivityEntity? allActivities;
  final ReqState companyReqState;
  final List<ActivityData> paginatedData;

  final ReqState? subToActivityState;

  const ActivityState({
    this.activitiesByCompanyReqState = ReqState.loading,
    this.allActivitiesReqState = ReqState.loading,
    this.message = '',
    this.activitiesByCompany,
    this.selectedCategory = const SelectedCategory(catId: 0, catName: ''),
    this.company,
    this.companyReqState = ReqState.loading,
    this.allActivities,
    this.subToActivityState,
    this.paginatedData = const [],
  });

  ActivityState copyWith(
      {String? message,
      CompaniesEntity? company,
      ActivityEntity? activitiesByCompany,
      ActivityEntity? allActivities,
      ReqState? activitiesByCompanyReqState,
      ReqState? companyReqState,
      ReqState? allActivitiesReqState,
      SelectedCategory? selectedCategory,
      ReqState? subToActivityState,
      List<ActivityData>? paginatedData}) {
    return ActivityState(
      message: message ?? this.message,
      activitiesByCompany: activitiesByCompany ?? this.activitiesByCompany,
      activitiesByCompanyReqState:
          activitiesByCompanyReqState ?? this.activitiesByCompanyReqState,
      allActivitiesReqState:
          allActivitiesReqState ?? this.allActivitiesReqState,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      company: company ?? this.company,
      companyReqState: companyReqState ?? this.companyReqState,
      allActivities: allActivities ?? this.allActivities,
      subToActivityState: subToActivityState ?? this.subToActivityState,
      paginatedData: paginatedData ?? this.paginatedData,
    );
  }

  @override
  List<Object?> get props => [
        message,
        activitiesByCompany,
        activitiesByCompanyReqState,
        allActivitiesReqState,
        allActivities,
        selectedCategory,
        company,
        subToActivityState,
        companyReqState,
        paginatedData,
      ];
}

class SelectedCategory extends Equatable {
  final int catId;
  final String catName;

  const SelectedCategory({
    required this.catId,
    required this.catName,
  });

  @override
  List<Object> get props => [catId, catName];
}
