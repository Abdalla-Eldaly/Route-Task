import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/presentation/search_screen/view/widgets/search_body_screen.dart';
import '../../../app/di.dart';
import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../viewmodel/search_viewmodel.dart';
import '../viewmodel/states/states.dart';


class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchViewModel(sl())..start(),
        child: BlocConsumer<SearchViewModel, BaseStates>(
          listener: (context, state) {
            if (state is ErrorState) {
              Navigator.pop(context);
            }
            baseListener(context, state);
          },
          builder: (context, state) {
            final viewModel = SearchViewModel.get(context);
            return baseBuilder(
              context,
              state,
              SearchBodyScreen(viewModel: viewModel),
            );
          },
        ),
      ),
    );
  }
}
