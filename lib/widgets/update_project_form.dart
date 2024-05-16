import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/graphic_providers/show_forms.dart';
import 'package:reply_project_management/models/ModelProvider.dart';
import 'package:reply_project_management/providers/customers.dart';
import 'package:intl/intl.dart';
import 'package:reply_project_management/variables/my_colors.dart';
import 'package:reply_project_management/widgets/cancel_button.dart';
import 'package:reply_project_management/widgets/save_button.dart';

import '../device_info.dart';
import '../models/Cliente.dart';
import '../graphic_providers/show_release_form.dart';
import '../providers/projects.dart';
import '../providers/releases.dart';

class UpdateProjectForm extends StatefulWidget {
  const UpdateProjectForm(
      {Key? key, required this.project, required this.toggle})
      : super(key: key);
  final Attivita project;
  final Function toggle;

  @override
  State<UpdateProjectForm> createState() => _UpdateProjectFormState();
}

class _UpdateProjectFormState extends State<UpdateProjectForm> {
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
  Widget build(BuildContext context) {
    DeviceInfo.init(context);
    setState(() {
      if (!init) {
        _selectedClientId = _selectedClientId ?? widget.project.attivitaClienteIDId;
        _selectedReleaseId = _selectedReleaseId ?? widget.project.target?.id;
        project_TextInputFields['titolo']= widget.project.titolo.toString();
        project_TextInputFields['stima']=  widget.project.stima.toString();
        project_TextInputFields['stimaFunzionale']=   widget.project.stimaFunzionale.toString();
        project_TextInputFields['consuntivato']=widget.project.consuntivato.toString();
        project_TextInputFields['etc']= widget.project.etc.toString();
        project_TextInputFields['codFinanziamento']=widget.project.codFinanziamento.toString();
        project_TextInputFields['stato']= widget.project.stato.toString();
        project_TextInputFields['allocazioneCompilata']=  widget.project.allocazioneCompilata.toString();
        project_TextInputFields['numCDT']=widget.project.numCDT.toString();
        project_TextInputFields['note']=widget.project.note.toString();
        init=true;
      }
    });
    return SizedBox(
      height: DeviceInfo.screenHeight! * 0.73,
      child: Card(
        elevation: 19,
        child: Padding(
          padding: EdgeInsets.only(
              top: DeviceInfo.screenWidth! * 0.01,
              bottom: DeviceInfo.screenWidth! * 0.01),
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: DeviceInfo.screenHeight! * 0.73,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Modifica Progetto",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: DeviceInfo.sizeTitle2,
                              color: myColors.primary),
                        ),
                      ],
                    ),
                  ),
                  /*const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                    color:  myColors.primary,
                  ),*/

                  /// form fields -------------------------------------------------------------
                  Expanded(
                    flex: 9,
                    child: DeviceInfo.screenWidth! > 1050
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 450,
                                width: 300,
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
                                              color: const Color(0xffcb0202),
                                              fontSize:
                                                  DeviceInfo.sizeText! - 4,
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
                                              color: const Color(0xffcb0202),
                                              fontSize:
                                                  DeviceInfo.sizeText! - 4,
                                            ),
                                          )
                                        : Center(),
                                    SizedBox(
                                      height: separation,
                                    ),
                                    buildInputText('Titolo', 'titolo',
                                        widget.project.titolo ?? '', false),
                                    SizedBox(
                                      height: separation,
                                    ),
                                    buildInputText(
                                        'Stima',
                                        'stima',
                                        widget.project.stima.toString() ?? '',
                                        false),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 450,
                                width: 300,
                                child: ListView(children: [
                                  buildInputText(
                                      'Stima funzionale',
                                      'stimaFunzionale',
                                      widget.project.stimaFunzionale
                                              .toString() ??
                                          '',
                                      false),
                                  SizedBox(
                                    height: separation,
                                  ),
                                  buildInputText(
                                      'ETC',
                                      'etc',
                                      widget.project.etc.toString() ?? '',
                                      false),
                                  SizedBox(
                                    height: separation,
                                  ),
                                  buildInputText(
                                      'Consuntivato',
                                      'consuntivato',
                                      widget.project.consuntivato.toString() ??
                                          '',
                                      false),
                                  SizedBox(
                                    height: separation,
                                  ),
                                  buildInputText(
                                      'Codice Finanziamento',
                                      'codFinanziamento',
                                      widget.project.codFinanziamento
                                              .toString() ??
                                          '',
                                      false),
                                  SizedBox(
                                    height: separation,
                                  ),
                                ]),
                              ),
                              SizedBox(
                                height: 450,
                                width: 300,
                                child: ListView(children: [
                                  buildInputText(
                                      'Stato',
                                      'stato',
                                      widget.project.stato.toString() ?? '',
                                      false),
                                  SizedBox(
                                    height: separation,
                                  ),
                                  buildInputText(
                                      'Allocazione Compilata',
                                      'allocazioneCompilata',
                                      widget.project.allocazioneCompilata
                                              .toString() ??
                                          '',
                                      false),
                                  SizedBox(
                                    height: separation,
                                  ),
                                  buildInputText(
                                      'numCDT',
                                      'numCDT',
                                      widget.project.numCDT.toString() ?? '',
                                      false),
                                  SizedBox(
                                    height: separation,
                                  ),
                                  buildInputText(
                                      'Note',
                                      'note',
                                      widget.project.note.toString() ?? '',
                                      false),
                                  SizedBox(
                                    height: separation,
                                  ),
                                ]),
                              )
                            ],
                          )
                        : SizedBox(
                            width: 450,
                            child: ListView(children: [
                              SizedBox(
                                height: separation,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  build_chooseCustomerButton(context),
                                ],
                              ),
                              _showTextCustomer
                                  ? Text(
                                      'Nessun cliente scelto!',
                                      style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: const Color(0xffcb0202),
                                        fontSize: DeviceInfo.sizeText! - 4,
                                      ),
                                    )
                                  : Center(),
                              SizedBox(
                                height: separation,
                              ),
                              _selectedClientId != null
                                  ? Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        build_chooseReleaseButton(context),
                                      ],
                                    )
                                  : const Center(),
                              _showTextRelease && !_showTextCustomer
                                  ? Text(
                                      'Nessuna Release selezionata!',
                                      style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        color: const Color(0xffcb0202),
                                        fontSize: DeviceInfo.sizeText! - 4,
                                      ),
                                    )
                                  : Center(),
                              SizedBox(
                                height: separation,
                              ),
                              buildInputText(
                                  'Titolo',
                                  'titolo',
                                  widget.project.titolo.toString() ?? '',
                                  false),
                              SizedBox(
                                height: separation,
                              ),
                              buildInputText('Stima', 'stima',
                                  widget.project.stima.toString() ?? '', false),
                              SizedBox(
                                height: separation,
                              ),
                              buildInputText(
                                  'Stima funzionale',
                                  'stimaFunzionale',
                                  widget.project.stimaFunzionale.toString() ??
                                      '',
                                  false),
                              SizedBox(
                                height: separation,
                              ),
                              buildInputText('ETC', 'etc',
                                  widget.project.etc.toString() ?? '', false),
                              SizedBox(
                                height: separation,
                              ),
                              buildInputText(
                                  'Consuntivato',
                                  'consuntivato',
                                  widget.project.consuntivato.toString() ?? '',
                                  false),
                              SizedBox(
                                height: separation,
                              ),
                              buildInputText(
                                  'Codice Finanziamento',
                                  'codFinanziamento',
                                  widget.project.codFinanziamento.toString() ??
                                      '',
                                  false),
                              SizedBox(
                                height: separation,
                              ),
                              buildInputText('Stato', 'stato',
                                  widget.project.stato.toString() ?? '', false),
                              SizedBox(
                                height: separation,
                              ),
                              buildInputText(
                                  'Allocazione Compilata',
                                  'allocazioneCompilata',
                                  widget.project.allocazioneCompilata
                                          .toString() ??
                                      '',
                                  false),
                              SizedBox(
                                height: separation,
                              ),
                              buildInputText(
                                  'numCDT',
                                  'numCDT',
                                  widget.project.numCDT.toString() ?? '',
                                  false),
                              SizedBox(
                                height: separation,
                              ),
                              buildInputText('Note', 'note',
                                  widget.project.note.toString() ?? '', false),
                              SizedBox(
                                height: separation,
                              ),
                            ]),
                          ),
                  ),
                  /*const Divider(
                    height: 20,
                    thickness: 1,
                    indent: 30,
                    endIndent: 30,
                    color:  myColors.primary,
                  ),*/

                  /// cancel & save -------------------------------------------------------------
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CancelButton(widget.toggle),
                        SaveButton(()async{
                          if (_selectedClientId == null) {
                            setState(() {
                              _showTextCustomer = true;
                            });
                          }
                          if (_selectedReleaseId == null) {
                            _showTextRelease = true;
                          } else {
                            setState(() {
                              _showTextCustomer = false;
                            });
                            if (_formKey.currentState!.validate()) {
                              print(
                                  'update: ${project_TextInputFields['titolo']}');

                              int result = await Provider.of<Projects>(
                                  context,
                                  listen: false)
                                  .updateProject(
                                  widget.project.id,
                                  project_TextInputFields['titolo'],
                                  int.parse(
                                      project_TextInputFields['stima']!),
                                  int.parse(project_TextInputFields[
                                  'stimaFunzionale']!),
                                  double.parse(project_TextInputFields[
                                  'consuntivato']!),
                                  double.parse(
                                      project_TextInputFields['etc']!),
                                  project_TextInputFields[
                                  'codFinanziamento'],
                                  Provider.of<Customers>(context,
                                      listen: false)
                                      .findById(_selectedClientId!),
                                  _referenteClienteID,
                                  _Risorse,
                                  _ReferenteInterno,
                                  project_TextInputFields['stato'],
                                  project_TextInputFields[
                                  'allocazioneCompilata'],
                                  int.parse(
                                      project_TextInputFields['numCDT']!),
                                  project_TextInputFields['note'],
                                  Provider.of<Releases>(context,
                                      listen: false)
                                      .findById(_selectedReleaseId!),
                                  _selectedClientId,
                                  _attivitaReferenteClienteIDId,
                                  _attivitaReferenteInternoId,
                                  _selectedReleaseId);
                              print('result : $result');

                              if (result == 200) {
                                widget.toggle();
                              }
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    result == 200
                                        ? 'Progetto ${project_TextInputFields['titolo']} modificato correttamente!'
                                        : 'Modifica fallita!',
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
      ),
    );
  }

  Column buildInputText(
      String title, String variable, String initialValue, bool validate,
      [String msg = '']) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /*Text(
          title,
          style: TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: DeviceInfo.sizeText,
          ),
        ),*/
        TextFormField(
          // The validator receives the text that the user has entered.
          decoration: InputDecoration(
              helperText: title,
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
    print('_selectedClientId: $_selectedClientId');
    return FutureBuilder(
      future:
          Provider.of<Customers>(context, listen: false).fetchAndSetCustomers(),
      builder: (ctx, snapshot) => Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
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
    print('build_chooseReleaseButton ${_selectedClientId!}');
    return FutureBuilder(
      future: Provider.of<Releases>(context, listen: false)
          .fetchAndSetReleases(_selectedClientId!),
      builder: (ctx, snapshot) => Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
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
              value: _selectedReleaseId,
              items: Provider.of<Releases>(context, listen: false)
                  .releases
                  .map((Release? release) {
                print(
                    '-----------------------------\n${Provider.of<Releases>(context, listen: false).releases}');
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
}
