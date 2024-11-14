import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/auth/presentation/views/login/widget/login_accept_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CreateNewPasswView extends StatefulWidget {
  const CreateNewPasswView({super.key});

  @override
  State<CreateNewPasswView> createState() => _CreateNewPasswViewState();
}

class _CreateNewPasswViewState extends State<CreateNewPasswView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create new password",
              style: getHeadlineTextStyle(context),
            ),
            Gap(15),
            Text(
              "Your new password must be unique from those previously used.",
              style: getSmallTextStyle(context, color: AppColors.greyColor),
            ),
            Gap(40),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "New Password",
                  hintStyle:
                      getSmallTextStyle(context, color: AppColors.greyColor)),
            ),
            Gap(15),
            TextFormField(
              decoration: InputDecoration(
                  hintText: " Confirm Password",
                  hintStyle:
                      getSmallTextStyle(context, color: AppColors.greyColor)),
            ),
            Gap(40),
            CustomButton(
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              text: "Reset Password",
              onPressed: () {
                pushReplacement(context, LoginAcceptView());
              },
            ),
            Gap(15),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Remember Password?",
                  style: getSmallTextStyle(context),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login ",
                      style: getSmallTextStyle(context,
                          color: AppColors.primaryColor),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
