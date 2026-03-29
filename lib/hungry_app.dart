import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/routing/app_router.dart';
import 'package:hungry_app/core/routing/routes.dart';

class HungryApp extends StatelessWidget {
  const HungryApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: MaterialApp(
            theme: ThemeData(
              splashColor: Colors.transparent,
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.loginScreen,
            onGenerateRoute: appRouter.generateRoutes,
          ),
        );
      },
    );
  }
}
