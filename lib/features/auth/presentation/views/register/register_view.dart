import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/bottom_nav_bar.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/auth/data/model/request/register_model_params.dart';
import 'package:bookia_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/features/auth/presentation/bloc/auth_events.dart';
import 'package:bookia_app/features/auth/presentation/bloc/auth_states.dart';
import 'package:bookia_app/features/auth/presentation/widget/button_social.dart';
import 'package:bookia_app/features/auth/presentation/widget/or_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var formKey = GlobalKey<FormState>();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is RegisterSuccessStates) {
          pushReplacement(context, BottomNavBar());
        } else if (state is RegisterErrorStates) {
          showErrorDialog(context, state.error.toString());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title:
                IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          ),
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Hello! Register to get started',
                    style: getHeadlineTextStyle(context),
                  ),
                  Gap(30),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'UserName',
                        hintStyle: getSmallTextStyle(context,
                            color: AppColors.greyColor)),
                  ),
                  Gap(15),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: getSmallTextStyle(context,
                            color: AppColors.greyColor)),
                  ),
                  Gap(15),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        suffixIcon: SvgPicture.asset(
                          AssetsIcons.eyeSvg,
                        ),
                        hintText: ' Password',
                        hintStyle: getSmallTextStyle(context,
                            color: AppColors.greyColor)),
                  ),
                  Gap(15),
                  TextFormField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your confirm password';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        suffixIcon: SvgPicture.asset(
                          AssetsIcons.eyeSvg,
                        ),
                        hintText: ' Confirm Password',
                        hintStyle: getSmallTextStyle(context,
                            color: AppColors.greyColor)),
                  ),
                  Gap(15),
                  (state is RegisterLoadingStates)
                      ? CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : CustomButton(
                          color: AppColors.primaryColor,
                          textColor: AppColors.whiteColor,
                          text: 'Register',
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read()<AuthBloc>().add(RegisterEvent(
                                    RegisterModelParams(
                                        email: emailController.text,
                                        name: nameController.text,
                                        password: passwordController.text,
                                        passwordConfirmation:
                                            confirmPasswordController.text),
                                  ));
                            }
                          },
                        ),
                  Gap(15),
                  OrDivider(
                    text: 'Or Register with',
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonOfSocial(
                        imagePath: AssetsIcons.facebookSvg,
                      ),
                      ButtonOfSocial(
                        imagePath: AssetsIcons.googleSvg,
                      ),
                      ButtonOfSocial(
                        imagePath: AssetsIcons.appleSvg,
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: getSmallTextStyle(context),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Login',
                            style: getSmallTextStyle(context,
                                color: AppColors.primaryColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
