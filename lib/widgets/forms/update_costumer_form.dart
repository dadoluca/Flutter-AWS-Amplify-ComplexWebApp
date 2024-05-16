import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/providers/customers.dart';
import 'package:reply_project_management/widgets/buttons/save_button.dart';
import 'package:reply_project_management/widgets/forms/title_form_label.dart';
import '../../models/Cliente.dart';
import '../../variables/my_colors.dart';
import '../../variables/device_info.dart';
import '../buttons/cancel_button.dart';

class UpdateCostumerForm extends StatefulWidget {
   const UpdateCostumerForm({super.key, required this.customer});
   final Cliente customer;

   @override
  State<UpdateCostumerForm> createState() => _UpdateCostumerFormState();
}
class _UpdateCostumerFormState extends State<UpdateCostumerForm> {
  final _formKey = GlobalKey<FormState>();
  String _currentName = '';
  Color _pickerColor = Color(0xff000000);
  Color _currentColor= Color(0xff000000);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => _pickerColor = color);
  }

  bool init = false;

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: const Text('Scegli un colore!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: _pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('fatto'),
                onPressed: () {
                  setState(() => _currentColor = _pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );});
  }

  @override
  Widget build(BuildContext context) {
    if (!init) {
      setState(() {
        _currentColor = Provider.of<Customers>(context, listen: true)
            .getColor(widget.customer.id);
        changeColor(_currentColor);
      });
      init = true;
    }
    return  SizedBox(
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
                    child:TitleFormLabel("Modifica Cliente"),
                  ),
                  Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                            "Nome",
                            style: TextStyle(
                              //fontWeight: FontWeight.bold,
                              fontSize: DeviceInfo.sizeText,
                            ),
                          ),
                          TextFormField(
                            initialValue: widget.customer.nome,
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Specifica un nome!';
                              }
                              else{ _currentName = value;}
                              return null;
                            },
                            style: TextStyle(fontSize: DeviceInfo.sizeText,),
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                               Text(
                                "Colore",
                                style: TextStyle(
                                  fontSize: DeviceInfo.sizeText,
                                ),
                              ),
                              const SizedBox(width: 12,),
                              Icon(Icons.circle, color: _currentColor,)
                            ],
                          ),
                          const SizedBox(height: 12,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                onPressed: () => _dialogBuilder(context),
                                child:  Text('Scegli un colore', style: TextStyle(fontSize: DeviceInfo.sizeText,),),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CancelButton(Navigator.of(context).pop),
                        SaveButton(()async{
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar.
                            int result = await Provider.of<Customers>(context,listen: false)
                                .updateCustomer(widget.customer,_currentName,_currentColor);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              SnackBar(
                                content: Text(result == 200 ?
                                '$_currentName modificato correttamente!'
                                    : 'Modifica fallita!' ),
                                backgroundColor: result == 200? myColors.success
                                    :  myColors.error,

                              ),
                            );
                          }
                        })
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
