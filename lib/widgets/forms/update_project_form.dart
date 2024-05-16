import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/models/ModelProvider.dart';
import 'package:reply_project_management/providers/customers.dart';
import 'package:intl/intl.dart';
import 'package:reply_project_management/widgets/forms/title_form_label.dart';
import '../../variables/my_colors.dart';
import 'package:reply_project_management/widgets/buttons/cancel_button.dart';
import 'package:reply_project_management/widgets/buttons/save_button.dart';

import '../../variables/device_info.dart';
import '../../models/Cliente.dart';
import '../../providers/colleagues.dart';
import '../../providers/customers_referents.dart';
import '../../providers/projects.dart';
import '../../providers/releases.dart';

class UpdateProjectForm extends StatefulWidget {
  const UpdateProjectForm(
      {Key? key, required this.project})
      : super(key: key);
  final Attivita project;

  @override
  State<UpdateProjectForm> createState() => _UpdateProjectFormState();
}

class _UpdateProjectFormState extends State<UpdateProjectForm> {
  final _formKey = GlobalKey<FormState>();
  bool _showTextCustomer = false;
  bool _showTextRelease = false;

  String? _selectedClientId;
  String? _selectedReleaseId;
  String? _selectedCustomerReferentId;
  String? _selectedInternalReferentId;

  var project_TextInputFields = {
    'titolo': '',
    'stima': '',
    'stimaFunzionale': '',
    'efficenza': '',
    'consuntivato': '',
    'etc': '',
    'codFinanziamento': '',
    'stato': '',
    'allocazioneCompilata': '',
    'numCDT': '',
    'note': '',
  };

  double separation = 17;
  bool init = false;

