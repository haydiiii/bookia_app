import 'package:bookia_app/features/auth/data/model/request/register_model_params.dart';
import 'package:bookia_app/features/auth/data/repo/auth_repo.dart';
import 'package:bookia_app/features/auth/presentation/bloc/auth_events.dart';
import 'package:bookia_app/features/auth/presentation/bloc/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc() : super(AuthInitialStates()) {
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
  }

  Future <void>login(LoginEvent event, Emitter<AuthStates> emit) async{
    emit(LoginLoadingStates());
   await AuthRepo.login(event.params).then((value) {
      if (value) {
        emit(LoginSuccessStates());
      } else {
        emit(LoginErrorStates(
          "Login is Failed",
        ));
      }
    });
  }
 Future<void> register(RegisterEvent event, Emitter<AuthStates> emit)async {
    emit(RegisterLoadingStates());
 await   AuthRepo.register(event.params).then((value) {
      if (value) {
        emit(RegisterSuccessStates());
      } else {
        emit(RegisterErrorStates(
          "Register is Failed",
        ));
      }
    });

  }
}
