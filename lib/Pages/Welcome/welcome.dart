import 'package:blocapp/Pages/Welcome/bloc/welcome_bloc.dart';
import 'package:blocapp/common/values/colors.dart';
import 'package:blocapp/common/values/constant.dart';
import 'package:blocapp/global.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WelcomeBloc, WelcomeState2>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(alignment: Alignment.topCenter, children: [
              PageView(
                controller: pageController,
                onPageChanged: (index) {
                  state.page = index;

                  BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent2());
                },
                children: [
                  _page(
                      1,
                      context,
                      "Next",
                      "First See Learning",
                      "Forget about a for of paper all the knowledge in one learnings",
                      "assets/images/reading.png"),
                  _page(
                      2,
                      context,
                      "Next",
                      "Connect with Everyone",
                      "Always keep in touch with your tutor & friend. Lets get connected",
                      "assets/images/boy.png"),
                  _page(
                      3,
                      context,
                      "Get Started",
                      "Always Fascinated Learning",
                      "Anywhere, anytime. The time is at your discretion so study whenever you want",
                      "assets/images/man.png"),
                ],
              ),
              Positioned(
                  bottom: 70.h,
                  child: DotsIndicator(
                    position: state.page,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8),
                        activeSize: const Size(20, 8),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ))
            ]),
          );
        },
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(fontSize: 24.sp),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(fontSize: 14.sp, color: Colors.grey),
          ),
        ),
        InkWell(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            } else {
              Global.storageService
                  .setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              //   print("The Value is: ${Global.storageService.getDeviceFirstOpen()}");
              // Navigating to a new page using Pre-Defined Routes in the Material App
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/sign_in', (route) => false);
              // This route False will ignore all the previus routes and will not display
              // a back button the new screen
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(0, 10))
                ],
                borderRadius: BorderRadius.all(Radius.circular(15.r))),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(color: Colors.white, fontSize: 15.sp),
              ),
            ),
          ),
        )
      ],
    );
  }
}
