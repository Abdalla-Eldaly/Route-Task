import 'package:flutter/material.dart';

import '../resourses/assets_manger.dart';
import '../resourses/string_manger.dart';
import 'base_states.dart';
import 'base_widgets.dart';


void baseListener(BuildContext context, BaseState state) {
  if (state.displayType == DisplayType.fullScreen) return;

 if (state is SuccessState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildAnimatedImage(LottieAssets.success),
      BaseWidgets.buildMessage(context, state.message),
    ]);
  } else if (state is LoadingState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildAnimatedImage(LottieAssets.loading),
    ]);
  } else if (state is ErrorState) {
    BaseWidgets.showPopUpDialog(context, [
      BaseWidgets.buildAnimatedImage(LottieAssets.error),
      BaseWidgets.buildMessage(context, state.failure.message),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.retry,
          title: AppStrings.retryAgain),
    ]);
  }  else if (state is EmptyState) {
    BaseWidgets.showPopUpDialog(context, [
      // BaseWidgets.buildAnimatedImage(LottieAssets.error),
      BaseWidgets.buildMessage(context, AppStrings.emptyContent),
      BaseWidgets.buildButton(
          displayType: state.displayType,
          context: context,
          onTap: state.retry,
          title: AppStrings.retryAgain),
    ]);
  }
}
