abstract class OffersState {}

final class OffersInitial extends OffersState {}

final class OffersLoading extends OffersState {}

final class OffersSuccess extends OffersState {}

final class OffersError extends OffersState {
  OffersError({required this.message});
  String message;
}
