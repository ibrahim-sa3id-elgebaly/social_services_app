import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/custom_button.dart';
import '../authentications_screen/login/login_screen.dart';
import '../authentications_screen/register/register_screen.dart';

class FifthScreen extends StatefulWidget {
  static const String routeName = "fifth_screen";

  const FifthScreen({super.key});

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            SizedBox(height: 55.h),
            SizedBox(height: 30.h),
            SizedBox(
              width: 364.w,
              height: 400.h,
              child: Image.asset('assets/images/splash5.jpg'),
            ),
            SizedBox(height: 35.h),
            Text(
              ''' الخير بيبدأ بخطوة
    و إحنا سوا نقدر نغيّر كتير''',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            CustomButton(
                label: "Login",
                onClick: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                }),
            SizedBox(height: 20.h),
            CustomButton(
                label: "Create Account",
                onClick: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RegisterScreen.routeName,
                        (Route<dynamic> route) => false,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
