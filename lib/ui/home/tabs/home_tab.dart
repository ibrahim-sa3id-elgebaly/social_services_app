import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/model/services_model.dart';
import '../../../widget/services_item.dart';
import '../../home_tap/service/service_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeTab extends StatelessWidget {
//  final void Function(String category) onPress;
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {

    final categories = ServicesModel.getCategories(context);

    return Padding(
      padding: REdgeInsets.symmetric(vertical: 10, horizontal: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.volunteer_for_good,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 25.w,
              ),
              itemBuilder: (context, index) => ServicesItem(
                onPress: (category) {
                  Navigator.pushNamed(
                    context,
                    ServiceScreen.routeName,
                    arguments: categories[index],
                  );
                },
                servicesModel: categories[index],
                index: index,
              ),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
