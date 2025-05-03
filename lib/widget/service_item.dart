import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/model/article_model.dart';

class ServiceItem extends StatelessWidget {

  final ArticleModel articleModel;
  final int index;
  final void Function(String category) onPress;

  ServiceItem({
    super.key,
    required this.articleModel,
    required this.index,
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/${articleModel.image}",
            width: double.infinity,
            height: 232.h,
            fit: BoxFit.cover,
          ),
          Text(articleModel.source),
          Text(articleModel.title),
          Align(alignment: Alignment.centerRight, child: Text(articleModel.time)),
        ],
      ),
    );
  }
}
