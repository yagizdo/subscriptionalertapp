import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subscriptionalertapp/core/constants/color_constant.dart';

import 'package:subscriptionalertapp/features/home/model/subs_model.dart';

import '../../../../core/locators/locators.dart';
import '../../../../core/services/theme/theme_service.dart';

class SubsCardWidget extends StatelessWidget {
  const SubsCardWidget({
    Key? key,
    this.subsModel, this.onTap,
  }) : super(key: key);
  final SubsModel? subsModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final themeService = locator<ThemeService>();

    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: onTap,
      splashColor: Color(
        subsModel?.color_2 ?? ColorConstant.CITRUSPEEL_1,
      ).withOpacity(0.5),
      child: Ink(
        height: 150.h,
        width: 350.w,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          gradient: LinearGradient(
            colors: [
              Color(
                subsModel?.color_1 ?? ColorConstant.CITRUSPEEL_1,
              ),
              Color(
                subsModel?.color_2 ?? ColorConstant.CITRUSPEEL_2,
              ),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      subsModel?.description ?? "Description (Optional)",
                      style: themeService.textStyle.bodyMedium!.copyWith(
                        fontSize: 14,
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      subsModel?.type ?? "Monthly",
                      style: themeService.textStyle.bodyMedium!.copyWith(
                        fontSize: 14,
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
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Text(
                  subsModel?.paymentDate ?? "Day/Month/Year",
                  style: themeService.textStyle.bodyMedium!.copyWith(
                    fontSize: 14,
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
