
abstract class ProfileState {}

final class ProfileInitial extends ProfileState {}

class GetProfileLoadingState extends ProfileState {}
class GetProfileSuccessfulState extends ProfileState {}
class GetProfileErrorState extends ProfileState {
  final String ?message;
  GetProfileErrorState(
     this.message,
  );
}

class EditProfileLoadingState extends ProfileState {}
class EditProfileSuccessfulState extends ProfileState {}
class EnableEditState extends ProfileState {}
class EditProfileErrorState extends ProfileState {
  final String message;
  EditProfileErrorState({
    required this.message,
  });
}
