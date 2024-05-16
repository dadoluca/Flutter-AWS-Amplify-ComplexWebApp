import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/widgets/projects_totals_card.dart';
import '../widgets/project_item_grid.dart';
import '../providers/projects.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Consumer<Projects>(
        builder: (ctx, dataSnapshot, _) =>Column(
          children: [
            ProjectsTotalsCard(),
            Expanded(
              child: GridView.builder(
      padding:  EdgeInsets.all(deviceWidth > 600 ? 10.0: 10.0),
      itemCount: dataSnapshot.projects.length,
      itemBuilder: (ctx, i) => ProjectItemGrid(project: dataSnapshot.projects[i]!),
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:deviceWidth > 200 ? deviceWidth > 600 ? deviceWidth > 1000? deviceWidth > 1100 ?
              4 : 3: 2 : 1 : 1,
              childAspectRatio: deviceWidth>600? deviceWidth > 1000 ? deviceWidth > 1100 ?
              12/11: 11/10 : 15/10 : 20/ 10,
              crossAxisSpacing: 4,
              mainAxisSpacing: 10,
      ),
              ),
            ),
          ],
        ),
    );
  }
}
