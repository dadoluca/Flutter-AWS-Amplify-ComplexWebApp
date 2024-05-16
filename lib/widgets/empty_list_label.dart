import 'package:flutter/material.dart';
import '../../variables/my_colors.dart';
import '../../variables/device_info.dart';

class EmptyListLabel extends StatelessWidget {
  const EmptyListLabel(this.text, {super.key});
final String text;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:  Container(
          decoration: BoxDecoration(
              color: myColors.warning,
            border: Border.all(color: Colors.white,width: 1)
          ),
          padding: const EdgeInsets.all(20.0),
          child: Text(
            this.text,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: DeviceInfo.sizeText,
                color: Colors.grey
            ),
          ),
        ),
    );
  }
}
