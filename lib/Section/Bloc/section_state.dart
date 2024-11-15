
abstract class SectionState {}

final class SectionInitial extends SectionState {}

final class SectionLoading extends SectionState {}

final class SectionSuccess extends SectionState {}

final class SectionError extends SectionState {
  SectionError({required this.message});
  String message;
}
