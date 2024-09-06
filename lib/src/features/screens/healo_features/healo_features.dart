import 'package:flutter/material.dart';
import 'package:healo_app/src/common_widgets/appbar/appbar.dart';
import 'package:healo_app/src/features/screens/abha_features/abha_card_create/abha_card_create.dart';
import 'package:healo_app/src/features/screens/healo_features/widget/bulid_card_item.dart';
import '../../../common_widgets/bottom_navbar/custom_bottom_navbar.dart';
import '../../../constants/image_strjngs.dart';
import '../../../constants/sizes.dart';
import '../../../constants/text_strings.dart';

class HealoFeatures extends StatefulWidget {
  const HealoFeatures({super.key});

  @override
  State<HealoFeatures> createState() => _HealoFeaturesState();
}

class _HealoFeaturesState extends State<HealoFeatures> {
  int _selectedIndex = 0;
  bool _showMore = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleMoreItems() {
    setState(() {
      _showMore = !_showMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: tDashboardPadding,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ABHA",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "Explore all stuff related to ABHA...",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 10,
                children: [
                  BuildCardItem(
                    imagePath: tAbhaCard,
                    title: tOnAbhaCardTitle1,
                    subtitle: tOnAbhaCardSubTitle1,
                    tap: AbhaCardCreate(),
                  ),
                  BuildCardItem(
                    imagePath: tDownloadCardImage,
                    title: tOnAbhaCardTitle2,
                    subtitle: tOnAbhaCardSubTitle2,
                    tap: AbhaCardCreate(),
                  ),
                  BuildCardItem(
                    imagePath: tUpdateProfileImage,
                    title: tOnAbhaCardTitle3,
                    subtitle: tOnAbhaCardSubTitle3,
                    tap: AbhaCardCreate(),
                  ),
                  BuildCardItem(
                    imagePath: tHealthRecImage,
                    title: tOnAbhaCardTitle4,
                    subtitle: tOnAbhaCardSubTitle4,
                    tap: AbhaCardCreate(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: tDashboardPadding,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Healo Inventory",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "Explore all the Healo utilities...",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 10,
                children: [
                  BuildCardItem(
                    imagePath: tBmiImage,
                    title: tOnHealoInventoryTitle1,
                    subtitle: tOnHealoInventorySubTitle1,
                    tap: AbhaCardCreate(),
                  ),
                  BuildCardItem(
                    imagePath: tCalorieCounterImage,
                    title: tOnHealoInventoryTitle2,
                    subtitle: tOnHealoInventorySubTitle2,
                    tap: AbhaCardCreate(),
                  ),
                  BuildCardItem(
                    imagePath: tWaterTrackerImage,
                    title: tOnHealoInventoryTitle3,
                    subtitle: tOnHealoInventorySubTitle3,
                    tap: AbhaCardCreate(),
                  ),
                  BuildCardItem(
                    imagePath: tSleepTrackerImage,
                    title: tOnHealoInventoryTitle4,
                    subtitle: tOnHealoInventorySubTitle4,
                    tap: AbhaCardCreate(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: tDashboardPadding,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35,right: 35),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: _toggleMoreItems,
                  child: Text(_showMore ? 'Show Less' : 'More'),
                ),
              ),
            ),
            SizedBox(height: 20,),
            if (_showMore) ...[
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 10,
                  children: [
                    BuildCardItem(
                      imagePath: tWomenHealthImage,
                      title: tOnHealoInventoryTitle5,
                      subtitle: tOnHealoInventorySubTitle5,
                      tap: AbhaCardCreate(),
                    ),
                    BuildCardItem(
                      imagePath: tAllergyTrackerImage,
                      title: tOnHealoInventoryTitle6,
                      subtitle: tOnHealoInventorySubTitle6,
                      tap: AbhaCardCreate(),
                    ),
                    BuildCardItem(
                      imagePath: tPersonalisedRiskAssesmentImage,
                      title: tOnHealoInventoryTitle7,
                      subtitle: tOnHealoInventorySubTitle7,
                      tap: AbhaCardCreate(),
                    ),
                    BuildCardItem(
                      imagePath: tVaccineLogImage,
                      title: tOnHealoInventoryTitle8,
                      subtitle: tOnHealoInventorySubTitle8,
                      tap: AbhaCardCreate(),
                    ),
                  ],
                ),
              ),
            ],
            SizedBox(height: 20,)
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
