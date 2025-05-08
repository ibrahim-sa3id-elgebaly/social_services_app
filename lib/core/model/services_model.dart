import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServicesModel {
  final String id;
  final String title;
  final String image;
  final Color background;

  ServicesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.background,
  });

  // طريقة للحصول على القائمة مع تمرير الـ context
  static List<ServicesModel> getCategories(BuildContext context) {
    return [
      ServicesModel(
        id: "blood/locations",
        title: AppLocalizations.of(context)!.blood_donation,
        image: "blood2.png",
        background: const Color(0xffCF7E48),
      ),
      ServicesModel(
        id: "blood/locations",
        title: AppLocalizations.of(context)!.roadside_assistance,
        image: "retouch_2025041205562848.png",
        background: const Color(0xffCF7E48),
      ),
      ServicesModel(
        id: "aid/locations",
        title: AppLocalizations.of(context)!.aid_distribution,
        image: "donation4.png",
        background: const Color(0xffCF7E48),
      ),
      ServicesModel(
        id: "blood/locations",
        title: AppLocalizations.of(context)!.home_renovation,
        image: "house.png",
        background: const Color(0xffCF7E48),
      ),
      ServicesModel(
        id: "blood/locations",
        title: AppLocalizations.of(context)!.disaster_relief,
        image: "environment.png",
        background: const Color(0xffCF7E48),
      ),
      ServicesModel(
        id: "blood/locations",
        title: AppLocalizations.of(context)!.education_and_training,
        image: "education3.png",
        background: const Color(0xffCF7E48),
      ),
      ServicesModel(
        id: "blood/locations",
        title: AppLocalizations.of(context)!.health_and_awareness,
        image: "health5.png",
        background: const Color(0xffCF7E48),
      ),
      ServicesModel(
        id: "blood/locations",
        title: AppLocalizations.of(context)!.orphan_care,
        image: "orphan2.png",
        background: const Color(0xffCF7E48),
      ),
      ServicesModel(
        id: "blood/locations",
        title: AppLocalizations.of(context)!.seasonal_aid,
        image: "science.png",
        background: const Color(0xffCF7E48),
      ),
    ];
  }
}


/*
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServicesModel {
  String id;
  String title;
  String image;
  Color background;

  ServicesModel({
    required this.id,
    required this.title,
    required this.image,
    required this.background,
  });

  static List<ServicesModel> categories = [
    ServicesModel(
        id: "1",
        title: AppLocalizations.of(context as BuildContext)!.blood_donation,
        image: "blood2.png",
        background: Color(0xffCF7E48)),
    ServicesModel(
        id: "2",
        title: AppLocalizations.of(context as BuildContext)!.roadside_assistance,
        image: "retouch_2025041205562848.png",
        background: Color(0xffCF7E48)),
    ServicesModel(
        id: "3",
        title: AppLocalizations.of(context as BuildContext)!.aid_distribution,
        image: "donation4.png",
        background: Color(0xffCF7E48)),
    ServicesModel(
        id: "4",
        title: AppLocalizations.of(context as BuildContext)!.home_renovation,
        image: "house.png",
        background: Color(0xffCF7E48)),
    ServicesModel(
        id: "5",
        title: AppLocalizations.of(context as BuildContext)!.disaster_relief,
        image: "environment.png",
        background: Color(0xffCF7E48)),
    ServicesModel(
        id: "6",
        title: AppLocalizations.of(context as BuildContext)!.education_and_training,
        image: "education3.png",
        background: Color(0xffCF7E48)),
    ServicesModel(
        id: "7",
        title: AppLocalizations.of(context as BuildContext)!.health_and_awareness,
        image: "health5.png",
        background: Color(0xffCF7E48)),
    ServicesModel(
        id: "8",
        title: AppLocalizations.of(context as BuildContext)!.orphan_care,
        image: "orphan2.png",
        background: Color(0xffCF7E48)),
    ServicesModel(
        id: "9",
        title: AppLocalizations.of(context as BuildContext)!.seasonal_aid,
        image: "science.png",
        background: Color(0xffCF7E48))
  ];
}
*/
