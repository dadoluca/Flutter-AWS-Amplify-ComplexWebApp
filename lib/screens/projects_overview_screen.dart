import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/screens/home_page.dart';
import 'package:reply_project_management/screens/basic_screen.dart';
import 'package:reply_project_management/widgets/buttons/add_button.dart';
import 'package:reply_project_management/widgets/forms/update_project_form.dart';
import 'package:reply_project_management/widgets/projects_filters_card.dart';
import 'package:reply_project_management/widgets/projects_filters_card_old.dart';
import 'package:reply_project_management/widgets/projects_graphic_card.dart';
import 'package:reply_project_management/widgets/projects_totals_card.dart';
import '../variables/device_info.dart';
import '../graphic_providers/projects_borders.dart';
import '../models/Attivita.dart';
import '../models/Cliente.dart';
import '../graphic_providers/show_grid.dart';
import '../providers/customers.dart';
import '../providers/projects.dart';
import '../widgets/buttons/BluePlan_button_logo.dart';
import '../widgets/forms/insert_project_form.dart';
import '../widgets/projects_grid.dart';
import '../widgets/projects_list.dart';

enum FilterOptions {
  Grid,
  List,
}

class ProjectsOverviewScreen extends StatefulWidget {
  @override
  State<ProjectsOverviewScreen> createState() => _ProjectsOverviewScreenState();
  static const routeName = '/projects-overview-screen';
}

class _ProjectsOverviewScreenState extends State<ProjectsOverviewScreen> {
  var _showFilters = false;
  var _showOldFilters =false; //vecchie card fi filtri e visualizza non più usate
  var _alreadyFetch = false;

  @override
  Widget build(BuildContext context) {
    List<bool> _selectedDate = <bool>[
      Provider.of<Projects>(context, listen: false).selectedDate[0],
      Provider.of<Projects>(context, listen: false).selectedDate[1]];
    DeviceInfo.init(context);
    // Ottiene la larghezza e l'altezza della finestra
    final Size size = MediaQuery.of(context).size;

    // Imposta la larghezza e l'altezza minime della finestra
    const double minWidth = 600;
    const double minHeight = 440;
    return Scaffold(
      appBar: AppBar(
        leading: const BluePlanButtonLogo(),
        leadingWidth: 200,
        title: Text(
          'Censimento Progetti',
          style: TextStyle(fontSize: DeviceInfo.screenWidth! > 800 ? 22 : 18),
        ),
        //centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (BorderOptions selectedValue) {
              setState(() {
                Provider.of<ProjectsBorders>(context,listen: false).selectedBorder=selectedValue;
              });
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                  value: BorderOptions.None, child: Text('Nessun Bordo')),
              const PopupMenuItem(
                  value: BorderOptions.Simple, child: Text('Semplice')),
              const PopupMenuItem(
                  value: BorderOptions.Colored, child: Text('Colorato per cliente')),
            ],
            icon:  Icon(Icons.line_style),
          ),
          SignOutButton(),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width < minWidth ? minWidth : size.width,
          height: size.height < minHeight
              ? minHeight
              : DeviceInfo.screenHeight! * 0.92,
          //height: DeviceInfo.screenHeight! * 0.92,
          child: Column(
            children: [
              _showOldFilters
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: DeviceInfo.adattableWidth! * 0.01),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          //ProjectsTotalsCard(),
                          Expanded(flex: 3, child: ProjectsFiltersCardOld()),
                          Expanded(flex: 2, child: ProjectsGraphicCard()),
                        ],
                      ),
                    )
                  : const SizedBox(
                      height: 15,
                    ),
              _showFilters
                  ? Row(
                      children: [
                        Expanded(child: Center(), flex: 2),
                        Expanded(child: ProjectsFiltersCard(), flex: 42),
                        Expanded(child: Center(), flex: 2),
                      ],
                    )
                  : Center(),
              Expanded(
                flex: 7,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(child: Center(), flex: 2),
                    Expanded(
                        flex: 42,
                        child: FutureBuilder(
                            future: _alreadyFetch
                                ? Future(() => null)
                                : Provider.of<Projects>(context, listen: false)
                                    .fetchAndSetProjects(),
                            builder: (ctx, dataSnapshot) {
                              _alreadyFetch = true;
                              //is loading..
                              if (dataSnapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (dataSnapshot.error != null) {
                                //error handling
                                print(dataSnapshot.error);
                                return const Center(
                                  child: Text('An error occurred!'),
                                );
                              } else {
                                return Consumer<ShowGrid>(
                                    builder: (ctx, orderData, child) => Padding(
                                          padding: EdgeInsets.only(
                                              top: DeviceInfo.adattableWidth! *
                                                  0.00),
                                          child: Provider.of<ShowGrid>(context,
                                                      listen: true)
                                                  .isGrid
                                              ? const ProjectsGrid()
                                              : const ProjectsList(),
                                        ));
                              }
                            })),
                    const Expanded(flex: 2, child: Center()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                _showFilters = !_showFilters;
              });
            },
            elevation: 15,
            icon: _showFilters
                ? const Icon(Icons.visibility_off,color: Colors.white,)
                : const Icon(Icons.filter_list,color: Colors.white,),
            label: _showFilters
                ? const Text('Nascondi filtri',style: TextStyle(color: Colors.white,),)
                : const Text('Filtra',style: TextStyle(color: Colors.white,),),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            width: 10,
          ),
          build_orderByDateButton(context,_selectedDate),
          SizedBox(
            width: 10,
          ),
          AddButton(() {
            Navigator.of(context).pushNamed(BasicScreen.routeName,
                arguments: {
                  'title':"Aggiungi Progetto",
                  'widget':InsertProjectForm(), }
            );

          },),
          SizedBox(
            width: 30,
          )
        ],
      ),
    );
  }

  ToggleButtons build_orderByDateButton(BuildContext context, List<bool> _selectedDate ) {
    return ToggleButtons(
      direction: DeviceInfo.screenWidth! < 600 ? Axis.vertical : Axis.horizontal,
      onPressed: (int index) {
        setState(() {
          // The button that is tapped is set to true, and the others to false.
          for (int i = 0; i < 2; i++) {
            _selectedDate[i] = i == index;
          }
          if(_selectedDate[0]) {
            Provider.of<Projects>(context, listen: false).orderBy_descendingDate();
            Provider.of<Projects>(context, listen: false).selectedDate[0]=true;
            Provider.of<Projects>(context, listen: false).selectedDate[1]=false;

          } else {
            Provider.of<Projects>(context, listen: false).orderBy_ascendingDate();
            Provider.of<Projects>(context, listen: false).selectedDate[0]=false;
            Provider.of<Projects>(context, listen: false).selectedDate[1]=true;
          }
        });
      },
      borderRadius: const BorderRadius.all(Radius.circular(22)),
      selectedColor: Colors.white,
      borderColor:  Theme.of(context).colorScheme.primary,
      selectedBorderColor: Theme.of(context).colorScheme.primary,
      fillColor: Theme.of(context).colorScheme.primary,
      color:Colors.blueGrey[200],
      disabledColor: Colors.white,
      isSelected: _selectedDate,
      children: dateOrderOptions,
    );
  }
  List<Widget> dateOrderOptions = <Widget>[
    Icon(Icons.arrow_downward, size: DeviceInfo.screenWidth! > 800 ? 20 : 10),
    Icon(Icons.arrow_upward, size: DeviceInfo.screenWidth! > 800 ? 20 : 10),
  ];
}
