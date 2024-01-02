import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/features/four_page/four_page.dart';
import 'package:bet_calculator/features/one_page/one_page.dart';
import 'package:bet_calculator/features/settings/settings_page.dart';
import 'package:bet_calculator/features/trhee_page/trhee_page.dart';
import 'package:bet_calculator/features/two_page/two_page.dart';
import 'package:bet_calculator/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        backgroundColor: AppColors.color144D87,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 15,
        selectedFontSize: 15,
        selectedItemColor: AppColors.color144D87,
        unselectedItemColor: AppColors.color144D87,
        currentIndex: index,
        onTap: (indexFrom) async {
          setState(() {
            index = indexFrom;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.groupIcon,
              width: 30,
              color: Colors.white,
            ),
            activeIcon: Image.asset(
              AppImages.groupIcon,
              color: AppColors.color039AFF,
              width: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.calculatorIcon,
              width: 30,
              color: Colors.white,
            ),
            activeIcon: Image.asset(
              AppImages.calculatorIcon,
              color: AppColors.color039AFF,
              width: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.refereeIcon,
              width: 30,
              color: Colors.white,
            ),
            activeIcon: Image.asset(
              AppImages.refereeIcon,
              color: AppColors.color039AFF,
              width: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.mediaIcon,
              width: 30,
              color: Colors.white,
            ),
            activeIcon: Image.asset(
              AppImages.mediaIcon,
              color: AppColors.color039AFF,
              width: 30,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.settingsIcon,
              width: 30,
              color: Colors.white,
            ),
            activeIcon: Image.asset(
              AppImages.settingsIcon,
              color: AppColors.color039AFF,
              width: 30,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> pages = [
  const OnePage(),
  const TwoPage(),
  const TrheePage(),
  const FourPage(),
  const SettingsPage(),
];
