import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/models/ModelProvider.dart';
import 'package:reply_project_management/providers/customers.dart';
import 'package:intl/intl.dart';
import 'package:reply_project_management/widgets/buttons/cancel_button.dart';
import 'package:reply_project_management/widgets/buttons/save_button.dart';
import 'package:reply_project_management/widgets/forms/title_form_label.dart';

import '../../providers/colleagues.dart';
import '../../providers/customers_referents.dart';
import '../../variables/my_colors.dart';
import '../../variables/device_info.dart';
import '../../models/Cliente.dart';
import '../../providers/projects.dart';
import '../../providers/releases.dart';

class InsertProjectForm extends StatefulWidget {
  const InsertProjectForm({super.key});

  @override
  State<InsertProjectForm> createState() => _InsertProjectFormState();
}

class _InsertProjectFormState extends State<InsertProjectForm> {
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
    'consuntivato': '',
    'etc': '',
    'codFinanziamento': '',
    'clienteID': '',
    'stato': '',
    'allocazioneCompilata': '',
    'numCDT': '',
    'note': '',
  };

  double separation = 17;
  bool init = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceInfo.screenHeight! * 0.85,
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
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TitleFormLabel('Inserisci Progetto'),
                    ],
                  ),
                ),

                /// form fields -------------------------------------------------------------
                Expanded(
                  flex: 9,
                  child: DeviceInfo.screenWidth! > 1145
                      ? buildFields_twoColumns(context)
                      : buildFields_oneColumn(context),
                ),
                /// cancel & save -------------------------------------------------------------
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      CancelButton(() {
                        Navigator.of(context).pop();
                      }),
                      SaveButton(() async {
                        if (_selectedClientId == null) {
                          setState(() {
                            _showTextCustomer = true;
                          });
                        }
                        if (_selectedReleaseId == null) {
                          setState(() {
                            _showTextRelease = true;
                          });
                        } else {
                          setState(() {
                            _showTextCustomer = false;
                          });
                          if (_formKey.currentState!.validate()) {
                            print(
                                'insert: ${project_TextInputFields['titolo']}');
                            int result = await Provider.of<Projects>(context, listen: false).createProject(
                                project_TextInputFields['titolo'],
                                project_TextInputFields['stima'] == ''
                                    ? 0
                                    : int.parse(
                                        project_TextInputFields['stima']!),
                                project_TextInputFields['stimaFunzionale'] == ''
                                    ? 0
                                    : int.parse(project_TextInputFields[
                                        'stimaFunzionale']!),
                                project_TextInputFields['consuntivato'] == ''
                                    ? 0.0
                                    : double.parse(project_TextInputFields[
                                        'consuntivato']!),
                                project_TextInputFields['etc'] == ''
                                    ? 0
                                    : double.parse(
                                        project_TextInputFields['etc']!),
                                project_TextInputFields['codFinanziamento'] == ''
                                    ? ''
                                    : project_TextInputFields[
                                        'codFinanziamento'],
                                Provider.of<Customers>(context, listen: false)
                                    .findById(_selectedClientId!),
                                Provider.of<CustomersReferents>(context, listen: false)
                                    .findById(_selectedCustomerReferentId),
                                null,
                                Provider.of<Colleagues>(context, listen: false)
                                    .findById(_selectedInternalReferentId),
                                project_TextInputFields['stato'] == ''
                                    ? ''
                                    : project_TextInputFields['stato'],
                                project_TextInputFields['allocazioneCompilata'] == '' ? '' : project_TextInputFields['allocazioneCompilata'],
                                project_TextInputFields['numCDT'] == '' ? 0 : int.parse(project_TextInputFields['numCDT']!),
                                project_TextInputFields['note'] == '' ? '' : project_TextInputFields['note'],
                                Provider.of<Releases>(context, listen: false).findById(_selectedReleaseId!),
                                _selectedClientId,
                                _selectedCustomerReferentId,
                                _selectedInternalReferentId,
                                _selectedReleaseId);
                            print('result : $result');

                            if (result == 200) {
                              Navigator.of(context).pop();
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  result == 200
                                      ? '${project_TextInputFields['titolo']} inserito correttamente!'
                                      : 'Inserimento fallito!',
                                  style: TextStyle(
                                      fontSize: DeviceInfo.sizeTitle2),
                                ),
                                backgroundColor: result == 200
                                    ? myColors.success
                                    : myColors.error,
                              ),
                            );
                          }
                        }
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildInputText(String title, String variable, bool validate,
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
          // The validator receives the text that the user has entered.
          validator: (value) {
            setState(() {
              project_TextInputFields['$variable'] = value.toString();
            });
            if (!validate) {
              return null;
            }
            if (value == null || value.isEmpty) {
              return msg;
            }
            return null;
          },
          style: TextStyle(
            fontSize: DeviceInfo.sizeText,
          ),
        ),
      ],
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
                  color:  myColors.error,
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
                  color:  myColors.error,
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
              'Titolo',
              'titolo',
              true,
              'Specifica un titolo!',
            ),
            SizedBox(
              height: separation,
            ),
            buildInputText(
                'Stima', 'stima', true, 'Specifica una stima!'),
            buildInputText('Consuntivato', 'consuntivato', false),
            SizedBox(
              height: separation,
            ),
            buildInputText(
                'ETC', 'etc', false),
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
                  color:  myColors.error,
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
                  color:  myColors.error,
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
                'Titolo',
                'titolo',
                true,
                'Specifica un titolo!',
              ),
              SizedBox(
                height: separation,
              ),
              buildInputText(
                  'Stima', 'stima', true, 'Specifica una stima!'),
              buildInputText('Consuntivato', 'consuntivato', false),
              SizedBox(
                height: separation,
              ),
              buildInputText(
                  'ETC', 'etc', false),
              SizedBox(
                height: separation,
              ),
            ],
          ),
        ),
      ],
    );
  }


  FutureBuilder<void> build_chooseCustomerButton(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<Customers>(context, listen: false).fetchAndSetCustomers(),
      builder: (ctx, snapshot) => Expanded(
        child: Container(
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
                value: _selectedClientId,
                items: Provider.of<Customers>(context, listen: false)
                    .customers
                    .map((Cliente? customer) {
                  return DropdownMenuItem<String?>(
                    value: customer?.id.toString(),
                    child: Text(
                      '    ${customer?.nome}',
                      style: TextStyle(
                        fontSize: DeviceInfo.sizeText,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  //print(newValue);
                  setState(() {
                    _selectedClientId = newValue!;
                    _showTextCustomer = false;
                    _showTextRelease = false;

                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<void> build_chooseReleaseButton(BuildContext context) {
    print(_selectedClientId);
    return FutureBuilder(
      future: Provider.of<Releases>(context, listen: false)
          .fetchAndSetReleases(_selectedClientId!),
      builder: (ctx, snapshot) => Expanded(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Release:  '),
              DropdownButton<String?>(
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
                items: Provider.of<Releases>(context, listen: false)
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
                }).toList(),
                onChanged: (String? newValue) {
                  //print(newValue);
                  setState(() {
                    _selectedReleaseId = newValue!;
                    _showTextRelease = false;
                  });
                },
              ),
            ],
          ),
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
                      '     Seleziona un PM', //'     Seleziona un PM',
                      style: TextStyle(
                        fontSize: DeviceInfo.sizeText,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    value:  Provider.of<Colleagues>(context, listen: false)
                        .exists(_selectedInternalReferentId)
                        ? _selectedInternalReferentId
                        : null,
                    items: [
                      if(_selectedInternalReferentId != null)
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
                      '    Seleziona un Referente',
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
                      if(_selectedCustomerReferentId != null)
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

}
