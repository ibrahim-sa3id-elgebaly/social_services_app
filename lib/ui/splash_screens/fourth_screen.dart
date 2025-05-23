import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widget/custom_button.dart';
import '../../widget/skip_button.dart';
import '../authentications_screen/login/login_screen.dart';
import 'fifth_screen.dart';

class FourthScreen extends StatefulWidget {
  static const String routeName = "fourth_screen";
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            SizedBox(height: 55.h),
            SkipButton(onPressed: skip,text: "Skip"),
            SizedBox(height: 30.h),
            SizedBox(
              width: 364.w,
              height: 400.h,
              child: Image.asset('assets/images/splash6 (2).jpg'),
            ),
            SizedBox(height: 35.h),
            Text('''              اللي بيحب الخير           
           عمره ما يكون وحده''', style: Theme.of(context).textTheme.headlineMedium),
            SizedBox(height: 35.h),
            CustomButton(label: "Next", onClick: next),
          ],
        ),
      ),
    );
  }
  next(){
    Navigator.pushNamed(context, FifthScreen.routeName);
  }
  skip(){
    Navigator.pushNamed(context, LoginScreen.routeName);
  }
}
