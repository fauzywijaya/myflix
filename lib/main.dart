import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myflix/src/routes/app_routes.dart';
import 'package:myflix/src/services/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myflix/src/constants/constants.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  await hiveInit();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.read(goRouterProvider);
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return OverlaySupport.global(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerDelegate: router.routerDelegate,
              routeInformationParser: router.routeInformationParser,
              routeInformationProvider: router.routeInformationProvider,
              title: 'MyFlix',
              theme: ThemeApp.darkTheme,
            ),
          );
        },
      ),
    );
  }
}
