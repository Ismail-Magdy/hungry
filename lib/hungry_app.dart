import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/splashs/splash_screen.dart';

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

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
            home: SplashScreen(),
          ),
        );
      },
    );
  }
}
