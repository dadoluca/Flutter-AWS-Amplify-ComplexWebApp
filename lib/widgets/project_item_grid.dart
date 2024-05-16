import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/customers.dart';
import '../screens/project_detail_screen.dart';
import '../models/Attivita.dart';
import '../variables/device_info.dart';

class ProjectItemGrid extends StatelessWidget {
  const ProjectItemGrid({Key? key, required this.project}) : super(key: key);
  final Attivita project;

  @override
  Widget build(BuildContext context) {
    DeviceInfo.init(context);
    final efficiency = (project.efficenza?.toDouble() ?? ' - ').toString();
    Color color = Provider.of<Customers>(context, listen:false).getColor(project.clienteID!.id);

    return FutureBuilder(
        future: Provider.of<Customers>(context, listen: false)
        .fetchAndSetCustomers(),
    builder: (ctx, dataSnapshot) {
         return InkWell(
        onTap:() { Navigator.of(context).pushNamed(
          ProjectDetailScreen.routeName,
          arguments: project.id,
        );},
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DeviceInfo.adattableWidth! * 0.05)),
          clipBehavior: Clip.antiAlias,
          elevation: 1,
          child: Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(DeviceInfo.screenWidth! * 0.05),
                border: Border.symmetric(horizontal: BorderSide(
                  color: Provider.of<Customers>(context, listen:false).getColor(project.clienteID!.id),
                  width: 5,
                ))),/*Border.all(
              color: Provider.of<Customers>(context, listen:true).getColor(project.clienteID!.id),
              width: 2,
            ),*/
            padding: EdgeInsets.only(top: DeviceInfo.adattableWidth! * 0.02),
            child: Column(
              children: [
                 ListTile(
                    title: Container(
                      height: DeviceInfo.screenWidth!>1000?60:40,
                      child: Text(
                        project.titolo!,
                        style: TextStyle(fontSize: DeviceInfo.sizeText,
                        overflow: TextOverflow.fade),
                      ),
                    ),

                ),
                Divider(thickness: 1, color: Colors.grey.withOpacity(0.2),indent: DeviceInfo.adattableWidth! * 0.04,
                endIndent:  DeviceInfo.adattableWidth! * 0.04,),
                Padding(
                    padding: EdgeInsets.only(left: DeviceInfo.adattableWidth! * 0.06),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: DeviceInfo.adattableWidth! * 0.015),
                            Icon(Icons.circle, size: DeviceInfo.iconSize!-12, color:color),
                            SizedBox(width: DeviceInfo.adattableWidth! * 0.050),
                            Text(
                              'Stima: ${project.stima}',
                              style: TextStyle(fontSize: DeviceInfo.sizeText),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: DeviceInfo.adattableWidth! * 0.015),
                            Icon(Icons.radio_button_on, size: DeviceInfo.iconSize!-12, color:color),
                            SizedBox(width: DeviceInfo.adattableWidth! * 0.050),
                            Text(
                              'ETC: ${project.etc}',
                              style: TextStyle(fontSize: DeviceInfo.sizeText),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: DeviceInfo.adattableWidth! * 0.015),
                            Icon(Icons.square, size: DeviceInfo.iconSize!-12, color:color),
                            SizedBox(width: DeviceInfo.adattableWidth! * 0.050),
                            Text(
                              'Consuntivato: ${project.consuntivato}',
                              style: TextStyle(fontSize: DeviceInfo.sizeText),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.bar_chart,
                              color: project.efficenza == null
                                  ? Colors.black
                                  : (project.efficenza?.toDouble() ?? 0) < 0.3
                                  ? Colors.red
                                  : (project.efficenza?.toDouble() ?? 0) < 0.7
                                  ? Colors.yellow
                                  : (project.efficenza?.toDouble() ?? 0) < 1
                                  ? Colors.greenAccent
                                  : Colors.green,
                              size: DeviceInfo.iconSize,
                            ),
                            SizedBox(width: DeviceInfo.adattableWidth! * 0.03),
                            Text(project.efficenza == null
                                ? ' - '
                                : (efficiency.length > 7)
                                ? '${efficiency.substring(0, 6)}%'
                                : '$efficiency%', style: TextStyle(fontSize: DeviceInfo.sizeText),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              size: DeviceInfo.iconSize!,
                            ),
                            SizedBox(width: DeviceInfo.adattableWidth! * 0.03),
                            Text(
                              project.target?.data == null ? ' Non stabilito ' : '${project.target?.data}',
                              style: TextStyle(fontSize: DeviceInfo.sizeText),
                            ),
                          ],
                        ),
                      ],
                    )),
                //Image.asset('images/1.jpg'),
              ],
            ),
          ),
        ),
      );}
    );
  }
}
