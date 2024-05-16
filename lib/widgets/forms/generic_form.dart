import 'package:flutter/material.dart';

import '../../variables/device_info.dart';
import 'cancel_button.dart';

class GenericForm extends StatelessWidget {
  const GenericForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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

                Expanded(
                    flex: 9,
                    child: SizedBox(
                      height: 400,
                      child: ListView(
                        children: [
                          /// form fields -------------------------------------------------------------

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
                      CancelButton((){}),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(DeviceInfo.screenWidth! * 0.13,
                              DeviceInfo.screenHeight! * 0.08),
                        ),
                        onPressed: () async {
                            if (_formKey.currentState!.validate()) {

                            }
                          },

                        icon: const Icon(Icons.save),
                        label: Text(
                          'Save ',
                          style: TextStyle(
                            fontSize: DeviceInfo.sizeText,
                          ),
                        ),
                      ),
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
}
