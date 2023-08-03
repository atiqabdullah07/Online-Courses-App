import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import 'Widgets/home_page_widgets.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(right: 15.w, left: 15.w, top: 20.h),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: homePageText(
                      text: "Hello", color: AppColors.primaryThreeElementText),
                ),
                SliverToBoxAdapter(
                  child: homePageText(
                      text: "Atiq Abdullah", color: AppColors.primaryText),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.h)),
                SliverToBoxAdapter(
                  child: searchBar(),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 10.h)),
                SliverToBoxAdapter(
                  child: sliderView(context, state),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 10.h)),
                SliverToBoxAdapter(
                  child: menuView(),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 0),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.5),
                    delegate: SliverChildBuilderDelegate(childCount: 5,
                        (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: crossGridView(),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
