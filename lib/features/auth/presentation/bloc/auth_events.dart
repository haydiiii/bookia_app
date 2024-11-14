import 'package:bookia_app/features/auth/data/model/request/login_model_params.dart';
import 'package:bookia_app/features/auth/data/model/request/register_model_params.dart';

class AuthEvents {}

class LoginEvent extends AuthEvents {
  final LoginModelParams params;
  LoginEvent(this.params);
}

class RegisterEvent extends AuthEvents {
  final RegisterModelParams params;
  RegisterEvent(this.params);
}
