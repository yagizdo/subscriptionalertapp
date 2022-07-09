import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/color_constant.dart';

import '../../model/subs_model.dart';

import '../../../../core/constants/radius_constant.dart';
import '../../../../core/init/service_locators_init.dart';
import '../../../../core/services/theme/theme_service.dart';

class SubsCardWidget extends StatelessWidget {
  const SubsCardWidget({
    Key? key,
    this.subsModel,
    this.onTap,
  }) : super(key: key);
  final SubsModel? subsModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final themeService = locator<ThemeService>();

    return InkWell(
      borderRadius: BorderRadius.circular(RadiusConstant.MIN.r),
      onTap: onTap,
      splashColor: Color(
        subsModel?.color_2 ?? ColorConstant.CITRUSPEEL_1,
      ).withOpacity(0.5),
      child: Ink(
        height: 150.h,
        width: 350.w,
        padding: EdgeInsets.all(12.0.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusConstant.MIN.r),
          gradient: LinearGradient(
            colors: [
              Color(
                subsModel?.color_1 ?? ColorConstant.CITRUSPEEL_1,
              ),
              Color(
                subsModel?.color_2 ?? ColorConstant.CITRUSPEEL_2,
              ),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subsModel?.name ?? "Platform Name",
                      style: themeService.textStyle.bodyMedium!.copyWith(
                        fontSize: 18.sm,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      subsModel?.description ?? "Description (Optional)",
                      style: themeService.textStyle.bodyMedium!.copyWith(
                        fontSize: 14.sm,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      subsModel?.price ?? "0.0",
                      style: themeService.textStyle.bodyMedium!.copyWith(
                        fontSize: 18.sm,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      subsModel?.type ?? "Monthly",
                      style: themeService.textStyle.bodyMedium!.copyWith(
                        fontSize: 14.sm,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upcoming payment",
                  style: themeService.textStyle.bodyMedium!.copyWith(
                    fontSize: 14.sm,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  subsModel?.paymentDate ?? "Day/Month/Year",
                  style: themeService.textStyle.bodyMedium!.copyWith(
                    fontSize: 14.sm,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
