import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventModel {
  final String id;
  final String title;

  EventModel({
    required this.id,
    required this.title,
  });

  static List<EventModel> getCategories(BuildContext context) {
    return [
      EventModel(
        id: "blood/events",
        title: AppLocalizations.of(context)!.blood_donation,
      ),
      EventModel(
        id: "house-renovation/events",
        title: AppLocalizations.of(context)!.home_renovation,
      ),
      EventModel(
        id: "aid/events",
        title: AppLocalizations.of(context)!.aid_distribution,
      ),
    ];
  }
}

