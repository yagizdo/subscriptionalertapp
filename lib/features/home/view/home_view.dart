library home_view;

import 'package:animations/animations.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subscriptionalertapp/core/constants/color_constant.dart';
import 'package:subscriptionalertapp/core/constants/radius_constant.dart';
import 'package:subscriptionalertapp/core/constants/route_constant.dart';
import 'package:subscriptionalertapp/core/constants/string_constant.dart';
import 'package:subscriptionalertapp/features/home/model/subs_model.dart';
import 'package:subscriptionalertapp/features/home/view/widgets/subs_card_widget.dart';
import 'package:uuid/uuid.dart';
import '../../../core/locators/locators.dart';
import '../../../core/services/local_notification/local_notification_service.dart';
import '../../../core/services/route/route_service.dart';
import '../../../core/services/theme/theme_service.dart';
import '../../init/view_model/init_view_model.dart';
import '../view_model/home_view_model.dart';

part 'widgets/add_subs_widget.dart';
part 'widgets/add_subs_form_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeViewModel = locator<HomeViewModel>();
  final initViewModel = locator<InitViewModel>();
  late final routeService = locator<RouteService>(param1: context);
  final localNotificationService = locator<LocalNotificationService>();

  @override
  void initState() {
    super.initState();
    homeViewModel.getSubsList();

    localNotificationService.onNotifications.stream.listen(
      (payload) {
        if (payload != null) {
          routeService.push(
            route: "${RouteConstant.SINGLE_SUBS}/$payload",
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            initViewModel.changeTheme();
          },
          icon: Observer(builder: (_) {
            return Icon(initViewModel.brightness == Brightness.light
                ? Icons.brightness_2
                : Icons.brightness_7);
          }),
        ),
        title: Text(
          StringConstant.APP_NAME,
        ),
      ),
      floatingActionButton: OpenContainer(
        transitionDuration: const Duration(milliseconds: 500),
        onClosed: (onClosed) {},
        closedColor: Colors.transparent,
        closedBuilder: (BuildContext c, VoidCallback action) => Padding(
          padding: EdgeInsets.all(12.sm),
          child: FloatingActionButton.extended(
            onPressed: () {
              action();
            },
            icon: const Icon(Icons.add),
            label: const Text("Add Subscription"),
          ),
        ),
        openBuilder: (BuildContext c, VoidCallback action) =>
            AddSubsWidget(onSubmitted: action),
        tappable: true,
      ),
      body: Container(
        child: Observer(
          builder: (_) {
            return ListView.builder(
              addAutomaticKeepAlives: true,
              reverse: true,
              itemCount: homeViewModel.subsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SubsCardWidget(
                    subsModel: homeViewModel.subsList[index],
                    onTap: () {
                      routeService.push(
                        route:
                            "${RouteConstant.SINGLE_SUBS}/${homeViewModel.subsList[index].id!}",
                        extra: homeViewModel.subsList[index],
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
