import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/graphic_providers/projects_borders.dart';
import 'package:reply_project_management/screens/basic_screen.dart';
import 'package:reply_project_management/widgets/buttons/edit_button.dart';
import 'package:reply_project_management/widgets/forms/update_project_form.dart';
import '../providers/customers.dart';
import '../providers/projects.dart';
import '../screens/project_detail_screen.dart';
import '../models/Attivita.dart';
import '../variables/device_info.dart';
import '../variables/my_colors.dart';
import 'package:intl/intl.dart';

import 'buttons/delete_button.dart';

class ProjectItemList extends StatelessWidget {
  const ProjectItemList({Key? key, required this.project}) : super(key: key);
  final Attivita project;
  
  @override
  Widget build(BuildContext context) {
    DeviceInfo.init(context);
    BorderOptions borderType =
        Provider.of<ProjectsBorders>(context, listen: false).selectedBorder;
    final efficiency = (project.efficenza == null ||
            project.efficenza?.toDouble() == double.nan)
        ? ' - '
        : project.efficenza?.toDouble().toString();
    Color color = Provider.of<Customers>(context, listen: true)
        .getColor(project.clienteID?.id);

    DateTime? _date =project.target?.data?.getDateTime();
    String day='';
    String month='';
    String year='';
    if(_date!= null){
      day = DateFormat.d().format(_date!) ?? ''; // "13"
      month = DateFormat.MMM().format(_date!) ?? ''; // "FEB"
      year = DateFormat.y().format(_date!) ?? '';
    }



    return FutureBuilder(
        future: Provider.of<Customers>(context, listen: false)
            .fetchAndSetCustomers(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                InkWell(
                  borderRadius: borderType == BorderOptions.Colored
                      ? BorderRadius.circular(DeviceInfo.adattableWidth! * 0.05)
                      : BorderRadius.circular(
                          DeviceInfo.adattableWidth! * 0.02),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      ProjectDetailScreen.routeName,
                      arguments: project.id,
                    );
                  },
                  hoverColor: borderType == BorderOptions.Colored
                      ? color.withOpacity(0.8)
                  :myColors.primary.withOpacity(0.45),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: borderType == BorderOptions.Colored
                          ? BorderRadius.circular(
                              DeviceInfo.adattableWidth! * 0.05)
                          : BorderRadius.circular(
                              DeviceInfo.adattableWidth! * 0.02),
                    ),
                    clipBehavior: Clip.antiAlias,
                    elevation: borderType == BorderOptions.None ? 1.5 : 1,
                    borderOnForeground: true,
                    child: Container(
                      decoration: borderType == BorderOptions.None
                          ? BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  DeviceInfo.adattableWidth! * 0.02),
                            )
                          : borderType == BorderOptions.Colored
                              ? BoxDecoration(
                                  border: Border.symmetric(
                                      vertical: BorderSide(
                                    color: color,
                                    width: 12,
                                  )),
                                )
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      DeviceInfo.adattableWidth! * 0.02),
                                  border: Border.all(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      width: 1),
                                ),
                      padding: EdgeInsets.only(
                          top: DeviceInfo.adattableWidth! * 0.008,
                          left: DeviceInfo.adattableWidth! * 0.08,
                          right: DeviceInfo.adattableWidth! * 0.03),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 23,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      project.clienteID == null
                                          ? 'cliente eliminato'
                                          :'${project.clienteID?.nome ?? ''}',
                                      style: TextStyle(
                                          fontSize: DeviceInfo.sizeText,
                                          fontWeight: FontWeight.bold,
                                          color:project.clienteID == null
                                              ? myColors.error
                                              : myColors.primary),
                                      textAlign: TextAlign.start,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '  - ${project.titolo!}',
                                        style: TextStyle(
                                            fontSize: DeviceInfo.sizeTitle3,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.start,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 29,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Icon(Icons.circle_outlined,
                                                size: 20, color: color)),
                                      const Expanded(
                                        flex: 3,
                                        child: Center(),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '${project.stima}',
                                          style: TextStyle(
                                            fontSize: DeviceInfo.sizeText,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '${project.etc ?? '-'}',
                                          style: TextStyle(
                                            fontSize: DeviceInfo.sizeText,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Text(
                                          '${project.consuntivato ?? '-'}',
                                          style: TextStyle(
                                            fontSize: DeviceInfo.sizeText,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          (efficiency != null &&
                                                  efficiency.length > 7)
                                              ? '${efficiency.substring(0, 6)}%'
                                              : '$efficiency%',
                                          style: TextStyle(
                                              fontSize: DeviceInfo.sizeText,
                                              color: project.efficenza ==
                                                      null
                                                  ? Colors.black
                                                  : (project.efficenza
                                                                  ?.toDouble() ??
                                                              0) <
                                                          30
                                                      ? Colors.red
                                                      : Colors.black),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Text(
                                          project.referenteClienteID?.email ?? '-',
                                          style: TextStyle(
                                            fontSize: DeviceInfo.sizeText,
                                          ),
                                        ),
                                      ),
                                      DeviceInfo.screenWidth! > 900
                                          ? Expanded(
                                              flex: 5,
                                              child: Text(
                                                project.target?.data ==
                                                        null
                                                    ? ' - '
                                                    : '$month. $year',
                                                style: TextStyle(
                                                    fontSize:
                                                        DeviceInfo.sizeText),
                                              ),
                                            )
                                          : Center(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DeviceInfo.screenWidth! > 850
                              ? Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          EditButton(()=> Navigator.of(context).pushNamed(BasicScreen.routeName,
                                              arguments: {
                                                'title':"Modifica Progetto",
                                                'widget':UpdateProjectForm( project: project)}
                                          )),
                                          DeleteButton(
                                              () async =>await Provider.of<Projects>(context, listen:false).deleteAttivita(project),
                                              'Sei sicuro?',  'Vuoi eliminare il progetto ${project.titolo}?',
                                              '${project.titolo} eliminato correttamente!', parentContext: context,),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Center(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        });
  }
}
