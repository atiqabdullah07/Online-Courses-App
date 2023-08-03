// We have to bind the routes and bloc
// Because the good practice is to have one bloc for one route
// unify blocProvider and routes and pages

import 'package:blocapp/Pages/Home%20Page/home_page.dart';
import 'package:blocapp/Pages/Profile/Settings/bloc/settings_bloc.dart';
import 'package:blocapp/Pages/Profile/Settings/settings_page.dart';
import 'package:blocapp/Pages/Register/bloc/register_bloc.dart';
import 'package:blocapp/Pages/Register/register.dart';
import 'package:blocapp/Pages/Sign_in/bloc/signin_bloc.dart';
import 'package:blocapp/Pages/Sign_in/sign_in.dart';
import 'package:blocapp/Pages/Welcome/bloc/welcome_bloc.dart';
import 'package:blocapp/Pages/Welcome/welcome.dart';
import 'package:blocapp/Pages/application/application_page.dart';
import 'package:blocapp/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Pages/Home Page/bloc/home_bloc.dart';
import '../../Pages/application/bloc/app_bloc.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoute.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoute.SIGNIN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoute.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBloc(),
          )),
      PageEntity(
          route: AppRoute.APPLICATION,
          page: ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBloc(),
          )),
      PageEntity(
          route: AppRoute.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomeBloc(),
          )),
      PageEntity(
          route: AppRoute.SETTINGS_PAGE,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBloc(),
          )),
    ];
  }

// In this method we're looping through the bloc of the route list and adding them in blocProvider List
// Return all the bloc providers
  static List<dynamic> allProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    print(blocProviders);
    return blocProviders;
  }

// A Model that covers the entire screen as we click on navigator object
// It will get called for every Navigator.of(context) called
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    print("Method Called");
    if (settings.name != null) {
      // Check for route name Matching when navigator gets triggered
      //   print(":Settings: $settings");
      //   print("Settings Name: ${settings.name}");
      var result = routes().where((element) => element.route == settings.name);
      print("Result: $result");

      //   print("Result: $result");

      if (result.isNotEmpty) {
        print('First log');
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();

        // This if statement basically checks that if the App is already opened
        // then don't show the on boarding screens
        if (result.first.route == AppRoute.INITIAL && deviceFirstOpen) {
          // Checking if the user has logged in before. If yes it will navigate to the
          // Application page
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => ApplicationPage(), settings: settings);
          }
          print('2nd log');
          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        //  print("Valid route name ${settings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    print("In-valid route name ${settings.name}");
    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc; // dynamic means it can be anything including null

  PageEntity({required this.route, required this.page, this.bloc});
}
