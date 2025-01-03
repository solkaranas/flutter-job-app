import 'package:flutter/material.dart';
import 'package:jobr/core/routing/router.dart';
import 'package:jobr/features/chat/screens/chat_screen.dart';
import 'package:jobr/features/jobs/job_screen.dart';
import 'package:jobr/features/profile/screens/profile_screen.dart';
import 'package:jobr/ui/theme/jobr_icons.dart';
import 'package:jobr/ui/theme/text_styles.dart';
import 'package:lyte_studios_flutter_ui/lyte_studios_flutter_ui.dart';
import 'package:lyte_studios_flutter_ui/theme/extensions/hex_color.dart';

import '../../profile/screens/recruteren_screen.dart';

class BaseEmployeeDashboard extends StatelessWidget {
  final Widget child;

  final int selectedIndex;

  const BaseEmployeeDashboard({
    super.key,
    required this.child,
    required this.selectedIndex,
  });

  static const String route = '/employee';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (int index) {
          String route = BaseEmployeeDashboard.route;

          switch (index) {
            case 3:
              route = ProfileScreen.route;
            case 2:
              route = ChatScreen.route;
            case 1:
              route = RecruterenScreen.route;
            case 0:
              route = JobScreen.route;
          }

          router.pushReplacement(route);
        },
        selectedLabelStyle: TextStyles.bodySmall.copyWith(
          color: Theme.of(context).primaryColor,
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyles.bodySmall.copyWith(
          fontSize: 12,
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Jobs',
            icon: _NavigationBarIcon(
              icon: JobrIcons.magnifyingGlass,
              selected: selectedIndex == 0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Sollicitaties',
            icon: _NavigationBarIcon(
              icon: JobrIcons.sheet,
              selected: selectedIndex == 1,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: _NavigationBarIcon(
              icon: JobrIcons.chat,
              selected: selectedIndex == 2,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Mijn profiel',
            icon: _NavigationBarIcon(
              icon: JobrIcons.profile,
              selected: selectedIndex == 3,
            ),
          ),
        ],
      ),
      body: child,
    );
  }
}

class BaseEmployerDashboard extends StatelessWidget {
  final Widget child;

  final int selectedIndex;

  const BaseEmployerDashboard({
    super.key,
    required this.child,
    required this.selectedIndex,
  });

  static const String route = '/employer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (int index) {
          String route = BaseEmployerDashboard.route;

          switch (index) {
            case 3:
              route = ProfileScreen.route;
            case 2:
              route = ChatScreen.route;
            case 1:
              route = RecruterenScreen.route;
            case 0:
              route = RecruterenScreen.route;
          }

          router.pushReplacement(route);
        },
        selectedLabelStyle: TextStyles.bodySmall.copyWith(
          color: Theme.of(context).primaryColor,
          fontSize: 12,
        ),
        unselectedLabelStyle: TextStyles.bodySmall.copyWith(
          fontSize: 12,
        ),
        items: [
          BottomNavigationBarItem(
            label: 'Vacatures',
            icon: _NavigationBarIcon(
              icon: JobrIcons.magnifyingGlass,
              selected: selectedIndex == 0,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Recruteren',
            icon: _NavigationBarIcon(
              icon: JobrIcons.magnifyingGlass,
              selected: selectedIndex == 1,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: _NavigationBarIcon(
              icon: JobrIcons.chat,
              selected: selectedIndex == 2,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Over Ons',
            icon: _NavigationBarIcon(
              icon: JobrIcons.profile,
              selected: selectedIndex == 3,
            ),
          ),
        ],
      ),
      body: child,
    );
  }
}

class _NavigationBarIcon extends StatelessWidget {
  final String icon;

  final bool selected;

  const _NavigationBarIcon({
    required this.icon,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      width: 32,
      child: Center(
        child: SvgIcon(
          icon,
          size: 24,
          color: selected
              ? Theme.of(context).primaryColor
              : HexColor.fromHex('#999999'),
        ),
      ),
    );
  }
}
