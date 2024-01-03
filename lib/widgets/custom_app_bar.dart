import 'package:bet_calculator/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.title,
    this.icon,
    this.titleWidget,
    this.centerTitle = true,
    this.actions,
    this.iconColor,
    Key? key,
    this.titleTextStyle,
  }) : super(key: key);
  final String? title;
  final Widget? icon;
  final Widget? titleWidget;
  final bool centerTitle;
  final List<Widget>? actions;
  final TextStyle? titleTextStyle;
  final Color? iconColor;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? Text(title ?? ''),
      titleTextStyle: titleTextStyle ?? AppTextStylesBetCalculator.s24W600(),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: centerTitle,
      iconTheme: IconThemeData(
        color: iconColor ?? Colors.black,
      ),
      leading: icon,
      actions: actions,
    );
  }
}
