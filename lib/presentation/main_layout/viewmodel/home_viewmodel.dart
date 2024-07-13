import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';


import '../../../app/di.dart';
import '../../../domain/models/models.dart';
import '../../../domain/usecase/home_usecase.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';

class HomeViewModel extends BaseCubit implements HomeViewModelInput, HomeViewModelOutput {
  final HomeUseCase _homeUseCase;
  final BehaviorSubject<List<Product>> _productsStreamController = BehaviorSubject<List<Product>>();

  HomeViewModel(this._homeUseCase);

  static HomeViewModel get(BuildContext context) =>
      BlocProvider.of<HomeViewModel>(context);

  @override
  void start() {
    _getProductsHomeData();
  }

  void _getProductsHomeData() {
    emit(LoadingState(displayType: DisplayType.popUpDialog));

    _homeUseCase.call(null).then((value) {
      value.fold(
            (l) {
          emit(ErrorState(failure: l, displayType: DisplayType.fullScreen));
        },
            (homeObject) {
          _productsStreamController.add(homeObject.products ?? []);
        },
      );
    });
  }

  @override
  void dispose() {
    _productsStreamController.close();
  }

  @override
  Sink<List<Product>> get inputProducts => _productsStreamController.sink;

  @override
  Stream<List<Product>> get outputProducts => _productsStreamController.stream;
}

abstract class HomeViewModelInput {
  Sink<List<Product>> get inputProducts;
}

abstract class HomeViewModelOutput {
  Stream<List<Product>> get outputProducts;
}
