import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/custom_button.dart';
import 'package:alnawadi/src/features/profile/controller/profile_bloc.dart';
import 'package:alnawadi/src/features/profile/screens/personal_info_screen/widget/profile_app_bar.dart';
import 'package:alnawadi/src/features/profile/screens/personal_info_screen/widget/profile_form_field_button.dart';
import 'package:alnawadi/src/features/profile/screens/personal_info_screen/widget/profile_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileBloc>()..add(GetUserDataEvent()),
      child: const Scaffold(
        backgroundColor: AppColors.primary,
        body: SafeArea(
          bottom: false,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ProfileAppBar(),
              ProfileBody(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
  });

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
/*  @override
  void initState() {
    context.read<ProfileBloc>().init();
    super.initState();
    print('init');

  }*/

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        height: 700.h,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child:  const Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            ProfileImage(),
            ProfileFormFieldAndButton(),
          ],
        ),
      ),
    );
  }
}

const image =
    'https://img.freepik.com/free-photo/indoor-picture-cheerful-handsome-young-man-having-folded-hands-looking-directly-smiling-sincerely-wearing-casual-clothes_176532-10257.jpg?w=826&t=st=1692218117~exp=1692218717~hmac=57a7f1dad4fe83703ee196d11c354c21d4ab2f69843170182b38dd0bde99f8a5';
