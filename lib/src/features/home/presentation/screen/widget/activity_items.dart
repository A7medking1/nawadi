import 'dart:io';

import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/cached_image_network.dart';
import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/alert_dialog.dart';
import 'package:chewie/chewie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ActivityItem extends StatelessWidget {
  final ActivityData activity;

  const ActivityItem({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.r),
            borderSide: BorderSide(
              color: AppColors.grey.withOpacity(0.3),
            )),
        elevation: 0,
        child: SizedBox(
          //  height: 90.h,
          width: 180.w,
          // color: Colors.red,
          child: Padding(
            padding: EdgeInsets.all(8.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ActivityImageOrVideoWidget(activity: activity),
                5.verticalSpace,
                Text(
                  activity.name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: const Color(0xFF242425),
                        fontSize: 14.sp,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.primary,
                    ),
                    Text(
                      activity.address,
                      style: getRegularStyle(
                          color: AppColors.grey, fontSize: 13.sp),
                    ),
                  ],
                ),
                Text(
                  '\$${activity.price}',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.primary,
                      ),
                ),
                RegisterToActivityButton(
                  onTap: () {
                    final bool isUserSkipLogin =
                        sl<AppPreferences>().isSkipLogin();
                    if (!isUserSkipLogin) {
                      context.pushNamed(Routes.subscriptionActivities,
                          extra: activity);
                    } else {
                      showAlertForSkipSignIn(context);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActivityImageOrVideoWidget extends StatefulWidget {
  const ActivityImageOrVideoWidget({
    super.key,
    required this.activity,
  });

  final ActivityData activity;


  @override
  State<ActivityImageOrVideoWidget> createState() =>
      _ActivityImageOrVideoWidgetState();
}

class _ActivityImageOrVideoWidgetState
    extends State<ActivityImageOrVideoWidget> {
  VideoPlayerController? _videoController;
  ChewieController? chewieController;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(
          16.r,
        ),
        topLeft: Radius.circular(
          16.r,
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: widget.activity.fileType == 'image'
            ? _buildImage()
            : buildVideo(context),
      ),
    );
  }


  SizedBox buildVideo(BuildContext context) {
    return SizedBox(
      width: 100.h,
      height: 120.w,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () {
            _startVideoPlayer(widget.activity.image.toImageUrl).then((_) {
              showAlertDialog(context);
            }).catchError((e) {
              debugPrint(e.toString());
            });
          },
          icon:  const Icon(Icons.play_arrow),
        ),
      ),
    );
  }

  CachedImages _buildImage() {
    return CachedImages(
      height: 100.h,
      width: 120.w,
      imageUrl:
          //ApiConstant.imagePath(
          widget.activity.image.toImageUrl,
      //  ),
      fit: BoxFit.cover,
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        _videoController!.pause();
        _videoController = null;
        chewieController = null;
        context.pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: AspectRatio(
        aspectRatio: _videoController!.value.aspectRatio,
        child: Chewie(
          controller: chewieController!,
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _initController(String link) {
    _videoController = VideoPlayerController.networkUrl(Uri.parse(link))
      ..initialize();
    chewieController = ChewieController(
      videoPlayerController: _videoController!,
    );
  }

  Future<void> _startVideoPlayer(String link) async {
    if (kDebugMode) {
      print(_videoController == null);
      print(chewieController == null);
    }

    if (_videoController == null && chewieController == null) {
      // If there was no controller, just create a new one
      _initController(link);
    } else {
      // If there was a controller, we need to dispose of the old one first
      //   print('here');

      final oldController = _videoController;
      final oldChewieController = chewieController;

      // Registering a callback for the end of the next frame
      // to dispose of an old controller
      // (which won't be used anymore after calling setState)

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await oldController?.dispose();
        oldChewieController?.dispose();

        // Initing new controller
        _initController(link);
      });
    }
  }
}

class RegisterToActivityButton extends StatelessWidget {
  final void Function()? onTap;

  const RegisterToActivityButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.center,
      child: MaterialButton(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(
            15.r,
          ),
        ),
        color: AppColors.primary,
        onPressed: onTap,
        child: Text(
          AppStrings.registering_for_the_activity.tr(),
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontSize: 12.sp, color: AppColors.white),
        ),
      ),
    );
  }
}
