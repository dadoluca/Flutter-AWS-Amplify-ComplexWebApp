import 'package:flutter/material.dart';
import '../variables/my_colors.dart';
import '../variables/device_info.dart';

class CancelButton extends StatelessWidget {
  CancelButton(this.action);

  Function action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
            width: 2, // the thickness
            color: myColors.primary // the color of the border
            ),
        minimumSize: Size(
            DeviceInfo.screenWidth! * 0.13, DeviceInfo.screenHeight! * 0.08),
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        action();
      },
      icon: Icon(
        Icons.cancel,
        color: myColors.primary,
      ),
      label: Text(
        'Cancel',
        style:
            TextStyle(fontSize: DeviceInfo.sizeText, color: myColors.primary),
      ),
    );
  }
}
