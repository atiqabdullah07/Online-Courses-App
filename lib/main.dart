import 'package:blocapp/Pages/Sign_in/sign_in.dart';

import 'package:blocapp/common/Routes/routes.dart';
import 'package:blocapp/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  // Initialization of everything (e.g FireBase) is done in the Global.init() Method
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        //When we're using multipleBloc provider then only one will be initialized
        //on the start. And by default it is the first bloc
        //providers: AppBlocProviders.allBlocProviders,
        providers: [...AppPages.allProviders(context)],
        child: ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
              builder: EasyLoading.init(),
              title: 'Online Courses App',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const SignIn(),
              // onGenerateRote takes a function that redirect our routes to different pages and screens
              onGenerateRoute: AppPages.GenerateRouteSettings,
              // Its good practice to define ROUTES here
              // routes: {
              //   "signIn": (context) => const SignIn(),
              //   "register": (context) => const Register()
              // },
            );
          },
        ));
  }
}
