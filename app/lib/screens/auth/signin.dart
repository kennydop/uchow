import 'package:flutter/material.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/widgets/AppTextButton.dart';
import 'package:u_chow/widgets/text.dart';

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
      body: Padding(
        padding: EdgeInsets.all(AppMargin.horizontal),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                    text: "Sign In",
                    type: "title",
                    size: AppDimensions.height18),
                SizedBox(height: AppDimensions.height20),
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
                    if (value!.isEmpty) {
                      return 'Email is Required';
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
                SizedBox(height: AppDimensions.height20),
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
                    if (value!.isEmpty) {
                      return 'Password is Required';
                    }
                    if (!RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{6,}$")
                        .hasMatch(value)) {
                      return 'Password must have at least \n• 1 uppercase character, \n• 1 lowercase character, \n•1 number, \n• 6 characters long.';
                    }

                    return null;
                  },
                  onSaved: (String? value) {
                    _password = value.toString();
                  },
                ),
                SizedBox(height: AppDimensions.height20),
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
              ],
            )),
      ),
    );
  }
}
