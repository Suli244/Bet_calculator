import 'package:bet_calculator/core/image/app_images.dart';
import 'package:bet_calculator/core/premium/premium.dart';
import 'package:bet_calculator/core/urls.dart';
import 'package:bet_calculator/features/settings/widget/settings_container_widget.dart';
import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:bet_calculator/widgets/web_view_bet_calculator.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isPremium = false;
  @override
  void initState() {
    getPremium();
    super.initState();
  }

  getPremium() async {
    isPremium = await PremiumBetCalculator.getPremium();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: AppTextStylesBetCalculator.s24W600(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SettingsContainerWidget(
              icon: AppImages.privacyIcon,
              text: 'Privacy Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFFBetCalculator(
                      title: 'Privacy Policy',
                      url: DocFFBetCalculator.pP,
                    ),
                  ),
                );
              },
            ),
            SettingsContainerWidget(
              icon: AppImages.termIcon,
              text: 'Term of use',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFFBetCalculator(
                      title: 'Term of use',
                      url: DocFFBetCalculator.tUse,
                    ),
                  ),
                );
              },
            ),
            SettingsContainerWidget(
              icon: AppImages.contuctIcon,
              text: 'Contact us',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WebFFBetCalculator(
                      title: 'Contact us',
                      url: DocFFBetCalculator.s,
                    ),
                  ),
                );
              },
            ),
            if (!isPremium)
              SettingsContainerWidget(
                icon: AppImages.restoreIcon,
                text: 'Restore',
                onTap: () async {
                  await PremiumBetCalculator.buyTradeFuncRestore(context);
                },
              ),
            SettingsContainerWidget(
              icon: AppImages.shareIcon,
              text: 'Share app',
              onTap: () {
                Share.share('message');
              },
            ),
          ],
        ),
      ),
    );
  }
}
