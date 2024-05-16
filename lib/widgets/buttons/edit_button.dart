import 'package:flutter/material.dart';
import '../../variables/my_colors.dart';
class EditButton extends StatelessWidget {
  EditButton(this.action, {this.color, super.key });
  Function action;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:() => action(),
        icon: Icon(Icons.edit,color:color ?? myColors.primary, /*size: DeviceInfo.iconSize,*/));
  }
}
