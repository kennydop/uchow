import 'package:flutter/material.dart';
import 'package:u_chow/utils/colors.dart';
import 'package:u_chow/utils/constants.dart';
import 'package:u_chow/widgets/AppTextButton.dart';
import 'package:u_chow/widgets/text.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> _pages = [
      "Profile",
      "Payment",
      "My Addresses",
      "Favorite",
      "Support",
      "Privacy",
      "Be a Partner Resturant"
    ];
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.only(top: AppDimensions.height22),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Row(children: [
          if (ModalRoute.of(context)!.canPop)
            const BackButton(
              color: AppColors.textColor,
            )
          else
            SizedBox(width: AppMargin.horizontal),
          AppText(text: "Account", size: AppDimensions.height18)
        ]),
        SizedBox(height: AppDimensions.height8),
        Center(
          child: CircleAvatar(
            backgroundColor: AppColors.secondaryColor,
            backgroundImage: AssetImage("assets/images/pass.jpg"),
            maxRadius: AppDimensions.height48,
          ),
        ),
        SizedBox(height: AppDimensions.height8),
        MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
              itemCount: _pages.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: AppText(text: _pages[index]),
                  onTap: () {},
                );
              }),
        ),
        SizedBox(height: AppDimensions.height8),
        AppTextButton(text: "Log Out", onPressed: () {}),
        SizedBox(height: AppDimensions.height8),
      ]),
    ));
  }
}
