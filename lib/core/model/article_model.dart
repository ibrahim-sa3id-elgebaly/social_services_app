import 'package:flutter/material.dart';

class ArticleModel {
  String image;
  String title;
  String source;
  String time;


  ArticleModel({
    required this.image,
    required this.title,
    required this.source,
    required this.time,
  });

  static List<ArticleModel> categories = [
    ArticleModel(
        image: "blood2.png",
        source: "جمعيه رساله",
        title: "توزيع مساعدات فى قرى الصعيد",
          time: "9:am"),
    ArticleModel(
        image: "blood2.png",
        source: "جمعيه رساله",
        title: "توزيع مساعدات فى قرى الصعيد",
        time: "9:am"),
    ArticleModel(
        image: "blood2.png",
        source: "جمعيه رساله",
        title: "توزيع مساعدات فى قرى الصعيد",
        time: "9:am"),

  ];
}
