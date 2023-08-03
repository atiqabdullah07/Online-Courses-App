import 'package:blocapp/common/Widgets/flutter_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Models/user_model.dart';
import 'bloc/register_bloc.dart';

class RegisterController {
  final BuildContext context;
  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;

    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Username can'not be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email can'not be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Please Enter a Password");
      return;
    }
    if (rePassword.isEmpty) {
      toastInfo(msg: "Please Confirm Your Password");
      return;
    }

    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      var user = credential.user;

      if (user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(msg: "An Email has been sent to you. Active your account");
        String? displayName = user.displayName;
        String? email = user.email;
        String? id = user.uid;
        String? photoUrl = user.photoURL;
        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.email = email;
        loginRequestEntity.openId = id;
        // Login type 1 means login from email
        loginRequestEntity.type = 1;

        postAllData(loginRequestEntity);

        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "Enter a Strong Password");
        return;
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "This Email is already in use");
        return;
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Invalid Email");
        return;
      }
    }
  }

  void postAllData(LoginRequestEntity loginRequestEntity) {
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('User').add(loginRequestEntity.toJson()).then((value) {
      print('User added successfully!');
    }).catchError((error) {
      print('Failed to add user: $error');
    });
    EasyLoading.dismiss();
  }
}