  @override
  build(BuildContext context) {
    DeviceInfo.init(context);
    if (!init) {
      setState(() {
        _selectedClientId = widget.project.attivitaClienteIDId;
        _selectedReleaseId = widget.project.target?.id;
        _selectedCustomerReferentId =
            widget.project.attivitaReferenteClienteIDId;
        _selectedInternalReferentId = widget.project.attivitaReferenteInternoId;
        project_TextInputFields['titolo'] = widget.project.titolo.toString();
        project_TextInputFields['stima'] = widget.project.stima.toString();
        project_TextInputFields['consuntivato'] =
            widget.project.consuntivato.toString();
        project_TextInputFields['etc'] = widget.project.etc.toString();
        init = true;
      });
    }
    return SizedBox(
      height: DeviceInfo.screenHeight! * 0.80,
      width: DeviceInfo.screenWidth! * 0.70,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.only(
              left: DeviceInfo.screenWidth! * 0.04,
              right: DeviceInfo.screenWidth! * 0.04,
              top: DeviceInfo.screenWidth! * 0.01,
              bottom: DeviceInfo.screenWidth! * 0.01),
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: DeviceInfo.screenHeight! * 0.73,
              child: Column(
                children: [
                  /// title -------------------------------------------------------------
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        TitleFormLabel('Modifica Progetto'),
                      ],
                    ),
                  ),
                  /*const Divider(height: 20,thickness: 1,indent: 30,endIndent: 30,color:  myColors.primary,                  ),*/

                  /// form fields -------------------------------------------------------------
                  Expanded(
                    flex: 9,
                    child: DeviceInfo.screenWidth! > 1145
                        ? buildFields_twoColumns(context)
                        : buildFields_oneColumn(context),
                  ),

                  /// cancel & save -------------------------------------------------------------
                  build_CancelAndSaveButtons(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildFields_twoColumns(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceAround ,
      children: [
        SizedBox(
          height: 450,
          width: 400,
          child: ListView(
            children: [
              SizedBox(
                height: separation,
              ),
              build_chooseCustomerButton(context),
              _showTextCustomer
                  ? Text(
                      'Nessun cliente scelto!',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: myColors.error,
                        fontSize: DeviceInfo.sizeText! - 4,
                      ),
                    )
                  : Center(),
              SizedBox(
                height: separation,
              ),
              _selectedClientId != null
                  ? build_chooseReleaseButton(context)
                  : const Center(),
              _showTextRelease && !_showTextCustomer
                  ? Text(
                      'Nessuna Release selezionata!',
                      style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        color: myColors.error,
                        fontSize: DeviceInfo.sizeText! - 4,
                      ),
                    )
                  : Center(),
              SizedBox(
                height: separation,
              ),
              build_chooseColleagueButton(context),
              SizedBox(
                height: separation,
              ),
              _selectedClientId != null
                  ? build_chooseReferentsButton(context)
                  : const Center(),
            ],
          ),
        ),
        SizedBox(
          height: 450,
          width: 300,
          child: ListView(children: [
            buildInputText(
                'Titolo', 'titolo', widget.project.titolo ?? '', false),
            SizedBox(
              height: separation,
            ),
            buildInputText(
                'Stima', 'stima', widget.project.stima.toString() ?? '', false),
            buildInputText('Consuntivato', 'consuntivato',
                widget.project.consuntivato.toString() ?? '', false),
            SizedBox(
              height: separation,
            ),
            buildInputText(
                'ETC', 'etc', widget.project.etc.toString() ?? '', false),
            SizedBox(
              height: separation,
            ),
          ]),
        ),
      ],
    );
  }

  Row buildFields_oneColumn(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceAround ,
      children: [
        SizedBox(
          child: ListView(
            children: [
              SizedBox(
                height: separation,
              ),
              build_chooseCustomerButton(context),
              _showTextCustomer
                  ? Text(
                'Nessun cliente scelto!',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: myColors.error,
                  fontSize: DeviceInfo.sizeText! - 4,
                ),
              )
                  : Center(),
              SizedBox(
                height: separation,
              ),
              _selectedClientId != null
                  ? build_chooseReleaseButton(context)
                  : const Center(),
              _showTextRelease && !_showTextCustomer
                  ? Text(
                'Nessuna Release selezionata!',
                style: TextStyle(
                  //fontWeight: FontWeight.bold,
                  color: myColors.error,
                  fontSize: DeviceInfo.sizeText! - 4,
                ),
              )
                  : Center(),
              SizedBox(
                height: separation,
              ),
              build_chooseColleagueButton(context),
              SizedBox(
                height: separation,
              ),
              _selectedClientId != null
                  ? build_chooseReferentsButton(context)
                  : const Center(),
              SizedBox(
                height: separation,
              ),
              buildInputText(
                  'Titolo', 'titolo', widget.project.titolo ?? '', false),
              SizedBox(
                height: separation,
              ),
              buildInputText(
                  'Stima', 'stima', widget.project.stima.toString() ?? '', false),
              buildInputText('Consuntivato', 'consuntivato',
                  widget.project.consuntivato.toString() ?? '', false),
              SizedBox(
                height: separation,
              ),
              buildInputText(
                  'ETC', 'etc', widget.project.etc.toString() ?? '', false),
              SizedBox(
                height: separation,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildInputText(
      String title, String variable, String initialValue, bool validate,
      [String msg = '']) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: separation,
        ),
        Text(
          '$title:',
          style: TextStyle(
            //fontWeight: FontWeight.bold,
            //fontSize: DeviceInfo.sizeText,
          ),
        ),
        TextFormField(
          // The validator receives the text that the user has entered.
          decoration: InputDecoration(
              //helperText: title,
              helperStyle: TextStyle(fontWeight: FontWeight.bold),
              //counterText: title,
              //hintText: project_TextInputFields['$variable'],
              labelText: project_TextInputFields['$variable']),

          validator: (value) {
            if (value == null || value.isEmpty) {
              if (!validate) {
                return null;
              }
              return msg;
            } else {
              setState(() {
                project_TextInputFields['$variable'] = value.toString();
              });
              return null;
            }
          },
          style: TextStyle(
            fontSize: DeviceInfo.sizeText,
          ),
        ),
      ],
    );
  }

  FutureBuilder<void> build_chooseCustomerButton(BuildContext context) {
    //print('_selectedClientId: $_selectedClientId');
    return FutureBuilder(
      future: Provider.of<Customers>(context, listen: false).fetchAndSetCustomers(),
      builder: (ctx, snapshot) => Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Cliente:  '),
            DropdownButton<String?>(
              borderRadius: BorderRadius.circular(8.0),
              hint: Text(
                '     Seleziona un Cliente',
                style: TextStyle(
                  fontSize: DeviceInfo.sizeText,
                  color: Theme.of(context).hintColor,
                ),
              ),
              value: Provider.of<Customers>(context, listen: false)
                      .exists(_selectedClientId)
                  ? _selectedClientId
                  : null,
              items: [
                // aggiungi un elemento vuoto come valore predefinito
                DropdownMenuItem<String?>(
                  value: null,
                  child: Text(
                    'Nessuno',
                    style: TextStyle(fontSize: DeviceInfo.sizeText),
                  ),
                ),
                ...Provider.of<Customers>(context, listen: false)
                    .customers
                    .map((Cliente? customer) {
                  return DropdownMenuItem<String?>(
                    value: customer?.id.toString(),
                    child: Text(
                      '${customer?.nome}',
                      style: TextStyle(fontSize: DeviceInfo.sizeText),
                    ),
                  );
                }).toList(),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  _selectedReleaseId = null;
                  _selectedClientId = newValue;
                  print(
                      '_selectedClientId: $_selectedClientId, newValue: $newValue');
                  _showTextCustomer = false;
                  _showTextRelease = false;
                  /*Provider.of<Releases>(context, listen: false)
                        .fetchAndSetReleases(_selectedClientId!);*/
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  FutureBuilder<void> build_chooseReleaseButton(BuildContext context) {
    //print('build_chooseReleaseButton ${_selectedClientId!}');
    return FutureBuilder(
      future: Provider.of<Releases>(context, listen: false)
          .fetchAndSetReleases(_selectedClientId!),
      builder: (ctx, snapshot) => Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Release:  '),
            DropdownButton<String?>(
              style: TextStyle(overflow: TextOverflow.clip),
              borderRadius: BorderRadius.circular(8.0),
              hint: Text(
                '     Seleziona una Release',
                style: TextStyle(
                  fontSize: DeviceInfo.sizeText,
                  color: Theme.of(context).hintColor,
                ),
              ),
              value: Provider.of<Releases>(context, listen: false)
                      .exists(_selectedReleaseId)
                  ? _selectedReleaseId
                  : null,
              items: [
                // aggiungi un elemento vuoto come valore predefinito
                DropdownMenuItem<String?>(
                  value: null,
                  child: Text(
                    'Nessuna',
                    style: TextStyle(fontSize: DeviceInfo.sizeText),
                  ),
                ),
                ...Provider.of<Releases>(context, listen: false)
                    .releases
                    .map((Release? release) {
                  return DropdownMenuItem<String?>(
                    value: release?.id.toString(),
                    child: Text(
                      '    ${release?.titolo} - ${release?.data}',
                      style: TextStyle(
                        fontSize: DeviceInfo.sizeText,
                      ),
                    ),
                  );
                }).toList()
              ],
              onChanged: (String? newValue) {
                //print(newValue);
                setState(() {
                  _selectedReleaseId = newValue;
                  _showTextRelease = false;
                });
              },
            ),
          ],
        ),
      ),
    );
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('PM  '),
                  DropdownButton<String?>(
                    borderRadius: BorderRadius.circular(8.0),
                    hint: Text(
                      '     Tutti i PM', //'     Seleziona un PM',
                      style: TextStyle(
                        fontSize: DeviceInfo.sizeText,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    value: Provider.of<Colleagues>(context, listen: false)
                            .exists(_selectedInternalReferentId)
                        ? _selectedInternalReferentId
                        : null,
                    items: [
                      // aggiungi un elemento vuoto come valore predefinito
                      DropdownMenuItem<String?>(
                        value: null,
                        child: Text(
                          'Nessuno',
                          style: TextStyle(fontSize: DeviceInfo.sizeText),
                        ),
                      ),
                      ...Provider.of<Colleagues>(context, listen: false)
                          .colleagues
                          .map((Collega? colleague) {
                        return DropdownMenuItem<String?>(
                          value: colleague?.id.toString(),
                          child: Text(
                            '    ${colleague?.cognome} ${colleague?.nome?.substring(0, 1)}.',
                            style: TextStyle(
                              fontSize: DeviceInfo.sizeText,
                            ),
                          ),
                        );
                      }).toList()
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedInternalReferentId = newValue;
                      });
                    },
                  ),
                ],
              ),
            );
          }
        });
  }

  FutureBuilder<void> build_chooseReferentsButton(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<CustomersReferents>(context, listen: false)
            .fetchAndSetReferents(_selectedClientId ?? ''),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('Referente Cliente  '),
                  DropdownButton<String?>(
                    borderRadius: BorderRadius.circular(8.0),
                    hint: Text(
                      '     Tutti i referenti',
                      //'     Seleziona un referente',
                      style: TextStyle(
                        fontSize: DeviceInfo.sizeText,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    value:
                        Provider.of<CustomersReferents>(context, listen: false)
                                .exists(_selectedCustomerReferentId)
                            ? _selectedCustomerReferentId
                            : null,
                    items: [
                      // aggiungi un elemento vuoto come valore predefinito
                      DropdownMenuItem<String?>(
                        value: null,
                        child: Text(
                          'Nessuno',
                          style: TextStyle(fontSize: DeviceInfo.sizeText),
                        ),
                      ),
                      ...Provider.of<CustomersReferents>(context, listen: false)
                          .referents
                          .map((referenteCliente? referents) {
                        return DropdownMenuItem<String?>(
                          value: referents?.id.toString(),
                          child: Text(
                            '    ${referents?.email}',
                            style: TextStyle(
                              fontSize: DeviceInfo.sizeText,
                            ),
                          ),
                        );
                      }).toList()
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCustomerReferentId = newValue;
                      });
                    },
                  ),
                ],
              ),
            );
          }
        });
  }

  Expanded build_CancelAndSaveButtons(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CancelButton(Navigator.of(context).pop),
          SaveButton(() async {
            if (_selectedClientId == null) {
              setState(() {
                _showTextCustomer = true;
              });
              return;
            }
            if (_selectedReleaseId == null) {
              setState(() {
                _showTextRelease = true;
                return;
              });
            }
            setState(() {
              _showTextCustomer = false;
              _showTextRelease = false;
            });
            _formKey.currentState!.validate();

            print('update: ${project_TextInputFields['titolo']}');
            int result = await Provider.of<Projects>(context, listen: false)
                .updateProjectById(
                    widget.project.id,
                    project_TextInputFields['titolo'],
                    int.parse(project_TextInputFields['stima']!),
                    double.parse(project_TextInputFields['consuntivato']!),
                    double.parse(project_TextInputFields['etc']!),
                    Provider.of<Customers>(context, listen: false)
                        .findById(_selectedClientId),
                    Provider.of<CustomersReferents>(context, listen: false)
                        .findById(_selectedCustomerReferentId),
                    Provider.of<Colleagues>(context, listen: false)
                        .findById(_selectedInternalReferentId),
                    Provider.of<Releases>(context, listen: false)
                        .findById(_selectedReleaseId));
            print('result : $result');

            if (result == 200) {
              Navigator.of(context).pop();
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  result == 200
                      ? '${project_TextInputFields['titolo']} modificato correttamente!'
                      : 'Modifica fallita!',
                  style: TextStyle(fontSize: DeviceInfo.sizeTitle2),
                ),
                backgroundColor:
                    result == 200 ? myColors.success : myColors.error,
              ),
            );
          }),
        ],
      ),
    );
  }
}
