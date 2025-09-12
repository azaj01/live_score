import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:live_score/src/config/app_route.dart';
import 'package:live_score/src/core/extensions/nums.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';

class SoccerLayout extends StatelessWidget {
  const SoccerLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    int currentIndex = switch (location) {
      Routes.soccer => 0,
      Routes.fixtures => 1,
      Routes.standings => 2,
      _ => 0,
    };

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppAssets.appLogo, height: 40.height),
            Text(
              AppStrings.bottomNavTitles[currentIndex],
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go(Routes.soccer);
              break;
            case 1:
              context.go(Routes.fixtures);
              break;
            case 2:
              context.go(Routes.standings);
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer_rounded),
            label: AppStrings.fixtures,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: AppStrings.standings,
          ),
        ],
      ),
    );
  }
}
