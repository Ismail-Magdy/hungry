import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry_app/core/themes/app_colors.dart';
import 'package:hungry_app/features/login/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    startAnimation();
    navigateToNextScreen();
  }

  //  Start animation after small delay
  void startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() => _animate = true);
  }

  //  Navigate to login after 3 seconds
  void navigateToNextScreen() {
    Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 230.h),

            // Hungry Text Animation
            AnimatedSlide(
              offset: _animate ? Offset(0, 0) : const Offset(0, -0.3),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutBack,
              child: AnimatedOpacity(
                opacity: _animate ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  "Hungry?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55.sp,
                    fontFamily: "LuckiestGuy",
                  ),
                ),
              ),
            ),
            //
            const Spacer(),
            // Image Animation
            AnimatedScale(
              scale: _animate ? 1 : 0.8,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeOutBack,
              child: AnimatedOpacity(
                opacity: _animate ? 1 : 0,
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  "assets/images/splash.png",
                  width: 350.w,
                  height: 210.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
