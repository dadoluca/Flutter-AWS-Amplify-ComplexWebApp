import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/models/ModelProvider.dart';
import 'package:reply_project_management/providers/colleagues.dart';
import 'package:reply_project_management/providers/customers_referents.dart';
import 'package:reply_project_management/variables/my_colors.dart';

import '../variables/device_info.dart';
import '../models/Cliente.dart';
import '../models/Collega.dart';
import '../models/Release.dart';
import '../providers/customers.dart';
import '../providers/projects.dart';
import '../providers/releases.dart';


class ProjectsFiltersCard extends StatefulWidget {
  const ProjectsFiltersCard({Key? key}) : super(key: key);

  @override
  State<ProjectsFiltersCard> createState() => _ProjectsFiltersCardState();
}

class _ProjectsFiltersCardState extends State<ProjectsFiltersCard> {
  Future<void> _refreshProjects() async {
    await Provider.of<Projects>(context, listen: false).fetchAndSetProjects();
  }

  @override
  Widget build(BuildContext context) {
    DeviceInfo.init(context);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(DeviceInfo.adattableWidth! * 0.02),
          side: BorderSide(color: myColors.primary, width: 1)),
      elevation: 2,
      color: myColors.primary,
      child: Row(
        children: [
          Expanded(
            flex: DeviceInfo.screenWidth! < 800 ? 1: 2,
            child: Center(
              child: Text(
                DeviceInfo.screenWidth! < 800 ? 'F\nI\nL\nT\nR\nI': 'FILTRI',
                style: TextStyle(
                    color: Colors.white, fontSize: DeviceInfo.sizeTitle2),
              ),
            ),
          ),
          Visibility(
              visible: DeviceInfo.screenWidth! >= 1300,
              child: Expanded(
                flex: 20,
                child: Row(
                  children: [
                    SizedBox(
                      width: 1,
                    ),
                    Expanded(
                        flex: 5, child: build_chooseCustomerButton(context)),
                    /*SizedBox(
                      width: 1,
                    ),*/
                    Expanded(
                        flex: 5, child: build_chooseReleaseButton(context)),
                    /*SizedBox(
                      width: 1,
                    ),*/
                    Expanded(
                        flex: 5, child: build_chooseColleagueButton(context)),
                    /*SizedBox(
                      width: 1,
                    ),*/
                    Expanded(
                        flex: 5, child: build_chooseReferentsButton(context)),
                    SizedBox(
                      width: 1,
                    ),
                  ],
                ),
              )),
          Visibility(
              visible: DeviceInfo.screenWidth! < 1300 &&
                  DeviceInfo.screenWidth! >= 800,
              child: Expanded(
                flex: 15,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: build_chooseCustomerButton(context)),
                        /*SizedBox(
                      width: 1,
                    ),*/
                        Expanded(
                            flex: 5, child: build_chooseReleaseButton(context)),
                      ],
                    ),
                    /*SizedBox(
                      height: 1,
                    ),*/
                    Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: build_chooseColleagueButton(context)),
                        /*SizedBox(
                      width: 1,
                    ),*/
                        Expanded(
                            flex: 5,
                            child: build_chooseReferentsButton(context)),
                      ],
                    )
                  ],
                ),
              )),
          Visibility(
              visible: DeviceInfo.screenWidth! < 800,
              child: Expanded(
                flex: 15,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: build_chooseCustomerButton(context)),
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 5, child: build_chooseReleaseButton(context)),
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: build_chooseColleagueButton(context)),
                      ],
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: build_chooseReferentsButton(context)),
                      ],
                    )
                  ],
                ),
              )),
          Visibility(
              visible: DeviceInfo.screenWidth! >= 1400,
              child: Expanded(
                flex: 2,
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: build_ApplyFilters(),
                  ),
                  SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: build_DeleteFilters(context),
                  ),
                ]),
              )),
          Visibility(
              visible: DeviceInfo.screenWidth! < 1400,
              child: Expanded(
                flex: 1,
                child: Column(
                    children: [
                  build_DeleteFilters(context),
                      SizedBox(
                        width: 7,
                      ),
                  build_ApplyFilters(),
                ]),
              )),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  Center build_DeleteFilters(BuildContext context) {
    return Center(
      child: IconButton(
        icon:Icon(FontAwesomeIcons.eraser
            , color: Colors.white, size: 27),
        onPressed: () {
          ///cancella filtri
          setState(() {
            Provider.of<Projects>(context, listen: false).selectedCustomerId =
                null;
            Provider.of<Projects>(context, listen: false).selectedReleaseId =
                null;
            Provider.of<Projects>(context, listen: false).selectedColleagueId =
                null;
            Provider.of<Projects>(context, listen: false).selectedReferentId =
                null;
          });
        },
      ),
    );
  }

  Center build_ApplyFilters() {
    return Center(
      child: IconButton(
        icon: Icon(Icons.search, color: Colors.white, size: 32),
        onPressed: () {
          ///applica filtri
          _refreshProjects();
        },
      ),
    );
  }

  FutureBuilder<void> build_chooseCustomerButton(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Customers>(context, listen: false)
            .fetchAndSetCustomers(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              color: Colors.white,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Cliente  '),
                      DropdownButton<String?>(
                        borderRadius: BorderRadius.circular(8.0),
                        hint: Text(
                          '     Tutti i clienti', //'     Seleziona un Cliente',
                          style: TextStyle(
                            fontSize: DeviceInfo.sizeText,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        value: Provider.of<Projects>(context, listen: false)
                            .selectedCustomerId,
                        items: Provider.of<Customers>(context, listen: false)
                            .customers
                            .map((Cliente? customer) {
                          return DropdownMenuItem<String?>(
                            value: customer?.id.toString(),
                            child: Text(
                              '    ${customer?.nome}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: DeviceInfo.sizeText,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Provider.of<Projects>(context, listen: false)
                                .selectedReleaseId = null;
                            Provider.of<Projects>(context, listen: false)
                                .selectedReferentId = null;
                            Provider.of<Projects>(context, listen: false)
                                .selectedCustomerId = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Provider.of<Projects>(context, listen: false)
                              .selectedCustomerId !=
                          null
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<Projects>(context, listen: false)
                                  .selectedCustomerId = null;
                            });
                          },
                          icon: const Icon(Icons.clear))
                      : const Center(),
                ],
              ),
            );
          }
        });
  }

  FutureBuilder<void> build_chooseReleaseButton(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Projects>(context, listen: false)
                    .selectedCustomerId ==
                null
            ? Provider.of<Releases>(context, listen: false)
                .fetchAndSetReleases('')
            : Provider.of<Releases>(context, listen: false).fetchAndSetReleases(
                Provider.of<Projects>(context, listen: false)
                    .selectedCustomerId!),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              color: Colors.white,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Release  '),
                      DropdownButton<String?>(
                        style: TextStyle(overflow: TextOverflow.ellipsis,),
                        borderRadius: BorderRadius.circular(8.0),
                        hint: Text(
                          '     Tutte le release',
                          //'     Seleziona una Release',
                          style: TextStyle(
                            fontSize: DeviceInfo.sizeText,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        value: Provider.of<Projects>(context, listen: false)
                            .selectedReleaseId,
                        items: Provider.of<Releases>(context, listen: false)
                            .releases
                            .map((Release? release) {
                          return DropdownMenuItem<String?>(
                            value: release?.id.toString(),
                            child: Text(
                              '${release?.titolo}\n${release?.data}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: DeviceInfo.sizeText,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          //print(newValue);
                          setState(() {
                            Provider.of<Projects>(context, listen: false)
                                .selectedReleaseId = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Provider.of<Projects>(context, listen: false)
                              .selectedReleaseId !=
                          null
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<Projects>(context, listen: false)
                                  .selectedReleaseId = null;
                            });
                          },
                          icon: const Icon(Icons.clear))
                      : const Center(),
                ],
              ),
            );
          }
        });
  }

  FutureBuilder<void> build_chooseColleagueButton(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Colleagues>(context, listen: false)
            .fetchAndSetColleagues(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              color: Colors.white,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('PM  '),
                      DropdownButton<String?>(
                        borderRadius: BorderRadius.circular(8.0),
                        hint: Text(
                          '     Tutti i PM', //'     Seleziona un PM',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: DeviceInfo.sizeText,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        value: Provider.of<Projects>(context, listen: false)
                            .selectedColleagueId,
                        items: Provider.of<Colleagues>(context, listen: false)
                            .colleagues
                            .map((Collega? colleague) {
                          return DropdownMenuItem<String?>(
                            value: colleague?.id.toString(),
                            child: Text(
                              '    ${colleague?.cognome} ${colleague?.nome?.substring(0, 1)}.',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: DeviceInfo.sizeText,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Provider.of<Projects>(context, listen: false)
                                .selectedColleagueId = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                  Provider.of<Projects>(context, listen: false)
                              .selectedColleagueId !=
                          null
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<Projects>(context, listen: false)
                                  .selectedColleagueId = null;
                            });
                          },
                          icon: const Icon(Icons.clear))
                      : const Center(),
                ],
              ),
            );
          }
        });
  }

  FutureBuilder<void> build_chooseReferentsButton(BuildContext context) {
    return FutureBuilder(
        future:
            Provider.of<Projects>(context, listen: false).selectedCustomerId ==
                    null
                ? Provider.of<CustomersReferents>(context, listen: false)
                    .fetchAndSetReferents('')
                : Provider.of<CustomersReferents>(context, listen: false)
                    .fetchAndSetReferents(
                        Provider.of<Projects>(context, listen: false)
                            .selectedCustomerId!),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              color: Colors.white,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text('Referente Cliente  '),
                      DropdownButton<String?>(
                        borderRadius: BorderRadius.circular(8.0),
                        hint: Text(
                          '     Tutti i referenti',
                          overflow: TextOverflow.ellipsis,
                          //'     Seleziona un referente',
                          style: TextStyle(
                            fontSize: DeviceInfo.sizeText,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        value: Provider.of<Projects>(context, listen: false)
                            .selectedReferentId,
                        items: Provider.of<CustomersReferents>(context,
                                listen: false)
                            .referents
                            .map((referenteCliente? referents) {
                          return DropdownMenuItem<String?>(
                            value: referents?.id.toString(),
                            child: Text(
                              '    ${referents?.email}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: DeviceInfo.sizeText,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            Provider.of<Projects>(context, listen: false)
                                .selectedReferentId = newValue;
                            /*Provider.of<Releases>(context, listen: false)
                            .fetchAndSetReleases(_selectedClientId!);*/
                          });
                        },
                      ),
                    ],
                  ),
                  Provider.of<Projects>(context, listen: false)
                              .selectedReferentId !=
                          null
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              Provider.of<Projects>(context, listen: false)
                                  .selectedReferentId = null;
                            });
                          },
                          icon: const Icon(Icons.clear))
                      : const Center(),
                ],
              ),
            );
          }
        });
  }
}
