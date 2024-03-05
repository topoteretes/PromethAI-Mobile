import 'package:flutter/material.dart';
import 'package:prometh_ai/widget/texts/normal_title.dart';

import 'coming_soon.dart';

class DeliveryContent extends StatelessWidget {
  const DeliveryContent({super.key});

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
                child: Image(image: AssetImage('assets/images/onboarding_3.png'), fit: BoxFit.cover),
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
                  child: NormalTitle("Delivery"),
                ),
              ],
            ),
          ),
        ],
      );
}
