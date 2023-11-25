import 'dart:async';

import 'package:alnawadi/src/core/resources/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeResendCounter extends StatefulWidget {
  const CodeResendCounter({
    super.key,
  });

  @override
  State<CodeResendCounter> createState() => _CodeResendCounterState();
}

class _CodeResendCounterState extends State<CodeResendCounter> {
  Timer? _timer;

  int seconds = 120;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer!.cancel();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        setState(() {
          if (seconds == 0) {
            timer.cancel();
          } else {
            seconds--;
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text(
          AppStrings.the_code_validity_will_expire_after.tr(),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.grey,
            fontSize: 12.sp,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '$minutes:${remainingSeconds.toString().padLeft(2, '0')}',
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.yellow.shade900,
          ),
        ),
      ],
    );
  }
}
