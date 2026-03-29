import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:hungry_app/core/di/dependency_injection.dart";
import "package:hungry_app/core/routing/app_router.dart";
import "package:hungry_app/hungry_app.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //
  await ScreenUtil.ensureScreenSize();
  //
  await initGetIt();
  //
  runApp(HungryApp(appRouter: AppRouter()));
}
