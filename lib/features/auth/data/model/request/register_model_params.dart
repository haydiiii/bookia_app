class RegisterModelParams {
   String name;
   String email;
   String password;
      String passwordConfirmation;

  RegisterModelParams({required this.name,required this.email,required this.password,required this.passwordConfirmation});
  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'password': password, 'password_confirmation': passwordConfirmation};



}