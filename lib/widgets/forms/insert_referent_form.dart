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
import '../../providers/customers_referents.dart';
import '../../variables/my_colors.dart';

class InsertReferentForm extends StatefulWidget {
  const InsertReferentForm(this.customerId);
  final String customerId;

  @override
  State<InsertReferentForm> createState() => _InsertReferentFormState();
}

class _InsertReferentFormState extends State<InsertReferentForm> {
  final _formKey = GlobalKey<FormState>();
  String _currentEmail = '';


  @override
  Widget build(BuildContext context) {
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
                    child: TitleFormLabel('Inserisci Referente'),
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
                                    "Email",
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                      fontSize: DeviceInfo.sizeText,
                                    ),
                                  ),
                                  TextFormField(
                                    // The validator receives the text that the user has entered.
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Specifica una email!';
                                      }
                                      else{ _currentEmail = value;}
                                      return null;
                                    },
                                    style: TextStyle(fontSize: DeviceInfo.sizeText,),
                                  ),
                                ],
                              )),
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
                              Cliente? customer = Provider.of<Customers>(context, listen: false)
                                  .findById( widget.customerId!);

                                int result = await Provider.of<CustomersReferents>(context,listen: false)
                                    .createReferent(_currentEmail, customer!);

                              if(result == 200){
                                Navigator.of(context).pop();
                              }
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text(result == 200 ?
                                  'Referente $_currentEmail inserito correttamente!'
                                      : 'Inserimento fallito!', style: TextStyle(fontSize: DeviceInfo.sizeTitle2),),
                                  backgroundColor: result == 200 ? myColors.success
                                      : myColors.error,
                                ),
                              );
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

}
