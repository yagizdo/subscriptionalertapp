library home_view;

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subscriptionalertapp/features/home/view/widgets/add_subs_widget.dart';
import '../../../core/locators/locators.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
    this.infoFromNotification,
  }) : super(key: key);

  final Object? infoFromNotification;

  @override
  Widget build(BuildContext context) {
    final homeViewModel = locator<HomeViewModel>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: OpenContainer(
        transitionDuration: const Duration(milliseconds: 500),
        onClosed: (onClosed) {},
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
            const AddSubsWidget(),
        tappable: true,
      ),
      body: Container(),
    );
  }
}
