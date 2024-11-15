abstract class CourseState {}
  class InitialCourseState extends CourseState{}
class LoadingCourseState extends CourseState{}
class SuccessCourseState extends CourseState{

}
class ErrorCourseState extends CourseState{
  String message;
  ErrorCourseState({required this.message});
}