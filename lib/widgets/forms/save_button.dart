import 'package:flutter/material.dart';
import '../../variables/my_colors.dart';
import '../../variables/device_info.dart';

class SaveButton extends StatelessWidget {
  SaveButton(this.action);

  Function action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
            DeviceInfo.screenWidth! * 0.13, DeviceInfo.screenHeight! * 0.08),
      ),
      onPressed: () {
        action();
      },
        icon: const Icon(Icons.save),
        label: Text('Save ', style: TextStyle(fontSize: DeviceInfo.sizeText,))
    );
  }
}
