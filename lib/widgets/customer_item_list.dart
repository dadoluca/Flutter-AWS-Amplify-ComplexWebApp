import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/models/Cliente.dart';
import 'package:reply_project_management/variables/my_colors.dart';
import 'package:reply_project_management/widgets/buttons/edit_button.dart';

import '../screens/basic_screen.dart';
import '../screens/customer_detail_screen.dart';
import '../variables/device_info.dart';
import '../providers/customers.dart';
import 'buttons/delete_button.dart';
import 'forms/update_costumer_form.dart';

class CustomerItemList extends StatelessWidget {
   CustomerItemList( this.customer, {super.key});
 Cliente customer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius:
        BorderRadius.circular(DeviceInfo.adattableWidth! * 0.05),
        onTap: () {
          Navigator.of(context).pushNamed(
            CustomerDetailScreen.routeName,
            arguments: customer,
          );
        },
        hoverColor: myColors.primary.withOpacity(0.4),
        child: MouseRegion(
          cursor: SystemMouseCursors.basic,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  DeviceInfo.adattableWidth! * 0.05),
            ),
              clipBehavior: Clip.antiAlias,
              elevation: 1,
              borderOnForeground: true,
                child: ListTile(
                   mouseCursor: SystemMouseCursors.click,
                  leading: Icon(Icons.circle_outlined, size:20, color: Provider.of<Customers>(context, listen: false).getColor(customer.id),),
                  title: Text(customer.nome ?? ''),
                  trailing: SizedBox(
                    width: 80,
                    child:

                    Row(
                      children: [
                        EditButton(()=> Navigator.of(context).pushNamed(BasicScreen.routeName,
                              arguments: {
                                'title':"Modifica Cliente",
                                'widget':UpdateCostumerForm(customer: customer,), }
                          )),
                        DeleteButton(
                                () async => await Provider.of<Customers>(context, listen:false).deleteCustomer(customer),
                            'Sei sicuro?',    'Vuoi eliminare il cliente ${customer.nome}?',
                            '${customer.nome} eliminato correttamente!', parentContext: context,),
                      ],
                    ),
                  ),
                ),
              )
          ),

    );
  }
}
