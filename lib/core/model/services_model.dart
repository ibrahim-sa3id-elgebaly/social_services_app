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

  static List<ServicesModel> getCategories(BuildContext context) {
    return [
      ServicesModel(
        id: "blood/locations",
        title: AppLocalizations.of(context)!.blood_donation,
        image: "blood2.png",
        background: Theme.of(context).colorScheme.onPrimary,
      ),
      ServicesModel(
        id: "aid/locations",
        title: AppLocalizations.of(context)!.aid_distribution,
        image: "donation4.png",
        background: Theme.of(context).colorScheme.onPrimary,
      ),
      ServicesModel(
        id: "animal/locations",
        title: AppLocalizations.of(context)!.animal_care,
        image: "animal(3).png",
        background: Theme.of(context).colorScheme.onPrimary,
      ),
      ServicesModel(
        id: "orphan-support/locations",
        title: AppLocalizations.of(context)!.orphan_care,
        image: "orphan2.png",
        background: Theme.of(context).colorScheme.onPrimary,
      ),
      ServicesModel(
        id: "elderly-care/locations",
        title: AppLocalizations.of(context)!.elderly_care,
        image: "health5.png",
        background: Theme.of(context).colorScheme.onPrimary,
      ),
      ServicesModel(
        id: "literacy-programs/locations",
        title: AppLocalizations.of(context)!.literacy_programs,
        image: "education3.png",
        background: Theme.of(context).colorScheme.onPrimary,
      ),
      ServicesModel(
        id: "houseRenovation/locations",
        title: AppLocalizations.of(context)!.home_renovation,
        image: "house.png",
        background: Theme.of(context).colorScheme.onPrimary,
      ),
      ServicesModel(
        id: "seasonalServices/locations",
        title: AppLocalizations.of(context)!.seasonal_aid,
        image: "donation4.png",
        background: Theme.of(context).colorScheme.onPrimary,
      ),

    ];
  }
}
