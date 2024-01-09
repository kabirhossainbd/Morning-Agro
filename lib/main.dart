import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvesthub_agro/controller/localization_controller.dart';
import 'package:harvesthub_agro/controller/theme_controller.dart';
import 'package:harvesthub_agro/services/local_string.dart';
import 'package:harvesthub_agro/src/config/routes/route_helper.dart';
import 'package:harvesthub_agro/src/config/themes/dark_theme.dart';
import 'package:harvesthub_agro/src/config/themes/light_theme.dart';
import 'package:harvesthub_agro/src/config/themes/m_theme_util.dart';
import 'package:harvesthub_agro/src/utils/constants/m_strings.dart';
import 'src/locator.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeUtil.allScreenTheme();
  await di.init();
  Map<String, Map<String, String>> localString = await di.init();
  runApp( MyApp(localString: localString,));
}

class MyApp extends StatefulWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  final Map<String, Map<String, String>> localString;
  const MyApp({Key? key, required this.localString}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (theme) {
      return GetBuilder<LocalizationController>(builder: (local) {
        return GetMaterialApp(
          locale: local.locale,
         // locale: Get.deviceLocale,
          translations: LocaleString(localString: widget.localString),
          fallbackLocale: const Locale('en', 'US'),
          title: MyStrings.appName,
          initialRoute: MyRouteHelper.splashScreen,
          defaultTransition: Transition.topLevel,
          transitionDuration: const Duration(milliseconds: 500),
          getPages: MyRouteHelper.routes,
          navigatorKey: Get.key,
          theme: theme.darkTheme ? dark : light,
          debugShowCheckedModeBanner: false,
        );
      });
    });
  }
}