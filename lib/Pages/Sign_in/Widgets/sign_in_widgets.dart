import 'package:blocapp/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppBar({required String title}) {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
          //Height Defines the Thickness of Line
          height: 0.5,
          color: Colors.grey),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    foregroundColor: Colors.black,
    automaticallyImplyLeading: true,
    title: Text(
      title,
      style: const TextStyle(color: Colors.black),
    ),
  );
}

// We Need Context for accessing BLOC
Widget buildThirdPartyLogin(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 50, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _reuseableIcons("google"),
          _reuseableIcons("apple"),
          _reuseableIcons("facebook")
        ],
      ),
    ),
  );
}

Widget _reuseableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset("assets/icons/$iconName.png"),
    ),
  );
}

Widget reuseableText(String text) {
  return Center(
    child: Text(
      text,
      style: const TextStyle(color: Colors.grey),
    ),
  );
}

Widget buildTextField(String text, String textType, String iconName,
    void Function(String value)? func) {
  return Container(
    height: 50.h,
    width: 325.w,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(15.r))),
    child: Row(children: [
      Container(
        margin: EdgeInsets.only(left: 17.w),
        width: 16.w,
        height: 16.h,
        child: Image.asset("assets/icons/$iconName.png"),
      ),
      SizedBox(
        width: 250.w,
        child: TextField(
          onChanged: (value) {
            func!(value);
          },
          autocorrect: false,
          obscureText: textType == "password" ? true : false,
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              hintText: text,
              hintStyle: const TextStyle(color: Colors.grey),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent))),
        ),
      )
    ]),
  );
}

Widget forgetPassword() {
  return Container(
    margin: EdgeInsets.only(left: 10.w, top: 10.h),
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: const Text(
        "Forget Pasword",
        style: TextStyle(
            color: AppColors.primaryText,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue),
      ),
    ),
  );
}

Widget buildLoginAndRegButton(String buttonName, void Function()? func) {
  return InkWell(
    onTap: func,
    child: Container(
      width: 325.h,
      height: 50.h,
      decoration: BoxDecoration(
          color: buttonName == "Login" || buttonName == "Sign Up"
              ? AppColors.primaryElement
              : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          border: Border.all(
              color: buttonName == "Login" ? Colors.transparent : Colors.grey)),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            fontSize: 15.sp,
            color: buttonName == "Login" || buttonName == "Sign Up"
                ? AppColors.primaryBackground
                : Colors.black),
      )),
    ),
  );
}
