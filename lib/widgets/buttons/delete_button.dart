import 'package:flutter/material.dart';
import '../../variables/device_info.dart';
import '../../variables/my_colors.dart';
import 'package:flutter/material.dart';
import '../../variables/device_info.dart';
import '../../variables/my_colors.dart';

class DeleteButton extends StatelessWidget {
  DeleteButton(
      this.action,
      this.title,
      this.subtitle,
      this.successString, {
        this.color,
        Key? key,
        required this.parentContext, // Aggiunto parametro parentContext
      }) : super(key: key);

  final Function action;
  final String title;
  final String subtitle;
  final String successString;
  final Color? color;
  final BuildContext parentContext; // Aggiunto parametro parentContext

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text(title),
            content: Text(subtitle),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.of(ctx).pop();
                  int result = await action();
                  ScaffoldMessenger.of(parentContext).showSnackBar(
                    SnackBar(
                      content: Text(
                        result == 200
                            ? successString
                            : 'Eliminazione fallita!',
                        style: TextStyle(fontSize: DeviceInfo.sizeTitle2),
                      ),
                      backgroundColor: result == 200
                          ? myColors.success
                          : myColors.error,
                    ),
                  );
                },
                child: const Text('Yes'),
              ),
            ],
          ),
        );
      },
      icon: Icon(Icons.delete, color: color ?? myColors.error),
    );
  }
}
