import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/features/settings/widget/settings_container_widget.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    String message = 'Hello';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AppTextStyles.s24W600(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SettingsContainerWidget(
              icon: AppImages.privacyIcon,
              text: 'Privacy Policy',
              onTap: () {},
            ),
            SettingsContainerWidget(
              icon: AppImages.termIcon,
              text: 'Term of use',
              onTap: () {},
            ),
            SettingsContainerWidget(
              icon: AppImages.contuctIcon,
              text: 'Contact us',
              onTap: () {},
            ),
            SettingsContainerWidget(
              icon: AppImages.restoreIcon,
              text: 'Restore',
              onTap: () {},
            ),
            SettingsContainerWidget(
              icon: AppImages.shareIcon,
              text: 'Share app',
              onTap: () {
                Share.share(message);
              },
            ),
          ],
        ),
      ),
    );
  }
}
