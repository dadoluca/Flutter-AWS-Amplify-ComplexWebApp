import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/widgets/projects_totals_card.dart';
import '../variables/device_info.dart';
import '../widgets/project_item_grid.dart';
import '../widgets/project_item_list.dart';
import '../providers/projects.dart';
import 'empty_list_label.dart';

class ProjectsList extends StatelessWidget {
  const ProjectsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Projects>(
      builder: (ctx, dataSnapshot, _) => Column(
        children: [
          ProjectsTotalsCard(),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: dataSnapshot.projects.isEmpty ?
            const EmptyListLabel('Al momento non sono presenti progetti !')
            :ListView.builder(
              itemCount: dataSnapshot.projects.length,
              itemBuilder: (_, i) => Column(
                children: [
                  ProjectItemList(
                    project: dataSnapshot.projects[i]!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
