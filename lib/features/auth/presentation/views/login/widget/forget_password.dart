import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/auth/presentation/views/login/widget/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: IconButton(onPressed: () {
          pushReplacement(context, ForgetPasswordView());
        }, icon: Icon(Icons.arrow_back_ios)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          //   mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forgot Password?', style: getHeadlineTextStyle(context)),
            Gap(15),
            Text(
              "Don't worry! It happens. Please enter the email address linked with your account.",
              style: getSmallTextStyle(context, color: AppColors.greyColor),
            ),
            Gap(40),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your email address',
                hintStyle: getSmallTextStyle(
                  context,
                  color: AppColors.greyColor,
                ),
              ),
            ),
            Gap(40),
            CustomButton(
              color: AppColors.primaryColor,
              textColor: AppColors.whiteColor,
              text: "Send Code",
              onPressed: () {
              pushReplacement(context, OtpView());
              },
            ),
            Gap(15),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Remember Password?", style: getSmallTextStyle(context)),
                TextButton(
                  onPressed: () {
                    
                  },
                  child: Text(
                    "Login ",
                    style: getSmallTextStyle(
                      context,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
