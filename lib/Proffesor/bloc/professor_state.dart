abstract class ProfessorState {}

final class ProfessorInitial extends ProfessorState {}

final class ProfessorLoading extends ProfessorState {}

final class ProfessorSuccess extends ProfessorState {}

final class ProfessorError extends ProfessorState {
  ProfessorError({required this.message});
  String message;
}
