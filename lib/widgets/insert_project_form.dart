import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/graphic_providers/show_forms.dart';
import 'package:reply_project_management/models/ModelProvider.dart';
import 'package:reply_project_management/providers/customers.dart';
import 'package:intl/intl.dart';
import 'package:reply_project_management/widgets/cancel_button.dart';
import 'package:reply_project_management/widgets/save_button.dart';

import '../device_info.dart';
import '../models/Cliente.dart';
import '../graphic_providers/show_release_form.dart';
import '../providers/projects.dart';
import '../providers/releases.dart';

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
  referenteCliente? _referenteClienteID = null;
  List<CollegaAttivita>? _Risorse = null;
  Collega? _ReferenteInterno = null;
  String? _attivitaReferenteClienteIDId = '';
  String? _attivitaReferenteInternoId = '';
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: DeviceInfo.screenHeight! * 0.85,
      width: DeviceInfo.screenWidth! * 0.4,
      child: Card(
        elevation: 19,
        child: Padding(
          padding: EdgeInsets.all(DeviceInfo.screenWidth! * 0.03),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Inserisci Progetto",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: DeviceInfo.sizeTitle1,
                        ),
                      ),
                    ],
                  ),
                ),

                /// form fields -------------------------------------------------------------
                Expanded(
                    flex: 9,
                    child: SizedBox(
                      height: 400,
                      child: ListView(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              build_chooseCustomerButton(context),
                            ],
                          ),
                          _showTextCustomer
                              ? Expanded(
                                  child: Text(
                                    'Nessun cliente scelto!',
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      color: const Color(0xffcb0202),
                                      fontSize: DeviceInfo.sizeText! - 4,
                                    ),
                                  ),
                                )
                              : Center(),
                          SizedBox(
                            height: 20,
                          ),
                          _selectedClientId != null
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    build_chooseReleaseButton(context),
                                  ],
                                )
                              : const Center(),
                          _showTextRelease && !_showTextCustomer
                              ? Expanded(
                                  child: Text(
                                    'Nessuna Release selezionata!',
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      color: const Color(0xffcb0202),
                                      fontSize: DeviceInfo.sizeText! - 4,
                                    ),
                                  ),
                                )
                              : Center(),
                          SizedBox(
                            height: 20,
                          ),
                          buildInputText(
                            'Titolo',
                            'titolo',
                            true,
                            'Specifica un titolo!',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buildInputText(
                            'Stima',
                            'stima',
                            true,
                            'Specifica una stima!',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          buildInputText(
                              'Stima funzionale', 'stimaFunzionale', false),
                          SizedBox(
                            height: 20,
                          ),
                          buildInputText('ETC', 'etc', false),
                          SizedBox(
                            height: 20,
                          ),
                          buildInputText('Consuntivato', 'consuntivato', false),
                          SizedBox(
                            height: 20,
                          ),
                          buildInputText('Codice Finanziamento',
                              'codFinanziamento', false),
                          SizedBox(
                            height: 20,
                          ),
                          buildInputText('Stato', 'stato', false),
                          SizedBox(
                            height: 20,
                          ),
                          buildInputText('Allocazione Compilata',
                              'allocazioneCompilata', false),
                          SizedBox(
                            height: 20,
                          ),
                          buildInputText('numCDT', 'numCDT', false),
                          SizedBox(
                            height: 20,
                          ),
                          buildInputText('Note', 'note', false),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )),

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
                                _referenteClienteID,
                                _Risorse,
                                _ReferenteInterno,
                                project_TextInputFields['stato'] == ''
                                    ? ''
                                    : project_TextInputFields['stato'],
                                project_TextInputFields['allocazioneCompilata'] == '' ? '' : project_TextInputFields['allocazioneCompilata'],
                                project_TextInputFields['numCDT'] == '' ? 0 : int.parse(project_TextInputFields['numCDT']!),
                                project_TextInputFields['note'] == '' ? '' : project_TextInputFields['note'],
                                Provider.of<Releases>(context, listen: false).findById(_selectedReleaseId!),
                                _selectedClientId,
                                _attivitaReferenteClienteIDId,
                                _attivitaReferenteInternoId,
                                _selectedReleaseId);
                            print('result : $result');

                            if (result == 200) {
                              Provider.of<ShowForms>(context, listen: false)
                                  .toggleProject();
                            }
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  result == 200
                                      ? 'Progetto ${project_TextInputFields['titolo']} inserito correttamente!'
                                      : 'Inserimento fallito!',
                                  style: TextStyle(
                                      fontSize: DeviceInfo.sizeTitle2),
                                ),
                                backgroundColor: result == 200
                                    ? Colors.green
                                    : Color(0xffcb0202),
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
        Text(
          title,
          style: TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: DeviceInfo.sizeText,
          ),
        ),
        TextFormField(
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

  FutureBuilder<void> build_chooseCustomerButton(BuildContext context) {
    return FutureBuilder(
      future:
          Provider.of<Customers>(context, listen: false).fetchAndSetCustomers(),
      builder: (ctx, snapshot) => Expanded(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: DropdownButton<String?>(
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
                Provider.of<Releases>(context, listen: false)
                    .fetchAndSetReleases(_selectedClientId!);
              });
            },
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
          child: DropdownButton<String?>(
            borderRadius: BorderRadius.circular(8.0),
            hint: Text(
              '     Seleziona una Release',
              style: TextStyle(
                fontSize: DeviceInfo.sizeText,
                color: Theme.of(context).hintColor,
              ),
            ),
            value: _selectedReleaseId,
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
        ),
      ),
    );
  }
}
