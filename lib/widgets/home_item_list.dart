import 'package:flutter/material.dart';
import 'package:reply_project_management/variables/my_colors.dart';

class HomeItemList extends StatefulWidget {
   HomeItemList(this.title,this.navigate, {super.key});
  Function navigate;
  String title;
  @override
  State<HomeItemList> createState() => _HomeItemListState();
}

class _HomeItemListState extends State<HomeItemList> {
  Color backgroundColor = Colors.white;
  Color textColor = myColors.primary;
  double textSize = 16;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.navigate();
      },
      onHover: (isHovering) {
        setState(() {
          if (isHovering) {
            backgroundColor = Theme.of(context).colorScheme.primary;
            textColor = Colors.white;
            textSize = 19.5;
          } else {
            backgroundColor = Colors.white;
            textColor = Theme.of(context).colorScheme.primary;
            textSize = 16;
          }
        });
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Material (
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5) ),
          elevation: (textSize-15.6)*4,
          shadowColor: Colors.indigo,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: backgroundColor, width: textSize-15),
            ),
            child: ListTile(
              title: Text(widget.title, style: TextStyle(color: textColor,
              fontSize: textSize,
              letterSpacing: 1,
              )),
            ),
          ),
        ),
      ),
    );
  }
}
