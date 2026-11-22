import 'package:flutter/cupertino.dart';
import 'package:motion_toast/motion_toast.dart';

class UtilsToast {
  static void toastSuccess(String title, String desc, BuildContext context) {
    return MotionToast.success(
      title: Text(title),
      description: Text(desc),
      toastDuration: Duration(seconds: 3),
      animationCurve: Curves.decelerate,
      enableAnimation: true,
      toastAlignment: Alignment.center,
    ).show(context);
  }

  static void toastError(String title, String desc, BuildContext context) {
    return MotionToast.error(
      title: Text(title),
      description: Text(desc),
      toastDuration: Duration(seconds: 3),
      animationCurve: Curves.decelerate,
      enableAnimation: true,
      toastAlignment: Alignment.center,
    ).show(context);
  }
}
