import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/providers/customers_referents.dart';
import 'package:reply_project_management/widgets/referents_list.dart';
import '../variables/my_colors.dart';
import '../screens/basic_screen.dart';
import '../variables/device_info.dart';
import 'buttons/add_button.dart';
import 'empty_list_label.dart';
import 'forms/insert_referent_form.dart';
class CustomerReferentsSection extends StatelessWidget {
  const CustomerReferentsSection(this.customerId);

  final String? customerId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
          future: Provider.of<CustomersReferents>(context, listen: false)
              .fetchAndSetReferents(customerId ?? ''),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Expanded(
                child: Container(
                  padding:const EdgeInsets.only(
                      top:15, left: 20, right: 20, bottom: 10),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('REFERENTI', style: TextStyle(fontSize: DeviceInfo.sizeTitle1!,
                            fontWeight: FontWeight.bold, color:myColors.primary),),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Stack (
                          children: [
                            Provider.of<CustomersReferents>(context, listen: false).referents.isEmpty
                                ? const EmptyListLabel(
                                  'Al momento non sono ancora presenti referenti !')
                                : const ReferentsList(),
                            Positioned(
                              bottom: 16,
                              right: 16,
                              child: AddButton(() {
                                Navigator.of(context)
                                    .pushNamed(BasicScreen.routeName, arguments: {
                                  'title': "Aggiungi Referente",
                                  'widget': InsertReferentForm(customerId!),
                                });
                              }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
    );
  }
}
