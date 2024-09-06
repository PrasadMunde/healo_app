import 'package:flutter/material.dart';
import 'package:healo_app/src/features/screens/healo_features/healo_features.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strjngs.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';

class banner extends StatelessWidget {
  const banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: tCardBgColor,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                Image(
                  image: AssetImage(tDawonlodCard),
                  height: 125,
                ),
                Text(
                  tOnBoardingCardTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  tOnBoardingCardSubTitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: tDashboardCardPadding,
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: tCardBgColor),
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage(tAbhaCard),
                      height: 120,
                    ),
                    Text(
                      tOnBoardingCardTitle,
                      style: Theme.of(context).textTheme.headlineSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      tOnBoardingCardSubTitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>HealoFeatures())
                    );
                  },
                  child: const Text('View All'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
