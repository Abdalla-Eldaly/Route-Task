import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/presentation/main_layout/view/widgets/home_screen_body.dart';
import 'package:route_task/presentation/main_layout/viewmodel/states/home_states.dart';

import '../../../app/di.dart';
import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../viewmodel/home_viewmodel.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeViewModel(sl())..start(),
        child: BlocConsumer<HomeViewModel, BaseStates>(
          listener: (context, state) {
            if (state is ErrorState) {
              Navigator.pop(context);
            }


            baseListener(context, state);
          },
          builder: (context, state) {
            return baseBuilder(
              context,
              state,
              HomeScreenBody(viewModel: HomeViewModel.get(context)),
            );
          },
        ),
      ),
    );
  }
}