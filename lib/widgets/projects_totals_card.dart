import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../variables/device_info.dart';
import '../graphic_providers/projects_borders.dart';
import '../providers/projects.dart';
import '../variables/my_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProjectsTotalsCard extends StatelessWidget {
  const ProjectsTotalsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderOptions borderType =
        Provider.of<ProjectsBorders>(context, listen: false).selectedBorder;
    final total_efficienza =
        Provider.of<Projects>(context, listen: false).total_efficienza;
    return Container(
        width: double.infinity,
        /*padding: EdgeInsets.only(
          right: DeviceInfo.adattableWidth! * 0.02,
        ),*/
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: borderType == BorderOptions.Colored
                ? BorderRadius.circular(DeviceInfo.adattableWidth! * 0.05)
                : BorderRadius.circular(DeviceInfo.adattableWidth! * 0.02),
          ),
          clipBehavior: Clip.antiAlias,
          elevation: 2,
          child: Column(
            children: [
              Container(
                decoration: borderType == BorderOptions.None
                    ? BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      DeviceInfo.adattableWidth! * 0.00),
                  color: Theme.of(context).colorScheme.primary,

                )
                    : borderType == BorderOptions.Colored
                    ? BoxDecoration(
                  border: Border.symmetric(
                      vertical: BorderSide(
                        color: myColors.primary,
                        width: 12,
                      )),
                  color: Theme.of(context).colorScheme.primary,

                )
                    : BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      DeviceInfo.adattableWidth! * 0.00),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1),
                  color: Theme.of(context).colorScheme.primary,

                ),/*
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(DeviceInfo.screenWidth! * 0.05),
                  border: Border.symmetric(
                      vertical: BorderSide(
                    color: myColors.primary,
                    width: 12,
                  )),
                  color: Theme.of(context).colorScheme.primary,
                ),*/
                padding: EdgeInsets.only(
                  top: DeviceInfo.adattableWidth! * 0.01,
                  left: DeviceInfo.adattableWidth! * 0.08,
                  right: DeviceInfo.adattableWidth! * 0.01,
                  bottom: DeviceInfo.adattableWidth! * 0.01,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 23,
                      child: Column(
                        children: [
                          SizedBox(
                            height: DeviceInfo.screenHeight! * 0.01,
                          ),
                          SizedBox(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DeviceInfo.screenWidth! > 900
                                      ? Expanded(
                                          flex: 6,
                                          child: Center(),
                                        )
                                      : const Center(),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'STIMA',
                                      style: TextStyle(
                                        fontSize: DeviceInfo.sizeText,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'LAV.',
                                      style: TextStyle(
                                        fontSize: DeviceInfo.sizeText,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      'ETC',
                                      style: TextStyle(
                                        fontSize: DeviceInfo.sizeText,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        Text(
                                          'EFF',
                                          style: TextStyle(
                                            fontSize: DeviceInfo.sizeText,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                            width: DeviceInfo.adattableWidth! *
                                                0.015),
                                        Icon(
                                          Icons.bar_chart,
                                          color: Colors.white,
                                          size:
                                              DeviceInfo.adattableWidth! * 0.05,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 7,
                                    child: Row(
                                      children: [
                                        Text(
                                          'REFERENTE',
                                          style: TextStyle(
                                            fontSize: DeviceInfo.sizeText,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                            width: DeviceInfo.adattableWidth! *
                                                0.015),
                                        Icon(
                                          FontAwesomeIcons.userTie,
                                          size:
                                              DeviceInfo.adattableWidth! * 0.04,
                                          color: Colors.white,
                                          //color: color//Theme.of(context).colorScheme.primary
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Row(
                                      children: [
                                        Text(
                                          'RELEASE',
                                          style: TextStyle(
                                            fontSize: DeviceInfo.sizeText,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                            width: DeviceInfo.adattableWidth! *
                                                0.015),
                                        Icon(
                                          Icons.calendar_month,
                                          size:
                                              DeviceInfo.adattableWidth! * 0.05,
                                          color: Colors.white,
                                          //color: color//Theme.of(context).colorScheme.primary
                                        ),
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                    DeviceInfo.screenWidth! > 850
                        ? Expanded(flex: 3, child: SizedBox())
                        : Center(),
                  ],
                ),
              ),

              ///---------------------------------- PARTE SOTTO DELLA CARD
              Container(
                decoration: borderType == BorderOptions.None
                    ? BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      DeviceInfo.adattableWidth! * 0.00),
                  color: Colors.white,

                )
                    : borderType == BorderOptions.Colored
                    ? BoxDecoration(
                  border: Border.symmetric(
                      vertical: BorderSide(
                        color: Colors.white,
                        width: 12,
                      )),
                  color: Colors.white,

                )
                    : BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      DeviceInfo.adattableWidth! * 0.00),
                  border: Border.all(
                      color: Colors.white,
                      width: 1),
                  color: Colors.white,

                ),
                /*
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(DeviceInfo.screenWidth! * 0.05),
                  border: Border.symmetric(
                      vertical: BorderSide(
                    color: Colors.white,
                    width: 12,
                  )),
                  color: Colors.white,
                ),*/
                padding: EdgeInsets.only(
                  top: DeviceInfo.adattableWidth! * 0.01,
                  left: DeviceInfo.adattableWidth! * 0.08,
                  right: DeviceInfo.adattableWidth! * 0.01,
                  bottom: DeviceInfo.adattableWidth! * 0.01,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 23,
                      child: Column(
                        children: [
                          SizedBox(
                            height: DeviceInfo.screenHeight! * 0.01,
                          ),
                          SizedBox(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DeviceInfo.screenWidth! > 900
                                      ? Expanded(
                                          flex: 6,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'TOTALI',
                                                style: TextStyle(
                                                  fontSize:
                                                      DeviceInfo.sizeTitle2,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const Center(),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      '${Provider.of<Projects>(context, listen: false).total_stima}',
                                      style: TextStyle(
                                          fontSize: DeviceInfo.sizeTitle3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      '${Provider.of<Projects>(context, listen: false).total_consuntivato}',
                                      style: TextStyle(
                                          fontSize: DeviceInfo.sizeTitle3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Text(
                                      '${Provider.of<Projects>(context, listen: false).total_etc}',
                                      style: TextStyle(
                                          fontSize: DeviceInfo.sizeTitle3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      total_efficienza == null ||
                                              total_efficienza == 0
                                          ? ' - '
                                          : (total_efficienza
                                                      .toString()
                                                      .length >
                                                  5)
                                              ? '${total_efficienza.toString().substring(0, 5)}%'
                                              : '${total_efficienza.toString()}%',
                                      style: TextStyle(
                                          fontSize: DeviceInfo.sizeTitle3,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Expanded(flex: 12, child: Center())
                                ]),
                          ),
                        ],
                      ),
                    ),
                    DeviceInfo.screenWidth! > 850
                        ? Expanded(flex: 3, child: SizedBox())
                        : Center(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
