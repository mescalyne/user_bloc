import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:userlist_app/features/user/domain/entities/user.dart';
import 'package:userlist_app/features/user/presentation/screens/user_info_screen.dart';
import 'package:userlist_app/features/user/presentation/screens/user_list_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: UserListRoute.page, initial: true),
    AutoRoute(page: UserInfoRoute.page),
  ];
}
