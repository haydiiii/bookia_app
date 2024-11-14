
import 'package:bookia_app/core/widgets/accept_view.dart';
import 'package:bookia_app/features/auth/presentation/views/login/login_view.dart';
import 'package:flutter/material.dart';

class LoginAcceptView extends StatelessWidget {
  const LoginAcceptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AcceptView(titleText: "Reset Password", bodyText:  "Remember Password?", buttonText:   "Login ", nextPage: const LoginView(),)
    );
  }
}
