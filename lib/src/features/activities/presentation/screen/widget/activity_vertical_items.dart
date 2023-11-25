import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/hepler.dart';
import 'package:alnawadi/src/core/resources/app_colors.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/resources/style.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/widget/cached_image_network.dart';
import 'package:alnawadi/src/features/activities/domain/entity/activity_entity.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/activity_items.dart';
import 'package:alnawadi/src/features/home/presentation/screen/widget/alert_dialog.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';

class ActivityByCatVerticalListItems extends StatelessWidget {
  const ActivityByCatVerticalListItems({
    super.key,
    required this.activity,
  });

  final ActivityData activity;

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      child: Card(
        shape: buildRoundedRectangleBorder(20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            //  color: Colors.black,
            borderRadius: BorderRadiusDirectional.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageOrVideoActivityWidget(activity: activity),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      activity.name,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 20.sp, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      '\$ ${activity.price}',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontSize: 15.sp,
                            color: AppColors.primary,
                          ),
                    ),
                  ],
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                        ),
                        5.horizontalSpace,
                        Text(
                          activity.address,
                          style: getSemiBoldStyle(
                              color: AppColors.grey, fontSize: 15.sp),
                        ),
                      ],
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageOrVideoActivityWidget extends StatefulWidget {
  const ImageOrVideoActivityWidget({
    super.key,
    required this.activity,
  });

  final ActivityData activity;

  @override
  State<ImageOrVideoActivityWidget> createState() => _ImageOrVideoActivityWidgetState();
}

class _ImageOrVideoActivityWidgetState extends State<ImageOrVideoActivityWidget> {
  VideoPlayerController? _videoController;
  ChewieController? chewieController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(15),
        child:widget.activity.fileType == 'image' ? _buildImage()  : buildVideo(context),
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
          icon: const Icon(
            Icons.play_arrow,
            size: 40,
          ),
        ),
      ),
    );
  }

  CachedImages _buildImage() {
    return CachedImages(
      imageUrl: widget.activity.image.toImageUrl,
      fit: BoxFit.cover,
      height: 170.h,
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
