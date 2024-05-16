import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/widgets/referent_item_list.dart';
import 'package:reply_project_management/widgets/release_item_list.dart';

import '../providers/customers_referents.dart';
import '../providers/releases.dart';

class ReferentsList extends StatelessWidget {
  const ReferentsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomersReferents>(
      builder: (ctx, dataSnapshot, _) => ListView.builder(
        itemCount:
        dataSnapshot.referents.length,
        itemBuilder: (BuildContext context, int index) {
          return ReferentItemList(
              dataSnapshot.referents[index]!);
        },
      ),
    );
  }
}
