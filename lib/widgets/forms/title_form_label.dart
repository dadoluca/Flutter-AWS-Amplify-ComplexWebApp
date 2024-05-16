import 'package:flutter/material.dart';
import '../../variables/my_colors.dart';
import '../../variables/device_info.dart';

class TitleFormLabel extends StatelessWidget {
  const TitleFormLabel(this.text, {super.key});
final String text;

  @override
  Widget build(BuildContext context) {
    return  Text(
      this.text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: DeviceInfo.sizeTitle2,
          color: myColors.primary
      ),
    );
  }
}
