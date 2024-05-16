import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/widgets/releases_list.dart';
import '../providers/releases.dart';
import '../screens/basic_screen.dart';
import '../variables/device_info.dart';
import '../variables/my_colors.dart';
import 'buttons/add_button.dart';
import 'empty_list_label.dart';
import 'forms/insert_release_form.dart';

class CustomerReleasesSection extends StatelessWidget {
  const CustomerReleasesSection(this.customerId);

  final String? customerId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<Releases>(context, listen: false)
            .fetchAndSetReleases(customerId ?? ''),
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
                          Text('RELEASES', style: TextStyle(fontSize: DeviceInfo.sizeTitle1!,
                              fontWeight: FontWeight.bold,
                          color: myColors.primary),),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Stack (
                        children: [
                          Provider.of<Releases>(context, listen: false).releases.isEmpty
                              ? const EmptyListLabel(
                                      'Al momento non sono ancora presenti release !')
                              : const ReleasesList(),
                          Positioned(
                            bottom: 16,
                            right: 16,
                            child: AddButton(() {
                              Navigator.of(context)
                                  .pushNamed(BasicScreen.routeName, arguments: {
                                'title': "Aggiungi Releases",
                                'widget': InsertReleaseForm(customerId!),
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
        });
  }
}
