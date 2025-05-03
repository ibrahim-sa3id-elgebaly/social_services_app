import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/custom_button.dart';
import '../../widget/skip_button.dart';
import '../authentications_screen/login/login_screen.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  static const String routeName = "first_screen";

  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            SizedBox(height: 55.h),
            SkipButton(onPressed: Skip, text: "Skip"),
            SizedBox(height: 30.h),
            SizedBox(
              width: 364.w,
              height: 400.h,
              child: Image.asset('assets/images/splash4.jpg'),
            ),
            SizedBox(height: 35.h),
            Text(
              ''' الخير مش يوم ولا شهر
        الخير كل يوم''',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 35.h),
            CustomButton(label: "Next", onClick: next),
          ],
        ),
      ),
    );
  }

  next() {
    Navigator.pushNamed(context, SecondScreen.routeName);
  }

  Skip() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }
}
