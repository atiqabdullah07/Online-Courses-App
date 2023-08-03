import 'package:blocapp/Pages/Register/bloc/register_event.dart';
import 'package:blocapp/Pages/Register/reqister_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Sign_in/Widgets/sign_in_widgets.dart';
import 'bloc/register_bloc.dart';
import 'bloc/register_state.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: customAppBar(title: 'Sign Up'),
          body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20.h,
              ),
              reuseableText("Enter your details and join us"),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Username',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    buildTextField('Enter Your User name', 'username', "user",
                        (value) {
                      context.read<RegisterBloc>().add(UserNameEvent(value));
                    }),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    buildTextField('Enter Your Email', 'email', "user",
                        (value) {
                      context.read<RegisterBloc>().add(EmailRegEvent(value));
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
                      context.read<RegisterBloc>().add(PasswordRegEvent(value));
                    }),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text(
                      'Confirm Password',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    buildTextField('Re-Enter your password', 'password', "lock",
                        (value) {
                      context.read<RegisterBloc>().add(RePassEvent(value));
                    }),
                    SizedBox(
                      height: 20.h,
                    ),
                    buildLoginAndRegButton('Sign Up', () {
                      RegisterController(context: context)
                          .handleEmailRegister();
                    }),
                    SizedBox(
                      height: 20.h,
                    ),
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
