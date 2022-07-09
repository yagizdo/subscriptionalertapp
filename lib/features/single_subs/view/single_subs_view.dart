import 'package:flutter/material.dart';

import '../../../core/init/service_locators_init.dart';
import '../../../core/services/route/route_service.dart';
import '../../home/view/widgets/subs_card_widget.dart';
import '../view_model/single_subs_view_model.dart';

class SingleSubsView extends StatelessWidget {
  const SingleSubsView({
    Key? key,
    this.subsid,
    this.subsModel,
  }) : super(key: key);

  final Object? subsid;
  final Object? subsModel;

  @override
  Widget build(BuildContext context) {
    final singleSubsViewModel = locator<SingleSubsViewModel>();

    singleSubsViewModel.getSubsModel(subsid: subsid, subs: subsModel);

    final routeService = locator<RouteService>(param1: context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => routeService.pop(),
        ),
      ),
      body: Center(
        child: SubsCardWidget(
          subsModel: singleSubsViewModel.subsModel,
        ),
      ),
    );
  }
}
