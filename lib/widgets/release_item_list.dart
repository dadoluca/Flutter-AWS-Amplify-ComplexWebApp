import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/variables/my_colors.dart';

import '../models/Release.dart';
import '../providers/releases.dart';
import '../screens/basic_screen.dart';
import '../variables/device_info.dart';
import 'buttons/delete_button.dart';
import 'buttons/edit_button.dart';

class ReleaseItemList extends StatelessWidget {
  ReleaseItemList(this.release, {super.key});
  Release release;

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
          width: 130,
          child: Row(
            children: [
              Icon(
                Icons.calendar_month,
                color: myColors.primary,
                //color: color//Theme.of(context).colorScheme.primary
              ),
              const SizedBox(width: 15,),
              Text(release?.data
                  .toString() ??'',
              style: TextStyle(
                  fontSize: DeviceInfo.sizeText,),
              ),
            ],
          ),
        ),
        title: Text(release?.titolo ??
            ''),
        trailing:  SizedBox(
          width: 80,
          child:

          Row(
            children: [
              EditButton(()=> {
                print('TODO')
                ///TODO UpdateReleaseForm
                /**
                    Navigator.of(context).pushNamed(BasicScreen.routeName,
                    arguments: {
                    'title':"Modifica Release",
                    'widget':UpdateReleaseForm(release: release,), }
                    )*/}),
              DeleteButton(() async =>await Provider.of<Releases>(context, listen:false).deleteRelease(release),
                  'Sei sicuro?',    'Vuoi eliminare la release ${release.titolo}?',
                  '${release.titolo} eliminato correttamente!', parentContext: context,),
            ],
          ),
        ),
      ),
    );
  }
}
