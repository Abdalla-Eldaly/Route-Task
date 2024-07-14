import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/network/error_handler.dart';
import '../../../data/network/failure.dart';
import '../../../domain/models/models.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';
import '../../../domain/usecase/search_usecase.dart';
import '../../common/data_intent/data_intent.dart';
import 'states/states.dart';

class SearchViewModel extends BaseCubit implements SearchViewModelInput, SearchViewModelOutput {
  static SearchViewModel get(context) => BlocProvider.of(context);

  final SearchProductUseCase _searchProductUseCase;
  final StreamController<List<Product>> _productStreamController = StreamController<List<Product>>();

  SearchViewModel(this._searchProductUseCase);

  final TextEditingController _searchController = TextEditingController();

  void handleSearchTextChanged(String value) {
    _searchController.text = value;
    if (value.isEmpty) {
      _productStreamController.add([]);
    } else {
      findProducts();
    }
  }

  Future<void> findProducts() async {
    // emit(LoadingState(displayType: DisplayType.popUpDialog));
    await _searchProductUseCase(SearchProductUseCaseInput(query: _searchController.text))
        .then((value) {
      value.fold(
            (l) {
          emit(ErrorState(failure: l, displayType: DisplayType.popUpDialog));
          _productStreamController.addError(l.message);

            },
            (success) {
          _productStreamController.add(success.products ?? []);
          emit(ProductDataSuccessState(products: success.products ?? []));
        },
      );
    }).catchError((error) {
      emit(ErrorState(failure: Failure(ApiInternalStatus.FAILURE, 'Internal server error'), displayType: DisplayType.popUpDialog));
      _productStreamController.addError('Internal server error');
    });
  }

  Stream<List<Product>> get productStream => _productStreamController.stream;

  @override
  void start() {}

  @override
  TextEditingController get getSearchController => _searchController;

  @override
  void dispose() {
    _searchController.dispose();
    _productStreamController.close();
  }
}

abstract class SearchViewModelInput {}

abstract class SearchViewModelOutput {
  TextEditingController get getSearchController;
}
