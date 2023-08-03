import 'package:blocapp/common/Routes/routes.dart';
import 'package:blocapp/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar profileAppBar() {
  return AppBar(
    foregroundColor: Colors.black,
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text(
      "Profile",
      style: TextStyle(fontSize: 20.sp),
    ),
    leading: SizedBox(
      height: 18.h,
      width: 12.w,
      child: Image.asset("assets/icons/menu.png"),
    ),
    actions: [
      SizedBox(
        child: Image.asset("assets/icons/more-vertical.png"),
      )
    ],
  );
}

Widget profileIcon() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
          width: 90.w,
          height: 80.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.h),
            image: const DecorationImage(
              image: AssetImage("assets/icons/headpic.png"),
            ),
          ),
          child: Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 10.w, bottom: 5.h),
            child: Image(
              height: 30.w,
              width: 30.w,
              image: const AssetImage("assets/icons/edit_3.png"),
            ),
          )),
    ],
  );
}

var imagesInfo = <String, String>{
  "Settings": "settings",
  "Payment Details": "credit-card",
  "Achievement": "award",
  "Love": "heart(1)",
  "Reminders": "cube"
};

Widget settingsList(BuildContext context) {
  return Column(
    children: [
      ...List.generate(imagesInfo.length, (index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.0.h),
          child: GestureDetector(
            onTap: () {
              if (imagesInfo.keys.elementAt(index) == "Settings") {
                Navigator.of(context).pushNamed(AppRoute.SETTINGS_PAGE);
              }
            },
            child: Row(children: [
              Container(
                width: 40.w,
                height: 40.w,
                padding: EdgeInsets.all(7.r),
                decoration: BoxDecoration(
                    color: AppColors.primaryElement,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Image.asset(
                    "assets/icons/${imagesInfo.values.elementAt(index)}.png"),
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                imagesInfo.keys.elementAt(index),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
              )
            ]),
          ),
        );
      }),
    ],
  );
}
