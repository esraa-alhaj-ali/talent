abstract class LibraryState{}
class LibraryInitialState extends LibraryState{}
class LibraryLoadingState extends LibraryState{}
final class LibrarySuccessState extends LibraryState {}

final class LibraryError extends LibraryState {
  LibraryError({required this.message});
  String message;
}
