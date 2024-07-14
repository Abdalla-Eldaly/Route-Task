import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_task/presentation/resourses/assets_manger.dart';
import 'package:route_task/presentation/resourses/color_manager.dart';
import 'package:route_task/presentation/resourses/string_manger.dart';
import 'package:route_task/presentation/resourses/text_style.dart';
import 'package:route_task/presentation/resourses/value_manger.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../domain/models/models.dart';
import 'main_image.dart';

class ProductGridItem extends StatelessWidget {
  final String productImage;
  final String title;
  final String description;
  final double price;
  final double discount;
  final double rating;

  const ProductGridItem(
      {super.key,
      required this.productImage,
      required this.title,
      required this.description,
      required this.price,
      required this.discount,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: ColorManager.secondary.withOpacity(.35), width: AppSize.s2),
        borderRadius: BorderRadius.circular(AppSize.s16),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSize.s16),
                      topRight: Radius.circular(AppSize.s16),
                    ),
                    child: CachedNetworkImage(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight / 2,
                      imageUrl: productImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(SVGAssets.favouriteLight),
                  )
                ],
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.s10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTextStyles.subhead(context),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          description,
                          style: AppTextStyles.subhead(context),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: AppSize.s5),
                        FittedBox(
                          child: Row(
                            children: [
                              Text(
                                '${AppStrings.egyptionCoin} ${price}',
                                style: AppTextStyles.subhead(context),
                              ),
                              const SizedBox(width: AppSize.s14),
                              Text(
                                '${discount} ${AppStrings.egyptionCoin}',
                                style: TextStyle(
                                  color: ColorManager.primary.withOpacity(.5),
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: ColorManager.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSize.s5),
                        FittedBox(
                          child: Row(
                            children: [
                              Text(
                                '${AppStrings.review} (${rating})',
                                style: AppTextStyles.smallText(context),
                              ),
                              const SizedBox(width: AppSize.s14),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSize.s12),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: AppPadding.p8),
                    child: SvgPicture.asset(SVGAssets.plus),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
