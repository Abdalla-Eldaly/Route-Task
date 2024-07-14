import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:route_task/presentation/common/widgets/main_text_field.dart';
import 'package:route_task/presentation/resources/color_manager.dart';

import '../../../../domain/models/models.dart';
import '../../../common/widgets/prodact_card.dart';
import '../../../resources/assets_manger.dart';
import '../../../resources/string_manger.dart';
import '../../../resources/value_manger.dart';
import '../../viewmodel/search_viewmodel.dart';

class SearchBodyScreen extends StatelessWidget {
  const SearchBodyScreen({super.key, required this.viewModel});
  final SearchViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: AppSize.s50),
        SizedBox(
          width: MediaQuery.of(context).size.width * .9,
          child: MainTextField(
            cursorColor: ColorManager.primary,
            controller: viewModel.getSearchController,
            hint: AppStrings.homeSearch,
            prefixIcon:  const Icon(Icons.search,color: ColorManager.primary,),
            onChanged: viewModel.handleSearchTextChanged,     ),
        ),
        Expanded(
          child: StreamBuilder<List<Product>>(
            stream: viewModel.productStream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                return GridView.builder(
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.8,
                      mainAxisSpacing: AppSize.s10,
                      crossAxisSpacing: AppSize.s5),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data?[index];
                    return ProductGridItem(
                      title: item!.title,
                      productImage: item.thumbnail,
                      description: item.description,
                      price: item.price,
                      discount: item.discountPercentage,
                      rating: item.rating,
                    );
                  },
                );
              } else if (snapshot.hasData) {
                return Lottie.asset(LottieAssets.empty);
              } else if (snapshot.hasError) {
                return Lottie.asset(LottieAssets.error);
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
