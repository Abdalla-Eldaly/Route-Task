import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:route_task/presentation/common/widgets/prodact_card.dart';
import '../../../../domain/models/models.dart';
import '../../../resources/assets_manger.dart';
import '../../../resources/value_manger.dart';
import '../../viewmodel/home_viewmodel.dart';
import 'home_header.dart';

class HomeScreenBody extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeScreenBody({
    super.key,
    required this.viewModel,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p16, vertical: AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeScreenHeader(),
              const SizedBox(height: AppSize.s20),
              StreamBuilder<List<Product>>(
                stream: viewModel.outputProducts,
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
            ],
          ),
        ),
      ),
    );
  }
}
