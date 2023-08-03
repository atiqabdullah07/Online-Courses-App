import 'package:blocapp/Pages/Register/bloc/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Sign_in/bloc/signin_bloc.dart';
import 'Welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        // Provide the initial state here
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc())
      ];
}
