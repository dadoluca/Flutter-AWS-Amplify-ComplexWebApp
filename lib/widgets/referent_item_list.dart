import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/models/ModelProvider.dart';
import 'package:reply_project_management/variables/my_colors.dart';

import '../models/Release.dart';
import '../providers/releases.dart';
import '../screens/basic_screen.dart';
import '../variables/device_info.dart';
import 'buttons/delete_button.dart';
import 'buttons/edit_button.dart';

class ReferentItemList extends StatelessWidget {
  ReferentItemList(this.referent, {super.key});
  referenteCliente referent;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            DeviceInfo.adattableWidth! * 0.02),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      borderOnForeground: true,
      child: ListTile(
        leading: SizedBox(
          width: 230,
          child: Row(
            children: [
              const Icon(
                FontAwesomeIcons.userTie,
                color: myColors.primary,
                //color: color//Theme.of(context).colorScheme.primary
              ),
              const SizedBox(width: 15,),
              Text(referent?.email
                  .toString() ??'',
              style: TextStyle(
                  fontSize: DeviceInfo.sizeText,),
              ),
            ],
          ),
        ),
        trailing:  SizedBox(
          width: 80,
          child:
          Row(
            children: [
              EditButton(()=> {
                print('TODO')
                ///TODO UpdateReferentForm
                /**
                    Navigator.of(context).pushNamed(BasicScreen.routeName,
                    arguments: {
                    'title':"Modifica Referente",
                    'widget':UpdateReferentForm(referent: referent,), }
                    )*/}),
              DeleteButton(() async => {
                print('TODO')
                ///TODO deleteReferent(referent)
                /**
                    await Provider.of<CustomersReferents>(context, listen:false).deleteReferent(release)
                 */},
                  'Sei sicuro?',    'Vuoi eliminare il referente ${referent.email}?',
                  '${referent.email} eliminato correttamente!', parentContext: context,),
            ],
          ),
        ),
      ),
    );
  }
}
