import 'package:apphud/apphud.dart';
import 'package:bet_calculator/core/urls.dart';
import 'package:bet_calculator/features/spash/splash_screen.dart';
import 'package:bet_calculator/features/two_page/models/express_model/express_hive_model.dart';
import 'package:bet_calculator/features/two_page/models/system_model/system_hive_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Apphud.start(apiKey: DocFFBetCalculator.apphudApiKey);
  await Hive.initFlutter();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Hive.registerAdapter(ExpressHiveModelAdapter());
  Hive.registerAdapter(SystemHiveModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bet Calculator',
          home: child,
          theme: ThemeData.light().copyWith(
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
