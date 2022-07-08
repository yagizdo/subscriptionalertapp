import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:subscriptionalertapp/features/home/model/subs_model.dart';
import 'package:subscriptionalertapp/features/single_subs/view/single_subs_view.dart';
import '../../../features/init/view_model/init_view_model.dart';
import '../../constants/route_constant.dart';

import '../../../features/home/view/home_view.dart';
import '../../../features/init/view/init_view.dart';
import '../../locators/locators.dart';
import '../local_notification/local_notification_service.dart';
import 'base/base_route_service.dart';

@injectable
class RouteService implements BaseRouteService {
  RouteService(
    @factoryParam this._context,
  );

  final BuildContext _context;


  late final globalRoutes = GoRouter(
    initialLocation: RouteConstant.INIT,
    
    routes: [
      GoRoute(
        path: RouteConstant.INIT,
        builder: (context, state) => const InitView(),
      ),
      GoRoute(
        path: RouteConstant.HOME,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: "${RouteConstant.SINGLE_SUBS}/:subsid",
        builder: (context, state) {
          return SingleSubsView(
            subsid: state.params['subsid'],
            subsModel: state.extra,
          );
        },
      ),
    ],
  );

  @override
  void push({required String route, Object? extra}) {
    GoRouter.of(_context).push(route, extra: extra);
  }

  @override
  void go({required String route, Object? extra}) {
    GoRouter.of(_context).go(route, extra: extra);
  }

  @override
  void pop() {
    GoRouter.of(_context).pop();
  }
}
