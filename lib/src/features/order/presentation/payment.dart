import 'package:alnawadi/src/core/app_prefs/app_prefs.dart';
import 'package:alnawadi/src/core/resources/routes_manager.dart';
import 'package:alnawadi/src/core/services/index.dart';
import 'package:alnawadi/src/core/show_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';

class PaymentWeb extends StatefulWidget {
  final String content;

  const PaymentWeb({Key? key, required this.content}) : super(key: key);

  @override
  State<PaymentWeb> createState() => _PaymentWebState();
}

class _PaymentWebState extends State<PaymentWeb> {
  InAppWebViewController? _webViewController;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        initialData: InAppWebViewInitialData(data: widget.content),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        onLoadStart: (inAppWebViewController, uri) async {
          print(uri);
        },
        onLoadStop: (inAppWebViewController, uri) {
          /// payment status id
          // 1 => pending
          // 2 => paid
          // 3 => canceled
          // 4 => failed
          // 5 => rejected

          String url = uri.toString();

          if (url.contains('statusId=2')) {
            /// paid
            _paymentRequest('skip-succss').then((value) {
              context.goNamed(Routes.successPayOrder);
            });
          }

          if (url.contains('statusId=3') ||
              url.contains('statusId=4') ||
              url.contains('statusId=5')) {
            /// failed
            _paymentRequest('skip-cancel').then((value) {
              showToast(
                  msg: 'payment failed',
                  state: ToastStates.ERROR,
                  timeInSec: 5);
              Future.delayed(const Duration(seconds: 1),
                  () => context.goNamed(Routes.home));
            });
          }
        },
      ),
    );
  }

  Future<void> _paymentRequest(String path) async {
    String userToken = sl<AppPreferences>().getUserToken();

    final Dio dio = sl<Dio>();
    await dio.post(
      'https://wealthest22.com/elnawadi_backend/public/api/$path',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken',
      }),
    );
  }
}
