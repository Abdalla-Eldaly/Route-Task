import '../../data/network/failure.dart';

enum DisplayType { fullScreen, popUpDialog }

abstract class BaseState {
  final DisplayType displayType;
  BaseState({this.displayType = DisplayType.fullScreen});
}
class EmptyState extends BaseState {
  EmptyState({super.displayType, this.retry});

  final void Function()? retry;}
class LoadingState extends BaseState {
   LoadingState({super.displayType});
}

class ErrorState extends BaseState {
  final Failure failure;
  final void Function()? retry;

  ErrorState({super.displayType, this.retry, required this.failure});

}



class SuccessState extends BaseState {
  SuccessState(this.message) : super(displayType: DisplayType.popUpDialog);
  final String message;
}
