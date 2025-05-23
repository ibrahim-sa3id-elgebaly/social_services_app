import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/custom_button.dart';
import '../../widget/skip_button.dart';
import '../authentications_screen/login/login_screen.dart';
import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  static const String routeName = "second_screen";

  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            SizedBox(height: 55.h),
            SkipButton(onPressed: skip, text: "Skip"),
            SizedBox(height: 30.h),
            SizedBox(
              width: 364.w,
              height: 400.h,
              child: Image.asset('assets/images/splash6.jpg'),
            ),
            SizedBox(height: 35.h),
            Text(''' كل واحد فينا يقدر يسيب اثر
            حتى لو بسيط''', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 35.h),
            CustomButton(label: "Next", onClick: next),
          ],
        ),
      ),
    );
  }

  next() {
    Navigator.pushNamed(context, ThirdScreen.routeName);
  }

  skip() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }
}
