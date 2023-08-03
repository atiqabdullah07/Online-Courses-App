import 'package:blocapp/Pages/application/bloc/app_bloc.dart';
import 'package:blocapp/Pages/application/bloc/app_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/Routes/names.dart';
import '../../../../common/values/constant.dart';
import '../../../../global.dart';

AppBar settingsAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    title: Text(
      "Settings",
      style: TextStyle(fontSize: 20.sp),
    ),
  );
}

Widget settingsButon(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm Logout"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    Global.storageService
                        .remove(AppConstants.STORAGE_USER_TOKEN_KEY);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoute.SIGNIN, (route) => false);
                    context
                        .read<AppBloc>()
                        .add(const TriggerAppEvent(index: 0));
                  },
                  child: const Text("Log Out"),
                ),
              ],
            );
          });
    },
    child: Container(
      height: 90.h,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/icons/Logout.png"))),
    ),
  );
}
