import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/models/ModelProvider.dart';
import 'package:reply_project_management/providers/customers.dart';
import 'package:intl/intl.dart';
import 'package:reply_project_management/widgets/buttons/cancel_button.dart';
import 'package:reply_project_management/widgets/buttons/save_button.dart';
import 'package:reply_project_management/widgets/forms/title_form_label.dart';

import '../../variables/device_info.dart';
import '../../models/Cliente.dart';
import '../../providers/releases.dart';
import '../../variables/my_colors.dart';

class InsertReleaseForm extends StatefulWidget {
  const InsertReleaseForm(this.customerId);
  final String customerId;

  @override
  State<InsertReleaseForm> createState() => _InsertReleaseFormState();
}

class _InsertReleaseFormState extends State<InsertReleaseForm> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedClientId;
  late DateTime _selectedDate;
  bool _showText = false;
  bool _showTextCustomer = false;
  String _currentName = '';


  @override
  Widget build(BuildContext context) {
    _selectedClientId = widget.customerId;
    return SizedBox(
      height: DeviceInfo.screenHeight! * 0.85,
      width: DeviceInfo.screenWidth! * 0.4,
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(DeviceInfo.screenWidth! * 0.03),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const Expanded(
                    flex: 2,
                    child: TitleFormLabel('Inserisci Release'),
                  ),
                  /// form fields -------------------------------------------------------------
                  Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Titolo",
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      fontSize: DeviceInfo.sizeText,
                                    ),
                                  ),
                                  TextFormField(
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Specifica un titolo!';
                                      }
                                      else{ _currentName = value;}
                                      return null;
                                    },
                                    style: TextStyle(fontSize: DeviceInfo.sizeText,),
                                  ),
                                ],
                              )),
                          SizedBox(height: 15,),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                               // build_chooseCustomerButton(context)
                              ],
                            ),
                          ),
                          _showTextCustomer
                              ? Expanded(
                            child: Text('Nessun cliente scelto!', style: TextStyle(
                                //fontWeight: FontWeight.bold,
                                color: myColors.error,
                                fontSize: DeviceInfo.sizeText!-4,
                            ),),
                          ):Center(),
                          SizedBox(height: 20,),
                          Expanded(
                            flex:1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(onPressed: () {
                                  _presentDatePicker();
                                }, child:  Text('Scegli una data', style: TextStyle(fontSize: DeviceInfo.sizeText,),),),
                                _showText ?SizedBox(width: 20,):Center(),
                                _showText ?
                                Expanded(
                                  child: Text(_selectedDate == null
                                      ? 'Nessuna data scelta!'
                                      : 'Data scelta: ${DateFormat.yMd().format(
                                      _selectedDate!)}', style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      color: _selectedDate == null ? myColors.error
                                          : myColors.primary,
                                    fontSize: DeviceInfo.sizeText!-4,
                                  ),),
                                ):Center(),

                              ],
                            ),
                          ),
                        ],
                      )),
                  
                  /// cancel & save -------------------------------------------------------------
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CancelButton(Navigator.of(context).pop),
                        SaveButton(()async{
                          if( _formKey.currentState!.validate()){
                            // Validate returns true if the form is valid, or false otherwise.
                            if(_selectedClientId == null){
                              setState(() {
                                _showTextCustomer = true;
                              });
                            }
                            else {
                              setState(() {
                                _showTextCustomer = false;
                              });
                            }
                            if (_selectedDate != null && !_showTextCustomer) {
                              Cliente? customer = Provider.of<Customers>(context, listen: false)
                                  .findById(_selectedClientId!);

                              int result = await Provider.of<Releases>(context,listen: false)
                                  .createRelease(_currentName, _selectedDate, customer!);

                              if(result == 200){
                                Navigator.of(context).pop();
                              };

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text(result == 200 ?
                                  'Release $_currentName inserita correttamente!'
                                      : 'Inserimento fallito!', style: TextStyle(fontSize: DeviceInfo.sizeTitle2),),
                                  backgroundColor: result == 200 ? myColors.success
                                      : myColors.error,
                                ),
                              );
                            }else{
                              setState(() {
                                _showText = true;
                              });
                            }
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }


  //---------- Voglio mostrare un datePicker quando premo sul btn 'Choose Date'
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2026),
      //then --> function called once the user choose a date
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        _showText = true;
      });
    });
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
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
