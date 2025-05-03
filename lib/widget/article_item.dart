/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({super.key,required this.article});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: article.urlToImage??"",
          width: double.infinity,
          height: 232.h,
          fit: BoxFit.cover,
          placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: 40.sp,
          ),
        ),
        Text(article.source?.name??""),
        Text(article.title??""),
        Align(
            alignment: Alignment.centerRight,
            child: Text(timeago.format(DateTime.parse(article.publishedAt??"")))),
      ],
    );
  }
}
*/
