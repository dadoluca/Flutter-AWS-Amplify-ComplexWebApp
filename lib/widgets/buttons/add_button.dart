import 'package:flutter/material.dart';
import '../../../variables/my_colors.dart';
import '../../../variables/device_info.dart';

class AddButton extends StatelessWidget {
  AddButton(this.action);

  Function action;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => action(),
      elevation: 15,
      child: Icon(Icons.add, color: Colors.white,),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
