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
      EventModel(
        id: "animal-welfare/events",
        title: AppLocalizations.of(context)!.animal_care,
      ),
      EventModel(
        id: "orphan-support/events",
        title: AppLocalizations.of(context)!.orphan_care,
      ),
      EventModel(
        id: "elderly-care/events",
        title: AppLocalizations.of(context)!.elderly_care,
      ),
      EventModel(
        id: "literacy-programs/events",
        title: AppLocalizations.of(context)!.literacy_programs,
      ),
      EventModel(
        id: "road/events",
        title: AppLocalizations.of(context)!.roadside_assistance,
      ),
    ];
  }
}
