abstract class ChangePasswordState{}
class ChangePasswordInitial extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {
  final String? message;
  ChangePasswordSuccessState({this.message});
}
class ChangePasswordErrorState extends ChangePasswordState {
  final String? message;
  ChangePasswordErrorState({this.message});
}