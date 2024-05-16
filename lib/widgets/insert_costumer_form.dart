import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/providers/customers.dart';
import 'package:reply_project_management/graphic_providers/show_forms.dart';
import 'package:reply_project_management/widgets/save_button.dart';
import '../variables/my_colors.dart';
import '../device_info.dart';
import 'cancel_button.dart';

class InsertCostumerForm extends StatefulWidget {
   InsertCostumerForm(this.action, {super.key});
Function action;
  @override
  State<InsertCostumerForm> createState() => _InsertCostumerFormState();
}

class _InsertCostumerFormState extends State<InsertCostumerForm> {
  final _formKey = GlobalKey<FormState>();
  String _currentName = '';
  Color _pickerColor = Color(0xff000000);
  Color _currentColor = Color(0xff000000);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => _pickerColor = color);
  }


  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(title: const Text('Pick a color!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: _pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Got it'),
                onPressed: () {
                  setState(() => _currentColor = _pickerColor);
                  String _colorString = _currentColor.toString();
                  String hexString = _colorString.substring(8, _colorString.length - 1); // prendi solo "ffcc3838"

                  Color color = Color(int.parse("0x$hexString")); // aggiungi "0x" prima del valore esadecimale

                  print(color);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );});
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: DeviceInfo.screenHeight! * 0.85,
      width: DeviceInfo.screenWidth! * 0.4,
      child: Card(
        elevation: 19,
        child: Padding(
          padding: EdgeInsets.all(DeviceInfo.screenWidth! * 0.03),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Expanded(
                    flex: 2,
                    child: Text(
                      "Inserisci Cliente",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: DeviceInfo.sizeTitle1,
                      ),
                    ),
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
                        CancelButton(widget.action),
                        SaveButton(()async{
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar.
                            int result = await Provider.of<Customers>(context,listen: false)
                                .createCustomer(_currentName, _currentColor);
                            widget.action();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              SnackBar(
                                content: Text(result == 200 ?
                                '$_currentName inserito correttamente!'
                                    : 'Inserimento fallito!' ),
                                backgroundColor: result == 200? Colors.green
                                    : const Color(0xffcb0202),

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
