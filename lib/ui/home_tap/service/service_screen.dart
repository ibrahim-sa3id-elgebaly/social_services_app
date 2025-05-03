import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/model/article_model.dart';
import '../../../core/style/app_colors.dart';
import '../../../widget/service_item.dart';

class ServiceScreen extends StatelessWidget {
  static const String routeName = "serviceScreen";

  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryLightColor,
        title: const Text("Services"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: ListView.separated(
          itemBuilder:
              (context, index) => ServiceItem(
                articleModel: ArticleModel.categories[index],
                index: index,
                onPress: (category){
                },
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: ArticleModel.categories.length,
        ),
      ),
    );
  }
}
