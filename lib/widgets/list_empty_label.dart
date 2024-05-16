import 'package:flutter/material.dart';
import '../../variables/my_colors.dart';
import '../../variables/device_info.dart';

class ListEmptyLabel extends StatelessWidget {
  const ListEmptyLabel(this.text, {super.key});
final String text;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        this.text,
        style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: DeviceInfo.sizeTitle1,
            color: Colors.black
        ),
      ),
    );
  }
}
