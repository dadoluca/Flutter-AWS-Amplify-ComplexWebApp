import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/variables/my_colors.dart';
import 'package:reply_project_management/widgets/customer_referents_section.dart';
import 'package:reply_project_management/widgets/customer_releases_section.dart';
import '../models/Cliente.dart';
import '../providers/customers.dart';
import '../variables/device_info.dart';
import 'dart:math';
import '../providers/projects.dart';
import '../widgets/buttons/add_button.dart';
import '../widgets/buttons/delete_button.dart';
import '../widgets/buttons/edit_button.dart';
import '../widgets/forms/update_costumer_form.dart';
import 'basic_screen.dart';

class CustomerDetailScreen extends StatelessWidget {
  static const routeName = '/customer-detail';

  @override
  Widget build(BuildContext context) {
    Cliente? loadedCustomer = ModalRoute.of(context)?.settings.arguments as Cliente?;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Dettagli Cliente:  ${loadedCustomer?.nome}'),
        actions: [
          EditButton(()=> Navigator.of(context).pushNamed(BasicScreen.routeName,
            arguments: {
              'title':"Modifica Cliente",
              'widget':UpdateCostumerForm(customer: loadedCustomer!,), }
        ),color: Colors.white,),
          DeleteButton(
                  () async => await Provider.of<Customers>(context, listen:false).deleteCustomer(loadedCustomer!),
              'Sei sicuro?',    'Vuoi eliminare il cliente ${loadedCustomer!.nome}?',
              '${loadedCustomer!.nome} eliminato correttamente!', parentContext: context,
            color: Colors.white,),
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 900) {
            return  Row(
                children: [
                  CustomerReleasesSection(loadedCustomer?.id),
                  VerticalDivider(
                    color: myColors.primary.withOpacity(0.5),
                    thickness: 1,
                    width: 1,
                    indent: 30,
                    endIndent: 30,
                  ),
                  CustomerReferentsSection(loadedCustomer?.id)
          ]
            );
          } else {
            return Column(
              children: [
                CustomerReleasesSection(loadedCustomer?.id),
                Divider(
                  color: myColors.primary.withOpacity(0.5),
                  thickness: 1,
                  height: 1,
                  indent: 30,
                  endIndent: 30,
                ),
                CustomerReferentsSection(loadedCustomer?.id)
              ],
            );
          }
        },
      ),
    );
  }
}