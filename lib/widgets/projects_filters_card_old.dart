import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply_project_management/providers/projects.dart';

import '../variables/device_info.dart';
import '../models/Cliente.dart';
import '../providers/customers.dart';

class ProjectsFiltersCardOld extends StatefulWidget {
  const ProjectsFiltersCardOld({Key? key}) : super(key: key);

  @override
  State<ProjectsFiltersCardOld> createState() => _ProjectsFiltersCardOldState();
}

class _ProjectsFiltersCardOldState extends State<ProjectsFiltersCardOld> {
  //String? _selectedClient;

  @override
  Widget build(BuildContext context) {
    DeviceInfo.init(context);
    List<bool> _selectedDate = <bool>[
      Provider.of<Projects>(context, listen: false).selectedDate[0],
      Provider.of<Projects>(context, listen: false).selectedDate[1]];

    return Container(
      padding: EdgeInsets.only(top: DeviceInfo.adattableWidth!*0.02,
          right: DeviceInfo.adattableWidth!*0.01,
        left: DeviceInfo.adattableWidth!*0.02,
      ),
      height: DeviceInfo.screenHeight!*0.22,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(DeviceInfo.adattableWidth! * 0.02)),
        clipBehavior: Clip.antiAlias,
        elevation: 6,
        child: Padding(
          padding:  EdgeInsets.only( left: DeviceInfo.adattableWidth!*0.01,
            right: DeviceInfo.adattableWidth!*0.01,
            bottom: DeviceInfo.adattableWidth!*0.03,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: DeviceInfo.screenHeight!*0.02,),
                Text('FILTRA', style: TextStyle(fontSize: DeviceInfo.sizeTitle3, fontWeight: FontWeight.bold),),
                  SizedBox(height: DeviceInfo.screenHeight!*0.02,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      build_filterByCustomerButton(context),
                      Provider.of<Projects>(context, listen: false).selectedCustomerId != null ? build_resetButton()
                          : const Center(),
                      SizedBox(height: DeviceInfo.screenHeight!*0.03,),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            build_orderByDateButton(context,_selectedDate),
                            SizedBox(height: DeviceInfo.screenHeight!*0.01,),
                            Text('Ordina per data', style: TextStyle(
                              fontSize: DeviceInfo.sizeText,
                              color: Theme.of(context).hintColor,
                            ),),
                          ],
                        ),
                      ),

                    ],
                  ),

              ],
            ),
          ),
        ),
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
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.blue,
              selectedColor: Colors.white,
              fillColor: Theme.of(context).colorScheme.primary,
              color:Colors.blueGrey[200] ,
              constraints:  BoxConstraints(
                minHeight: DeviceInfo.adattableWidth!*0.06,
                minWidth: DeviceInfo.adattableWidth!*0.09,
              ),
              isSelected: _selectedDate,
              children: dateOrder,
            );
  }


  Expanded build_resetButton() {
    return Expanded(
      flex: MediaQuery.of(context).size.width >= 900 ?  2 : 1,
      child: Container(
        margin: EdgeInsets.only(top: DeviceInfo.adattableWidth! * 0.02),
        child:
        MediaQuery.of(context).size.width >= 900 ?
        ElevatedButton(
          onPressed: () {
            setState(() {
              Provider.of<Projects>(context, listen: false).selectedCustomerId = null;
            });
            _refreshProjects();
          },
          child:
          Text('Reset',
              style: TextStyle(
                fontSize: DeviceInfo.sizeText,
              )),
        )
            :CircleAvatar(
          radius: 20,
          child: IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              size: 14,
            ),
            onPressed: () {
              setState(() {
                Provider.of<Projects>(context, listen: false).selectedCustomerId = null;
              });
              _refreshProjects();
            },
          ),
        ),

      ),
    );
  }


  FutureBuilder<void> build_filterByCustomerButton(BuildContext context) {
    return FutureBuilder(
      future:
      Provider.of<Customers>(context, listen: false).fetchAndSetCustomers(),
      builder: (ctx, snapshot) => Expanded(
        flex: Provider.of<Projects>(context, listen: false).selectedCustomerId != null ? 3 : 4,
        child: Container(
          color: Colors.white,
          child: DropdownButton<String?>(
            borderRadius: BorderRadius.circular(8.0),
            hint: Text(
              '     Filtra per cliente',
              style: TextStyle(
                fontSize: DeviceInfo.sizeText,
                color: Theme.of(context).hintColor,
              ),
            ),
            value: Provider.of<Projects>(context, listen: false).selectedCustomerId,
            items: Provider.of<Customers>(context, listen: true)
                .customers
                .map((Cliente? customer) {
              return DropdownMenuItem<String?>(
                value: customer?.id.toString(),
                child: Text(
                  '    ${customer?.nome}',
                  style: TextStyle(
                    fontSize: DeviceInfo.sizeText,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              //print(newValue);
              setState(() {
                Provider.of<Projects>(context, listen: false).selectedCustomerId = newValue;
              });
              _refreshProjects();
            },
          ),
        ),
      ),
    );
  }

  Future<void> _refreshProjects() async {
     await Provider.of<Projects>(context, listen: false)
        .fetchAndSetProjects();
  }

  List<Widget> dateOrder = <Widget>[
    Icon(Icons.arrow_downward, size: DeviceInfo.screenWidth! > 800 ? 20 : 10),
    Icon(Icons.arrow_upward, size: DeviceInfo.screenWidth! > 800 ? 20 : 10),
  ];
}


