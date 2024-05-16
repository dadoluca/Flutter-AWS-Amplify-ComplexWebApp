import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/graphic_providers/show_grid.dart';

import '../variables/device_info.dart';
class ProjectsGraphicCard extends StatefulWidget {
  const ProjectsGraphicCard({Key? key}) : super(key: key);

  @override
  State<ProjectsGraphicCard> createState() => _ProjectsGraphicCardState();
}

class _ProjectsGraphicCardState extends State<ProjectsGraphicCard> {
  final List<bool> _selectedDisposition = <bool>[true, false];
  @override
  Widget build(BuildContext context) {
    DeviceInfo.init(context);
    return  Container(
      padding: EdgeInsets.only(top: DeviceInfo.adattableWidth!*0.02,
        right: DeviceInfo.adattableWidth!*0.02,
        left: DeviceInfo.adattableWidth!*0.01,
      ),
      height: DeviceInfo.screenHeight!*0.22,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(DeviceInfo.adattableWidth! * 0.02),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: DeviceInfo.adattableWidth!*0.02),
                child: Text('VISUALIZZA',style: TextStyle(fontSize: DeviceInfo.sizeTitle3, fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.only( left: DeviceInfo.adattableWidth!*0.01,
                right: DeviceInfo.adattableWidth!*0.01,
                  top: DeviceInfo.adattableWidth!*0.02,

                  bottom: DeviceInfo.adattableWidth!*0.07,
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: DeviceInfo.screenHeight!*0.015),
                    ToggleButtons(
                      direction: DeviceInfo.screenWidth! < 600 ? Axis.vertical : Axis.horizontal,
                      onPressed: (int index) {
                        setState(() {
                          // The button that is tapped is set to true, and the others to false.
                          for (int i = 0; i < 2; i++) {
                            _selectedDisposition[i] = i == index;
                          }
                          print(_selectedDisposition);
                          if(_selectedDisposition[1] != Provider.of<ShowGrid>(context, listen: false).isGrid) {
                            Provider.of<ShowGrid>(context, listen: false).toggleDispositionStatus();
                          }
                        });
                      },
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      selectedBorderColor: Colors.blue,
                      selectedColor: Colors.white,
                      fillColor: Theme.of(context).colorScheme.primary,
                      color:Colors.blueGrey[200] ,
                      constraints:  BoxConstraints(
                        minHeight: DeviceInfo.adattableWidth!*0.06,
                        minWidth: DeviceInfo.adattableWidth!*0.09,
                      ),
                      isSelected: _selectedDisposition,
                      children: dispositions,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> dispositions = <Widget>[
  Icon(Icons.list, size: DeviceInfo.screenWidth! > 800 ? 20 : 10),
  Icon(Icons.grid_on, size: DeviceInfo.screenWidth! > 800 ? 20 : 10),
];