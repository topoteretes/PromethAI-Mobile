import 'package:flutter/material.dart';
import 'package:prometh_ai/screens/start_screen/coming_soon.dart';
import 'package:prometh_ai/widget/texts/normal_title.dart';

class RestaurantsContent extends StatelessWidget {
  const RestaurantsContent({super.key});

  @override
  Widget build(BuildContext context) => const Column(
        children: [
          Flexible(
            child: SizedBox(
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
                child: Image(image: AssetImage('assets/images/onboarding_2.png'), fit: BoxFit.cover),
              ),
            ),
          ),
          Flexible(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                ComingSoon(),
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: NormalTitle("Restaurants"),
                ),
              ],
            ),
          ),
        ],
      );
}
