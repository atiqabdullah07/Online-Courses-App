import 'package:blocapp/Pages/Home%20Page/bloc/home_bloc.dart';
import 'package:blocapp/Pages/Home%20Page/bloc/home_event.dart';
import 'package:blocapp/Pages/Home%20Page/bloc/home_state.dart';
import 'package:blocapp/common/values/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/Widgets/base_text_widget.dart';

// Creating custom AppBar
AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: Image.asset(
      "assets/icons/menu.png",
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.person,
            color: Colors.grey.shade500,
            size: 40.r,
          )),
      SizedBox(
        width: 10.w,
      )
    ],
  );
}

Widget homePageText(
    {required String text,
    Color? color = AppColors.primaryText,
    double top = 0}) {
  return Container(
    margin: EdgeInsets.only(top: top),
    child: Text(
      text,
      style:
          TextStyle(color: color, fontSize: 24.sp, fontWeight: FontWeight.bold),
    ),
  );
}

Widget searchBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(children: [
          Container(
            margin: EdgeInsets.only(left: 10.w),
            height: 16.w,
            width: 16.w,
            child: Image.asset("assets/icons/search.png"),
          ),
          SizedBox(
            width: 200.w,
            height: 40.h,
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 0.h),
                  border: InputBorder.none,
                  hintText: "Search Your Course"),
            ),
          )
        ]),
      ),
      GestureDetector(
        onTap: () {},
        child: Container(
          height: 40.w,
          width: 40.w,
          decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(10.r)),
          child: Image.asset(
            "assets/icons/options.png",
            scale: 2.5,
          ),
        ),
      )
    ],
  );
}

Widget sliderView(BuildContext context, HomeState state) {
  return Column(
    children: [
      Container(
        width: 325.w,
        height: 130.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: PageView(
          onPageChanged: (value) {
            context.read<HomeBloc>().add(ScrollEvent(index: value));
          },
          children: [
            _slidersContainer(path: "assets/icons/Art.png"),
            _slidersContainer(path: "assets/icons/Image(1).png"),
            _slidersContainer(path: "assets/icons/Image(2).png"),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 3,
        position: state.index,
        decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            activeSize: const Size(17.0, 5.0),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            size: const Size.square(5.0)),
      )
    ],
  );
}

Widget _slidersContainer({required String path}) {
  return Container(
    width: 325.w,
    height: 130.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(path))),
  );
}

Widget menuView() {
  return Column(
    children: [
      SizedBox(
        width: 325.w,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          reuseableSubTitleText(text: "Choose your course", size: 16.sp),
          reuseableSubTitleText(
              text: "See all",
              color: AppColors.primaryThreeElementText,
              size: 12.sp),
        ]),
      ),
      SizedBox(
        height: 10.h,
      ),
      Row(
        children: [
          _reuseableMenuText(text: "All"),
          _reuseableMenuText(
              text: "Popular",
              backgroundColor: Colors.white,
              foregroundColor: Colors.grey),
          _reuseableMenuText(
              text: "Newest",
              backgroundColor: Colors.white,
              foregroundColor: Colors.grey),
        ],
      )
    ],
  );
}

Widget _reuseableMenuText(
    {required String text,
    Color backgroundColor = AppColors.primaryElement,
    Color foregroundColor = AppColors.primaryElementText}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7.w),
    ),
    child: reuseableSubTitleText(
        text: text, color: foregroundColor, fontWeight: FontWeight.normal),
  );
}

Widget crossGridView() {
  return Container(
    margin: const EdgeInsets.all(10),
    width: 100.w,
    height: 100.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      image: const DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/icons/Image(2).png"),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best Course for IT and Engineering",
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: AppColors.primaryBackground,
                fontWeight: FontWeight.bold,
                fontSize: 11.sp),
          ),
          SizedBox(
            height: 3.h,
          ),
          Text(
            "Lessons 22",
            maxLines: 1,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: AppColors.primaryBackground,
                fontWeight: FontWeight.bold,
                fontSize: 8.sp),
          ),
        ],
      ),
    ),
  );
}
