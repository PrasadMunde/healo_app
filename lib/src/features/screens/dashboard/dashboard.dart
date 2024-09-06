import 'package:healo_app/src/constants/sizes.dart';
import 'package:healo_app/src/common_widgets/appbar/appbar.dart';
import 'package:healo_app/src/features/screens/dashboard/widget/banner_card.dart';
import 'package:healo_app/src/features/screens/dashboard/widget/category_card.dart';
import 'package:healo_app/src/features/screens/dashboard/widget/search.dart';
import 'package:healo_app/src/features/screens/dashboard/widget/slider.dart';
import 'package:healo_app/src/features/screens/dashboard/widget/top_sources_card.dart';
import 'package:flutter/material.dart';
import '../../../common_widgets/bottom_navbar/custom_bottom_navbar.dart';
import '../../../constants/colors.dart';
import '../../../constants/image_strjngs.dart';
import '../../../constants/text_strings.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> imgList = [
    'assets/dashboard_screen/slider_images/banner1.png',
    'assets/dashboard_screen/slider_images/banner2.png',
    'assets/dashboard_screen/slider_images/banner1.png',
    'assets/dashboard_screen/slider_images/banner2.png',
    'assets/dashboard_screen/slider_images/banner1.png',
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashboardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tOnBoardingTitle1,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                tOnBoardingTitle2,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: tDashboardPadding),

              // Search Box...
              search(),
              const SizedBox(height: tDashboardPadding),

              // Slider Image
              Center(
                child: slider(imgList: imgList),
              ),
              const SizedBox(height: tDashboardPadding),

              // Categories
              SizedBox(
                height: 45,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    CategoryCard(
                      title: "Abha Card",
                      subtitle: "Create abha card",
                      image: const AssetImage(tCtCard),
                    ),
                    CategoryCard(
                      title: "Abha Card",
                      subtitle: "Create abha card",
                      image: const AssetImage(tCtDoc),
                    ),
                    CategoryCard(
                      title: "Abha Card",
                      subtitle: "Create abha card",
                      image: const AssetImage(tCtDawonlod),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: tDashboardPadding),

              // Banners
              banner(),

              //Top Sources...
              const SizedBox(height: tDashboardPadding),
              Text(
                tOnBoardingSubTitle2,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.apply(fontSizeFactor: 1.2),
              ),
              topSources(),
              const SizedBox(height: tDashboardPadding),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
