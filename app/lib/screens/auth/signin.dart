import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uchow/api_calls/auth.dart';
import 'package:uchow/utils/colors.dart';
import 'package:uchow/utils/constants.dart';
import 'package:uchow/widgets/AppTextButton.dart';
import 'package:uchow/widgets/text.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            text: "Sign In", type: "title", size: AppDimensions.height18),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppMargin.horizontal),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: AppMargin.horizontal),
                        labelText: 'Email',
                        floatingLabelStyle:
                            const TextStyle(color: AppColors.primaryColor),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.primaryColor,
                        ))),
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return 'Email is required';
                      }

                      if (!RegExp(
                              r"[^@ \t\r\n]+@([^@ \t\r\n]{2,})+\.([^@ \t\r\n]{2,})+")
                          .hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }

                      return null;
                    },
                    onSaved: (String? value) {
                      _email = value.toString();
                    },
                  ),
                  SizedBox(height: AppDimensions.height14),
                  TextFormField(
                    obscureText: !showPassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: AppMargin.horizontal),
                        labelText: 'Password',
                        floatingLabelStyle:
                            const TextStyle(color: AppColors.primaryColor),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.primaryColor,
                        )),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                            icon: Icon(
                                showPassword
                                    ? Icons.remove_red_eye_rounded
                                    : Icons.remove_red_eye_outlined,
                                color: showPassword
                                    ? AppColors.primaryColor
                                    : AppColors.primaryBlackColor))),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return 'Password is required';
                      }
                      if (!RegExp(
                              r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$")
                          .hasMatch(value)) {
                        return 'Password must have at least \n• 1 uppercase character, \n• 1 lowercase character, \n• 1 number, \n• 6 characters long.';
                      }

                      return null;
                    },
                    onSaved: (String? value) {
                      _password = value.toString();
                    },
                  ),
                  SizedBox(height: AppDimensions.height14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Don't have an account?",
                        size: AppDimensions.height14,
                      ),
                      SizedBox(width: AppDimensions.width6),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/signup");
                        },
                        child: AppText(
                            text: "Create one",
                            size: AppDimensions.height14,
                            color: AppColors.primaryColor),
                      )
                    ],
                  ),
                  SizedBox(height: AppDimensions.height14),
                  AppTextButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      _formKey.currentState!.save();
                      print(_email);
                      print(_password);
                      //Send to API
                    },
                    text: "Sign In",
                  ),
                  SizedBox(height: AppDimensions.height14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: AppDimensions.height0p5,
                          width: logicalWidth * .4,
                          color: AppColors.primaryBlackColor),
                      AppText(text: "Or"),
                      Container(
                          height: AppDimensions.height0p5,
                          width: logicalWidth * .4,
                          color: AppColors.primaryBlackColor)
                    ],
                  ),
                  SizedBox(height: AppDimensions.height14),
                  AppTextButtonWithIcon(
                      onPressed: () {
                        GoogleAuth().handleSignIn();
                      },
                      image:
                          "https://hackaday.com/wp-content/uploads/2016/08/google-g-logo.png?resize=50",
                      text: "Continue with Google")
                ],
              )),
        ),
      ),
    );
  }
}
