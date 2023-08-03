import 'package:blocapp/Pages/application/application_widgets.dart';
import 'package:blocapp/Pages/application/bloc/app_event.dart';
import 'package:blocapp/common/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/app_bloc.dart';
import 'bloc/app_state.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
                body: buildPage(state.index),
                bottomNavigationBar: Container(
                  width: 375.w,
                  height: 58.h,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade200,
                            spreadRadius: 1,
                            blurRadius: 1),
                      ]),
                  child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      selectedItemColor: AppColors.primaryElement,
                      unselectedItemColor: AppColors.primaryFourElementText,
                      currentIndex: state.index,
                      onTap: (value) {
                        context
                            .read<AppBloc>()
                            .add(TriggerAppEvent(index: value));
                      },
                      elevation: 0,
                      items: bottomTab),
                )),
          ),
        );
      },
    );
  }
}
