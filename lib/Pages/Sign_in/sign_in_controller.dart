import 'dart:math';

import 'package:blocapp/common/Widgets/flutter_toast.dart';
import 'package:blocapp/Pages/Sign_in/bloc/signin_bloc.dart';

import 'package:blocapp/common/values/constant.dart';
import 'package:blocapp/global.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        //Previously we did the same thing using
        //BlocProvider.of<SignInBloc>(context).state
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill in email address");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill in Password");

          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);

          if (credential.user == null) {
            toastInfo(msg: "No User Exists");
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: "You Need to verify your email account");
            return;
          }

          var user = credential.user;
          if (user != null) {
            Global.storageService
                .setString(AppConstants.STORAGE_USER_TOKEN_KEY, "12345678");
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            toastInfo(msg: "Currently you are not user on this app");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found for the email");
            return;
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong Password Try Again");
            return;
          }
        } catch (e) {}
      }
    } catch (e) {
      log('Sign In Controller ERROR $e' as num);
    }
  }
}
