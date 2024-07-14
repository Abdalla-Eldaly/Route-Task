import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:route_task/presentation/resourses/color_manager.dart';
import 'package:route_task/presentation/resourses/string_manger.dart';
import 'package:route_task/presentation/resourses/text_style.dart';
import 'package:route_task/presentation/resourses/value_manger.dart';

import '../../../resourses/assets_manger.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SvgPicture.asset(SVGAssets.routeLogo,width: MediaQuery.of(context).size.width*.25,),
const SizedBox(height: AppSize.s10,),
        Row(
          children: [
            Expanded(child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p14) ,
              height: AppSize.s50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s24),
                border: Border.all(color: ColorManager.primary,width: AppSize.s1)
              ),
              child: Row(
                children: [

                  SvgPicture.asset(SVGAssets.search),
                  const SizedBox(width: AppSize.s10,),

                  Expanded(child: Text(AppStrings.homeSearch,style: AppTextStyles.hintTextStyle(context),))
                ],
              ),
            )),
            const SizedBox(width: AppSize.s20,),

            SvgPicture.asset(SVGAssets.shopping),
            const SizedBox(width: AppSize.s10,),


          ],
        )

      ],
    );
  }
}
