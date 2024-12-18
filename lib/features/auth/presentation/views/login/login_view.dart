import 'package:bookia_app/core/constants/assets_icons.dart';
import 'package:bookia_app/core/functions/dialogs.dart';
import 'package:bookia_app/core/functions/navigation.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_style.dart';
import 'package:bookia_app/core/widgets/bottom_nav_bar.dart';
import 'package:bookia_app/core/widgets/custom_button.dart';
import 'package:bookia_app/features/auth/data/model/request/login_model_params.dart';
import 'package:bookia_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bookia_app/features/auth/presentation/bloc/auth_events.dart';
import 'package:bookia_app/features/auth/presentation/bloc/auth_states.dart';
import 'package:bookia_app/features/auth/presentation/views/login/widget/forget_password.dart';
import 'package:bookia_app/features/auth/presentation/views/register/register_view.dart';
import 'package:bookia_app/features/auth/presentation/widget/button_social.dart';
import 'package:bookia_app/features/auth/presentation/widget/or_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccessStates) {
          pushReplacement(context, BottomNavBar());
        } else if (state is LoginErrorStates) {
          showErrorDialog(context, state.error.toString());
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            title: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back! Glad to see you, Again!',
                    style: getHeadlineTextStyle(context),
                  ),
                  Gap(30),
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
                      hintText: 'Enter your email address',
                      hintStyle: getSmallTextStyle(
                        context,
                        color: AppColors.greyColor,
                      ),
                    ),
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
                      suffixIcon: SvgPicture.asset(AssetsIcons.eyeSvg),
                      hintText: 'Enter your Password',
                      hintStyle: getSmallTextStyle(
                        context,
                        color: AppColors.greyColor,
                      ),
                    ),
                  ),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          'Forgot password?',
                          style: getSmallTextStyle(context),
                        ),
                        onPressed: () {
                          push(context, ForgetPasswordView());
                        },
                      ),
                    ],
                  ),
                  Gap(15),
                  CustomButton(
                    color: AppColors.primaryColor,
                    textColor: AppColors.whiteColor,
                    text: 'Login',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                          LoginEvent(
                            LoginModelParams(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  Gap(15),
                  OrDivider(text: 'Or Login with'),
                  Gap(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonOfSocial(imagePath: AssetsIcons.facebookSvg),
                      ButtonOfSocial(imagePath: AssetsIcons.googleSvg),
                      ButtonOfSocial(imagePath: AssetsIcons.appleSvg),
                    ],
                  ),
                  Gap(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: getSmallTextStyle(context),
                      ),
                      TextButton(
                        onPressed: () {
                          pushReplacement(context, RegisterView());
                        },
                        child: Text(
                          'Register Now',
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
          ),
        );
      },
    );
  }
}
