abstract class ContactUsState{}
class ContactUsInitial extends ContactUsState{}
class ContactUsLoading extends ContactUsState{}
class ContactUsSuccess extends ContactUsState {
  String message ;
  ContactUsSuccess({required this.message});
}
class ContactUsError extends ContactUsState{
  String message ;
  ContactUsError({required this.message});
}

