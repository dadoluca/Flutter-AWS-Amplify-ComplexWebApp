import 'package:flutter/material.dart';
import '../../../variables/my_colors.dart';
import '../../../variables/device_info.dart';
import '../../screens/home_page.dart';

class BluePlanButtonLogo extends StatelessWidget {
  const BluePlanButtonLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          decoration: BoxDecoration(
              border: Border.symmetric(
                  vertical: BorderSide(
                      width: 2,
                      color: Colors.white.withOpacity(0.2)))),
          child: //Image.asset('../assets/images/logo.png')),
          Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              const Icon(
                Icons.rocket,
                size: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'BLUE PLAN',
                style: TextStyle(
                    fontSize: DeviceInfo.sizeTitle2,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
      onTap: () {
        Navigator.of(context).pushNamed(
          HomePage.routeName,
        );
      },
    );
  }
}
