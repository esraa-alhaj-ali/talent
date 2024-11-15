abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class LogInSuccessState extends AuthState {
  final String? message;
  LogInSuccessState({this.message});
}

class SignUpSuccessState extends AuthState {
  final String? message;
  SignUpSuccessState({this.message});
}

class ErrorState extends AuthState {
  final String message;
  ErrorState({
    required this.message,
  });
}
class SendCodeLoadingState extends AuthState{}
class SendCodeSuccessfulState extends AuthState{
  final String? message;
  SendCodeSuccessfulState({this.message});
}
class SendCodeErrorState extends AuthState{
  final String message;
  SendCodeErrorState({required this.message});
}
class VerifyCodeLoadingState extends AuthState{}
class VerifyCodeSuccessfulState extends AuthState{
  final String? message;
  VerifyCodeSuccessfulState({this.message});
}
class VerifyCodeErrorState extends AuthState{
  final String? message;
  VerifyCodeErrorState( this.message);
}
class RestPasswordLoadingState extends AuthState{}
class RestPasswordSuccessfulState extends AuthState{
  final String? message;
  RestPasswordSuccessfulState({this.message});
}
class RestPasswordErrorState extends AuthState{
  final String? message;
  RestPasswordErrorState( this.message);
}







class LogOutSuccessState extends AuthState {
  final String? message;
  LogOutSuccessState({this.message});
}

