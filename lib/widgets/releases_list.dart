import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/widgets/release_item_list.dart';

import '../providers/releases.dart';

class ReleasesList extends StatelessWidget {
  const ReleasesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Releases>(
      builder: (ctx, dataSnapshot, _) => ListView.builder(
        itemCount:
        Provider.of<Releases>(context, listen: false)
            .releases
            .length,
        itemBuilder: (BuildContext context, int index) {
          return ReleaseItemList(Provider.of<Releases>(context,listen: false).releases[index]!);
        },
      ),
    );
  }
}
