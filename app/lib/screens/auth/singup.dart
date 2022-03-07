import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uchow/api_calls/google_auth.dart';
import 'package:uchow/utils/colors.dart';
import 'package:uchow/utils/constants.dart';
import 'package:uchow/widgets/AppTextButton.dart';
import 'package:uchow/widgets/text.dart';

class SingUp extends StatefulWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  String _firstName = "";
  String _lastName = "";
  String _middleName = "";
  bool showPassword = false;
  bool showConfirmPassword = false;
  final googleAuth = GoogleAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
            text: "Sign Up", type: "title", size: AppDimensions.height18),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: AppColors.textColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppMargin.horizontal),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: AppMargin.horizontal),
                        labelText: 'First Name',
                        floatingLabelStyle:
                            const TextStyle(color: AppColors.primaryColor),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.primaryColor,
                        ))),
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return 'First Name is required';
                      }
                      if (value.trim().length < 2) {
                        return 'Name must be at least 2 characters';
                      }

                      return null;
                    },
                    onSaved: (String? value) {
                      _firstName = value.toString();
                    },
                  ),
                  SizedBox(height: AppDimensions.height14),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: AppMargin.horizontal),
                        labelText: 'Middle Name',
                        floatingLabelStyle:
                            const TextStyle(color: AppColors.primaryColor),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.primaryColor,
                        ))),
                    onSaved: (String? value) {
                      _middleName = value.toString();
                    },
                  ),
                  SizedBox(height: AppDimensions.height14),
                  TextFormField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: AppMargin.horizontal),
                        labelText: 'Last Name',
                        floatingLabelStyle:
                            const TextStyle(color: AppColors.primaryColor),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppColors.primaryColor,
                        ))),
                    validator: (String? value) {
                      if (value!.trim().isEmpty) {
                        return 'Last Name is required';
                      }
                      if (value.trim().length < 2) {
                        return 'Name must be at least 2 characters';
                      }

                      return null;
                    },
                    onSaved: (String? value) {
                      _lastName = value.toString();
                    },
                  ),
                  SizedBox(height: AppDimensions.height14),
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
                    onChanged: (String? value) {
                      _password = value.toString();
                    },
                  ),
                  SizedBox(height: AppDimensions.height14),
                  TextFormField(
                    obscureText: !showConfirmPassword,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: AppMargin.horizontal),
                        labelText: 'Confirm Password',
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
                                showConfirmPassword = !showConfirmPassword;
                              });
                            },
                            icon: Icon(
                                showConfirmPassword
                                    ? Icons.remove_red_eye_rounded
                                    : Icons.remove_red_eye_outlined,
                                color: showConfirmPassword
                                    ? AppColors.primaryColor
                                    : AppColors.primaryBlackColor))),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (String? value) {
                      if (value!.trim().isEmpty || value != _password) {
                        return 'Passwords must match';
                      }

                      return null;
                    },
                    onSaved: (String? value) {
                      _confirmPassword = value.toString();
                    },
                  ),
                  SizedBox(height: AppDimensions.height14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Already have an account?",
                        size: AppDimensions.height14,
                      ),
                      SizedBox(width: AppDimensions.width6),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed("/signin");
                        },
                        child: AppText(
                            text: "Sign In",
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
                      print(_confirmPassword);
                      print(_firstName);
                      print(_middleName);
                      print(_lastName);
                      //Send to API
                    },
                    text: "Sign Up",
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
                        googleAuth.handleSignIn();
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
