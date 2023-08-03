import 'package:blocapp/Pages/Sign_in/Widgets/sign_in_widgets.dart';
import 'package:blocapp/Pages/Sign_in/sign_in_controller.dart';
import 'package:blocapp/common/Routes/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/signin_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SigninState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppBar(title: 'Log In'),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              buildThirdPartyLogin(context),
              reuseableText("Or use your email account to Login"),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    buildTextField('Enter Your Email', 'emial', "user",
                        (value) {
                      context.read<SignInBloc>().add(EmailEvent(value));
                    }),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    buildTextField('Enter Your Password', 'password', "lock",
                        (value) {
                      context.read<SignInBloc>().add(PasswordEvent(value));
                    }),
                    forgetPassword(),
                    buildLoginAndRegButton('Login', () {
                      print('Button Pressed');
                      SignInController(context: context).handleSignIn("email");
                    }),
                    SizedBox(
                      height: 20.h,
                    ),
                    buildLoginAndRegButton('Register', () {
                      Navigator.of(context).pushNamed("/register");
                    }),
                  ],
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
